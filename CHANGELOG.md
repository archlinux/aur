# Change Log
All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](http://semver.org/).  
The format is based on [Keep a Changelog](http://keepachangelog.com/).

## 1.3.0 - 2021-03-25
 - add fastapi support #65

## 1.2.11 - 2020-11-07
 - fix Sanip IP information is a str not a list #63
 
## 1.2.10 - 2020-10-15
 - re fix #61 Using root logger + flask outside of flask request context throws RuntimeError

## 1.2.9 - 2020-10-15
 - Fix #61 Using root logger + flask outside of flask request context throws RuntimeError

## 1.2.8 - 2020-08-27
 - Fix #57

## 1.2.7 - 2020-08-27
 - yanked, wrong branch released

## 1.2.6 - 2020-08-05
 - Fix condition for checking root logger handlers #53

## 1.2.5 - 2020-08-04
 - fix #44
 
## 1.2.4 - 2020-08-03
 - fix #51

## 1.2.2 - 2020-07-14
 - fix #50
 
## 1.2.1 - 2020-07-14
 - fix #49
 
## 1.2.0 - 2020-04-10
 - fix #45
 - fix #46
 - refactoring
 - optimization log record

## 1.1.0 - 2020-04-10
 - Add the possibility to modify the formatter for request logs.
 
## 1.0.4 - 2019-07-20
 - fix #30 

## 1.0.3 - 2019-07-20
 - add missing kwargs for init_non_web

## 1.0.2 - 2019-07-20
 - add method to support getting request logger by using method json_logging.get_request_logger(), fix #23

## 1.0.1 - 2019-07-20
 - prevent log forging, fix #1

## 1.0.0 - 2019-07-20
Breaking change:
 - add more specific init method for each framework
 - minor correct for ENABLE_JSON_LOGGING_DEBUG behaviour
 - update few code comments
 
## 0.1.2 - 2019-06-25
 - fix: add japanese character encoding for json logger #24
 
## 0.1.1 - 2019-05-22
 - fix: connexion under gunicorn has no has_request() #22
 
## 0.1.0 - 2019-05-20
 - Add [Connexion](https://github.com/zalando/connexion) support

## 0.0.13 - 2019-05-18
 - Fix #19

## 0.0.12 - 2019-02-26
 - Fix #16

## 0.0.11 - 2019-01-26
 - Adds functionality to customize the the JSON - change keys, values, etc.
 
## 0.0.10 - 2018-12-04
 - Support for exception tracing exception

## 0.0.9 - 2018-10-16
 - Add Quart framework support

## 0.0.2 - 2017-12-24

### Changed
- fixed https://github.com/thangbn/json-logging-python/pull/2 

## 0.0.1 - 2017-12-24

### Changed
- Initial release
