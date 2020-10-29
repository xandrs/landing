*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown    
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am insde Test Teardown

Default Tags    sanity            

*** Test Cases ***
MyFirstTest
     Log    Hello World...    
     
FirstSeleniumTest
    Open Browser    https://google.com    chrome
    Set Browser Implicit Wait    5
    Input Text    name=q    robot framework zoomba
    Sleep    3 
    Press Keys    name=q    ENTER
    # Click Button    name=btnK    
    Sleep    2    
    Close Browser
    Log    Test completed    
    
SampleLoginTest
    [Documentation]    This is a sample login test
    Open Browser      ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW         
    Click Element     id=welcome
    Sleep    5       
    Click Element     link=Logout
    Close Browser
    Log               Test completed  
    
*** Variables ***
${URL}       https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    ${CREDENTIALS}[0]
    Input Password    id=txtPassword    ${LOGINDATA}[password]
    Click Button      id=btnLogin