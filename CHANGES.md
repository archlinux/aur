![LittleBrother-Logo](little_brother/static/icons/icon-baby-panda-128x128.png)

# Change History 

This document lists all changes of `LittleBrother` with the most recent changes at the top.

## Version 0.4.12 Revision 112 (December 29th, 2021)

* Closes #87, see [here](https://github.com/marcus67/little_brother/issues/87)
* Add hyperlinks to snap installation documentation
* Include changes of the Italian translation

## Version 0.4.11 Revision 110 (November 22nd, 2021)

* Requeue outgoing events on slave in case API call was not successful (potential fix for 
  [issue 157](https://github.com/marcus67/little_brother/issues/157))

## Version 0.4.10 Revision 109 (October 12th, 2021)

* Show snap runtime in topology view
* Closes #156, see [here](https://github.com/marcus67/little_brother/issues/156)

## Version 0.4.9 Revision 108 (September 14th, 2021)

* Remove old extra panel from Grafana sample configuration 
* Reduce cognitive complexity in classes `AdminDataHandler` and `UsersViewHandler`
* Only display in admin view users that are being monitored (fixes runtime error after removing users from monitoring)
* Exclude `run_python_base_app_test_suite_no_venv.py` from SonarQube coverage check
* Closes #150, see [here](https://github.com/marcus67/little_brother/issues/150)
* Remove (most) comments from generated Jinja2 HTML pages 
* Added test cases for `DefaultContextRuleHandler` and `ClientProcessHandler`
* Make sure LittleBrother will not kill processes that do not belong to monitored user anymore
* Closes #144, see [here](https://github.com/marcus67/little_brother/issues/144)
* Closes #138, see [here](https://github.com/marcus67/little_brother/issues/138)
* Added test cases for `ClientInfo`, `Persistence`, and `PersistentDailyUserStatusEntityManager`
* Fix alembic at 1.5.8
* Exclude markdown files from Codacy reports
* Closes #154, see [here](https://github.com/marcus67/little_brother/issues/154)
* Upgrade WTForms to version 3.0.0a1


## Version 0.4.8 Revision 107 (August 21th, 2021)

*   Closes #130, see [here](https://github.com/marcus67/little_brother/issues/130)
*   Provide `ruleset_check_interval` in `UserStatus`
*   Correct conversion of optional time from seconds to minutes
*   Update Italian localization
*   Add option `--allow-releaseinfo-change` to `apt-get update`
*   Correct minor errors in Grafana sample configuration ("Request Count by Service" and "Request Count by Hostname")
*   Use table for panel "Nodes (Uptime)" in Grafana sample configuration
*   Closes #146, see [here](https://github.com/marcus67/little_brother/issues/146)

## Version 0.4.7 Revision 103 (July 4th, 2021)

*   Delete all user status entries when deleting a user
*   Correct description of rule configuration using days of the week
*   Closes #149, see [here](https://github.com/marcus67/little_brother/issues/149)

## Version 0.4.6 Revision 102 (July 1st, 2021)

*   New class `DailyUserStatus`
*   Move `MasterConnector` to subdirectory `api`
*   Closes #148, see [here](https://github.com/marcus67/little_brother/issues/148)

## Version 0.4.5 Revision 101 (June 6th, 2021)

*   Fix problem with remaining time not being computed correctly with time extension before min time of day

## Version 0.4.5 Revision 100 (June 1st, 2021)

*   Added test class `TestApiViewHandler`
*   Fix problem with remaining time not being computed correctly with time extension after the max time of day
*   Fix problem with unlimited playtime not being displayed in `LittleBrotherTaskbar` after activating free play

## Version 0.4.4 Revision 99 (May 29th, 2021)

*   Closes #129, see [here](https://github.com/marcus67/little_brother/issues/129)
*   Added "What's New" section in README.md 

## Version 0.4.3 Revision 98 (May 26th, 2021)

*   Closes #143, see [here](https://github.com/marcus67/little_brother/issues/143)
*   Start on https://github.com/marcus67/little_brother/issues/129

## Version 0.4.2 Revision 97 (May 23rd, 2021)

*   Activate CSRF for all interactive pages
*   Better handling of logout notifications
*   Fix problem with time extensions just before regular time expires
*   Include remaining break time in applying rules details list

## Version 0.4.1 Revision 96 (May 15th, 2021)

*   Introduce base class `BasePersistentEntityManagerTest`
*   Move all persistence modules to a folder of their own 
*   Split up test class `TestStatusServer`
*   Add test cases for users page: 
    *   add and delete user, edit user,
    *   assign/unassign rule set, 
    *   move up/down rule set,
    *   assign/unassign device
*   Add test cases for devices page: add and delete device, edit device
*   Add test cases for admin page: edit rule override, add, extend, and delete time extension
*   Add test cases for invalid data in rule override and device
*   Move web test cases to a folder of their own
*   Closes #133, see [here](https://github.com/marcus67/little_brother/issues/133)
*   Create mix in class `PersistenceDependencyInjectionMixIn`
*   Split up class `StatusServer` and move to new sub folder
*   Created classes `AdminDataHandler` and `UserLocaleHandler`
*   Error page for internal errors during HTML template evaluation
*   Created class `EventHandler`
*   Created classes `ProcessHandlerManager` and `Language`
*   Closes #141, see [here](https://github.com/marcus67/little_brother/issues/141)
*   Created class `UserManager`
*   Handle exception during page rendering by displaying error page
*   Move RuleResultInfo to file of its own
*   Simplify handling of remaining session time
*   Remove Sonarqube code smells 
*   Test unit for classes `Language`, `App`, `UserStatus`, `MasterConnector`, and `ProcessHandlerManager`
*   Bump `python_base_app` to 0.2.19 

## Version 0.4.0 Revision 90 (April 2nd, 2021)

*   Split file persistence.py into separate class files
*   New class `BaseEntityManager`
*   New test unit class `TestPersistentTimeExtension`
*   Introduce entity managers for persistent entities rule set, user,  and time extension
*   Introduce dependency injection using module `lagom`
*   Clean up translation files
*   Closes #135, see [here](https://github.com/marcus67/little_brother/issues/135)
*   Closes #136, see [here](https://github.com/marcus67/little_brother/issues/136)
*   Closes #124, see [here](https://github.com/marcus67/little_brother/issues/124)
*   Closes #137, see [here](https://github.com/marcus67/little_brother/issues/137)

## Version 0.3.14 Revision 86 (March 25th, 2021)

*   Closes #131, see [here](https://github.com/marcus67/little_brother/issues/131)

## Version 0.3.13 Revision 85 (March 22nd, 2021)

*   Closes #125, see [here](https://github.com/marcus67/little_brother/issues/125)
*   Closes #76, see [here](https://github.com/marcus67/little_brother/issues/76)
*   Closes #82, see [here](https://github.com/marcus67/little_brother/issues/82)
*   Closes #126, see [here](https://github.com/marcus67/little_brother/issues/126)
*   Closes #127, see [here](https://github.com/marcus67/little_brother/issues/127)

## Version 0.3.13 Revision 84 (March 6th, 2021)

*   Closes #12, see [here](https://github.com/marcus67/little_brother/issues/12)
*   Closes #117, see [here](https://github.com/marcus67/little_brother/issues/117)
*   Closes #20, see [here](https://github.com/marcus67/little_brother/issues/20)

## Version 0.3.12 Revision 83 (February 6th, 2021)

*   Closes #101, see [here](https://github.com/marcus67/little_brother/issues/101)
*   Closes #118, see [here](https://github.com/marcus67/little_brother/issues/118)
*   Closes #120, see [here](https://github.com/marcus67/little_brother/issues/120)
*   Greatly improved layouts of web interface for smaller screens
*   Optional use of [ProxyPing](https://github.com/marcus67/proxy_ping)
*   Closes #115, see [here](https://github.com/marcus67/little_brother/issues/115)
*   Accepts [pull request regarding scanning whole command lines](https://github.com/marcus67/little_brother/pull/119)
*   Simplified service URLs in Grafana dashboard 
*   Accepts [pull request regarding Italian localization](https://github.com/marcus67/little_brother/pull/121)
*   Accepts [pull request regarding French localization](https://github.com/marcus67/little_brother/pull/122)
*   Add option to activate/deactivate the scanning of complete command lines
*   Updated Grafana dashboard

## Version 0.3.11 Revision 82 (February 6th, 2021)

*   Closes #28, see [here](https://github.com/marcus67/little_brother/issues/28)
*   Closes #113, see [here](https://github.com/marcus67/little_brother/issues/113)
*   Closes #112 (presumably), see [here](https://github.com/marcus67/little_brother/issues/112)
*   Closes #58 (presumably), see [here](https://github.com/marcus67/little_brother/issues/58)
*   Closes #110, see [here](https://github.com/marcus67/little_brother/issues/110)
*   Closes #86, see [here](https://github.com/marcus67/little_brother/issues/86)

## Version 0.3.10 Revision 81 (January 17th, 2021)

*   Upgrade to python_base_app 0.2.9
*   Update CI configuration for GitLab-CI
*   Fixed bug with not using correct locale for texts regarding approaching logout
*   Reactivate sending of client stats (was commented out for testing)
*   Correct test case
*   Add apt-get update to Dockerfile

## Version 0.3.9 Revision 80 (January 9th, 2021)

*   Upgrade to python_base_app 0.2.7
*   Closes #28, see [here](https://github.com/marcus67/little_brother/issues/28)
*   Closes #108, see [here](https://github.com/marcus67/little_brother/issues/108)
*   Update Grafana default configuration to reflect new meta data from clients

## Version 0.3.8 Revision 79 (January 2nd, 2021)

*   Upgrade to python_base_app 0.2.6

## Version 0.3.7 Revision 78 (January 1st, 2021)

*   Increment PiPy version number 

## Version 0.3.6 Revision 78 (November 28nd, 2020)

*   Provide configuration option to set hostname 
*   Closes #27, see [here](https://github.com/marcus67/little_brother/issues/27)
*   Upgrade (almost) all required PyPi libraries

## Version 0.3.5 Revision 77 (September 30th, 2020)

*   Add two diagrams on application architecture 
*   Move aspects of Docker image and container to new [repository](https://github.com/marcus67/docker-little-brother)
*   Support env variables `APP_SECRET` and `LOGLEVEL` in Docker container
*   Activate local webserver in Docker container to support health check

## Version 0.3.4 Revision 76 (September 16th, 2020)

*   Provide link to new installation documentation in README.md.

## Version 0.3.3 Revision 75 (September 12th, 2020)

*   Using renamed library some_flask_helpers (instead of flask_helpers)
*   Add documentation page about non-Debian installation

## Version 0.3.2 Revision 74 (September 12th, 2020)

*   Added Croatian localization (locale "hr")
*   Publish master branch to [PyPi-Test](https://test.pypi.org/)

## Version 0.3.1 Revision 73 (September 6th, 2020)

*   Closes #97, see [here](https://github.com/marcus67/little_brother/issues/97)

## Version 0.3.1 Revision 72 (August 6th, 2020)

*   Added second YouTube video

## Version 0.3.1 Revision 71 (August 6th, 2020)

*   Issue warning when kill command returns non-empty stderr
*   Fixed problem with notification in wrong locale being passed on to LittleBrotherTaskbar 

## Version 0.3.1 Revision 70 (August 4th, 2020)

*   Publish slide deck used in YouTube video

## Version 0.3.1 Revision 69 (July 30th, 2020)

*   Closes #85, see [here](https://github.com/marcus67/little_brother/issues/85)
*   Add table of YouTube videos to README
*   Activate Spanish translation 

## Version 0.3.1 Revision 68 (July 20th, 2020)

*   Closes #98, see [here](https://github.com/marcus67/little_brother/issues/98)
*   Closes #99, see [here](https://github.com/marcus67/little_brother/issues/99)

## Version 0.3.1 Revision 67 (July 20th, 2020)

*   Fix issue with master process not detecting user activity when new users are activated
*   Change the default configuration on the Docker slave image:
    *   Set sqlite as the default backend
    *   Deactivate audio output and pop notifications

## Version 0.3.0 Revision 66 (July 20th, 2020)

*   Update Italian localization (locale "it")
*   Issue error when no database user is given when driver != sqlite
*   Register logging filter for alembic
*   Add latest change date of translations as column to localization table

## Version 0.3.0 Revision 65 (July 18th, 2020)
    
*   Add Spanish localization (locale "es")

## Version 0.3.0 Revision 64 (July 18th, 2020)

*   New Prometheus gauge `little_brother_configured_users`
*   Configuration for Prometheus port in test cases
*   Completely revised status handling in class `ClientDeviceHandler`
*   Use `percent` in `User2Device` to compute fractional playtime on devices
*   Closes #78, see [here](https://github.com/marcus67/little_brother/issues/78)
*   Closes #90, see [here](https://github.com/marcus67/little_brother/issues/90)
*   Closes #38, see [here](https://github.com/marcus67/little_brother/issues/38)
*   Closes #39, see [here](https://github.com/marcus67/little_brother/issues/39)
*   Closes #88, see [here](https://github.com/marcus67/little_brother/issues/88)
*   Closes #91, see [here](https://github.com/marcus67/little_brother/issues/91)
*   Provide configuration file for apparmor
*   Move creation of `/var/run/little-brother` from service configuration to tmpfiles.d configuration
*   Completely revised documentation
*   Catch exception while retrieving data on the German vacation schedules.
*   Include local installation of fontawesome
*   Deactivate settings changes to log handling by alembic
*   Support broadcasting of user settings, activate on all relevant changes
*   Increase connection pool size
*   Activate mandatory sqlite backend for slaves
*   Make sure database session are always closed
*   Deploy etc/master.config as a template
*   Closes #93, see [here](https://github.com/marcus67/little_brother/issues/93)
*   Do not schedule tasks too far into the future
 
## Version 0.2.3 Revision 63 (May 23rd, 2020)

*   Add Danish localization (locale "da")
*   Minor corrections to Bangla translation
*   Closes #89, see [here](https://github.com/marcus67/little_brother/issues/89)

## Version 0.2.2 Revision 62 (May 6th, 2020)

*   Added Finnish localization (locale "nl")
*   Added Turkish localization (locale "tr")
*   Added Russian localization (locale "ru")
*   Added Japanese localization (locale "ja")
*   Added Bangla localization (locale "bn")
*   Added French localization (locale "fr")
*   Added Thai localization (locale "th")
*   Added two Prometheus metrics to provide version information and uptime
*   Updated Grafana dashboard 
*   Optional font scaling depending on request locale (for e.g. Bangla)
*   Closes #79, see [here](https://github.com/marcus67/little_brother/issues/79)
*   Add test cases for classes `RuleHandler` and `AppControl`
*   Closes #56, see [here](https://github.com/marcus67/little_brother/issues/56)
*   Closes #74, see [here](https://github.com/marcus67/little_brother/issues/74)
*   Closes #40, see [here](https://github.com/marcus67/little_brother/issues/40)
*   Upgrade to `python_base_app` version 0.1.9

## Version 0.2.1 Revision 61 (April 18th, 2020)

*   Closes #23, see [here](https://github.com/marcus67/little_brother/issues/23)
*   Closes #54, see [here](https://github.com/marcus67/little_brother/issues/54)
*   Closes #73, see [here](https://github.com/marcus67/little_brother/issues/73)
*   Added country flags to the README
*   Provided sample configuration for Grafana
*   Added Dutch localization (locale "nl")
*   Use completely localized date format (including day of week) for admin page
*   Show supported languages on the "About" page
*   Upgrade to `python_base_app` version 0.1.8

## Version 0.2 Revision 60 (April 13th, 2020)

*   Closes #68, see [here](https://github.com/marcus67/little_brother/issues/68)
*   Closes #69, see [here](https://github.com/marcus67/little_brother/issues/69)
*   Remove some Codacy warnings

## Version 0.2 Revision 59 (April 12th, 2020)

*   Export locale and current notification message for use in LittleBrotherTaskbar
*   Supply missing Italian translations and correct some variable references in them 

## Version 0.2 Revision 58 (April 12th, 2020)

*   Moved helper classes for audio handling from LittleBrother to python_base_app

## Version 0.2 Revision 57 (April 11th, 2020)

*   Mention new `LittleBrotherTaskbar` in `README.md`
*   Remove `python-base-app` from `requirements.txt`

## Version 0.2 Revision 56 (April 8th, 2020)

*   Upgrade to new `python_base_app`
*   Dynamically generate `install_requires` in `setup.py`

## Version 0.2 Revision 55 (April 1st, 2020)

*   Move taskbar app into a [repository](https://github.com/marcus67/little_brother_taskbar) of its own
*   Split setup configuration into standard and extended settings 
*   Remove superfluous entries in MANIFEST.in

## Version 0.2 Revision 54 (March 24th, 2020)

*   Remove speech engine support for `pyttsx3` due to [issue 67](https://github.com/marcus67/little_brother/issues/67)
*   Fixes #67
*   Remove audio player support for `playsound` due to persisting issues with import of module `gi` 
*   Add taskbar app (see [issue 66](https://github.com/marcus67/little_brother/issues/66))
*   Update calendar handler for German school vacation to API version 2.0

## Version 0.2 Revision 53 (March 7th, 2020)

*   Move alembic files into package directory to make them available in the pip installation directory
*   Add command line option '--stamp-databases' to force an alembic database revision  
*   Correct alembic.sh (invalid use of env variable)
*   Correct German translation
*   Exclude alembic delta scripts from duplicate checks (after move of directory)

## Version 0.2 Revision 52 (March 4th, 2020)

*   Add troubleshooting page. 

## Version 0.2 Revision 51 (February 26th, 2020)

*   Upgrade PIP package `codecov` to version 2.0.16 due to 
    [CVE-2019-10800](https://snyk.io/vuln/SNYK-PYTHON-CODECOV-552149) 

## Version 0.2 Revision 50 (January 3rd, 2020)

*   Try both paths `/usr/bin/pip3` and `/usr/local/bin/pip3` during Debian package post installation
*   Install PIP package `setuptools` during Debian package post installation 
*   Add `python-dev` and `python3-dev` to Debian dependencies

## Version 0.2 Revision 49 (January 1st, 2020)

*   Remove some coding warnings
*   Add test cases for class ClientDeviceHandler
*   Add specific versions to apt-get packages in Dockerfile

## Version 0.1 Revision 48 (December 26th, 2019)

*   Added Docker image for slave process
*   Support for overriding of settings using environment
*   Abstraction of the audio engine (class `BaseAudioPlayer`)
*   Support for `mpg123` as audio engine (new)
*   Support for `playsound` as audio engine (rewritten as engine)
*   Support for `pyglet` as audio engine (new)
*   Correct handling of default locale on slave device
*   Distribution of login mappings from master to slave (for Docker containers and macOS)
*   New CI stage to build docker images
*   Consistent hiding of sensitive variable values in logging
*   Packages `sudo` and `procps` added to the Debian package dependencies
*   Explicit call of `pip3` using absolute path in Debian control file 
*   Closes #53, see [here](https://github.com/marcus67/little_brother/issues/53)
*   Provide simple shell script to grant message clients access to X server
*   Several test cases added

## Version 0.1 Revision 47 (October 26th, 2019)

*   Fixed problem with generated kill command under Linux
*   Fixed several issues reported by Codacy
*   Turned CI status into a table (including macOS branch)

## Version 0.1 Revision 46 (October 25th, 2019)

*   Generate script for building Docker images
*   Add list typed option values to configuration files
*   Improve test coverage of Configuration.py
*   Provide initial Docker images for little-brother servers (non-functional)

## Version 0.1 Revision 45 (October 21st, 2019)

*   Closes #60, see [here](https://github.com/marcus67/little_brother/issues/60)
*   Make ProcessControl an abstract base class
*   Use launchctl to terminate login process under macOS
*   Remove duplicate PopupHandler section in minimal-master.config
*   Switch to effective user id in process infos
*   Add missing -SIGHUP for macOS kill command
*   Use ConfigurationException

## Version 0.1 Revision 44 (October 9th, 2019)

*   Closes #30, see [here](https://github.com/marcus67/little_brother/issues/30)
*   Closes #4, see [here](https://github.com/marcus67/little_brother/issues/4)
*   Increased default value for DEFAULT_MINIMUM_DOWNTIME_DURATION to 20
*   Improved exception handling upon startup
*   Improved security of `Popen` by using `shlex`

## Version 0.1 Revision 43 (October 5th, 2019)

*   Closes #8 again, see [here](https://github.com/marcus67/little_brother/issues/8) after actually considering
    downtimes in statistics

*   Fix some minor code quality problems reported by Codacy 

*   Added output of downtime values to status page using font color yellow.

*   Increase test coverage for popup_handler.py and rule_handler.py

## Version 0.1 Revision 42 (October 5th, 2019)

*   Closes #8, see [here](https://github.com/marcus67/little_brother/issues/8)
*   Fix some minor code quality problems reported by Codacy 
*   Provide special builtin methods to RecurringTask to eliminate tuple handling

## Version 0.1 Revision 41 (June 20th, 2019)

*   Closes #7, see [here](https://github.com/marcus67/little_brother/issues/7) 
    (has actually already been taken care of in previous commits)

*   Closes #16, see [here](https://github.com/marcus67/little_brother/issues/16)

*   Introduce alembic for database initialization and migration

## Version 0.1 Revision 40 (June 9th, 2019)

*   Actually committed the Italian localization (files were missing, mea culpa) 
*   Corrected name of fourth popup tool in sample configuration files
*   Added YouTube presentation

## Version 0.1 Revision 39 (June 5th, 2019)

*   [Albano Battistella](https://github.com/albanobattistella) provided the Italian translation. Thanks! 
*   Fixed some typos in the README file.

## Version 0.1 Revision 38 (June 2nd, 2019)

*   Small changes in README.md and sample configuration file reflecting test installation 
    from scratch on Ubuntu 18.10.

## Version 0.1 Revision 37 (May 29th, 2019)

*   Prepare pybabel files for Italian

## Version 0.1 Revision 36 (May 29th, 2019)

*   Closes #51, see [here](https://github.com/marcus67/little_brother/issues/51)
*   Change defaults for database driver (to match pre-loaded PIP package for mysql)

## Version 0.1 Revision 35 (June 1st, 2019)

*   Closes #9, see [here](https://github.com/marcus67/little_brother/issues/9)
*   Closes #50, see [here](https://github.com/marcus67/little_brother/issues/50)
*   Improve test coverage.

## Version 0.1 Revision 34 (May 26th, 2019)

*   Closes #13, see [here](https://github.com/marcus67/little_brother/issues/13)
*   Improve test coverage.
*   Choose better colors grades for nested rows in admin and index pages

## Version 0.1 Revision 33 (May 11th, 2019)

*   Boost test coverage.
*   Several changes proposed by codacy.
*   Add `post_process` to class `configuration.ConfigModel`

## Version 0.1 Revision 32 (May 9th, 2019)

*   Several changes proposed by codacy.

## Version 0.1 Revision 31 (May 8th, 2019)

*   Closes #44, see [here](https://github.com/marcus67/little_brother/issues/44)
*   Add hyperlink to [Facebook page](https://www.facebook.com/littlebrotherdebian/)

## Version 0.1 Revision 30 (May 4th, 2019)

*   Closes #15, see [here](https://github.com/marcus67/little_brother/issues/15)
*   Several changes proposed by codacy.

## Version 0.1 Revision 29 (May 4th, 2019)

*   Closes #5, see [here](https://github.com/marcus67/little_brother/issues/5)
*   Closes #10, see [here](https://github.com/marcus67/little_brother/issues/10)
*   Closes #14, see [here](https://github.com/marcus67/little_brother/issues/10)
*   Round remaining play times to the nearest minute in notifications.
*   Instantiate flask_wtf.FlaskForm instead of flask_wtf.Form (obsolete).
*   Several changes proposed by codacy.
  
## Version 0.1 Revision 28 (May 2nd, 2019)

*   Add code quality badge by codacy to README.md.
*   Make first improvements to code found by codacy.

## Version 0.1 Revision 27 (May 1st, 2019)

*   Closes #17, see [here](https://github.com/marcus67/little_brother/issues/17)
*   Closes #18, see [here](https://github.com/marcus67/little_brother/issues/18)
*   Closes #35, see [here](https://github.com/marcus67/little_brother/issues/35)
*   Closes #36, see [here](https://github.com/marcus67/little_brother/issues/36)
*   Improve test coverage of process_statistics.py.
*   Include requirement.txt to be scanned by snyk.io.

## Version 0.1 Revision 26 (April 29th, 2019)

*   Closes #6 (again), see [here](https://github.com/marcus67/little_brother/issues/6)
*   Closes #11, see [here](https://github.com/marcus67/little_brother/issues/11)

## Version 0.1 Revision 25 (April 27th, 2019)

*   Closes #6, see [here](https://github.com/marcus67/little_brother/issues/6)

## Version 0.1 Revision 24 (April 22nd, 2019)

*   Added first version of ARCHITECTURE.md.

## Version 0.1 Revision 23 (April 22nd, 2019)

*   Add screenshots to README.md.
*   Move "under construction" logo to `doc`.

## Version 0.1 Revision 22 (April 21st, 2019)

*   Add download logo to README.md.
*   Link both directories `release` and `master` at SourceForge.

## Version 0.1 Revision 21 (April 21st, 2019)

*   Add coverage logo to README.md. 
*   Add this CHANGES.md page.
*   Interpret predefined environment variables (e.g. CIRCLE_BRANCH).
*   Expand environment variables before calling scripts.
