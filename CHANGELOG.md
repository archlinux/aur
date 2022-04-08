# Changelog


## Unreleased


## 3.2.0
### Fixed
- allow binding flask to ipv6
- deprecation message for wsgi.host and wsgi.port
- github workflow for unit tests
### Removed
- python3.6 support


## 3.1.0
### Changed
- updated dependencies


## 3.0.0
### Added
- python3.8, python3.9 support
### Removed
- python2 support


## 2.3.0
### Added
- python3.7 support
- `field` property for configuration attributes
- data_id attribute for data plugin
### Changed
- move to Ctl for release/package management


## 2.2.6
### Fixed
- data_id config attribute for data plugins
- tox py2.7 tests


## 2.2.5
### Fixed
- zeromq plugin py3 support


## 2.2.4
### Fixed
- travis tests and coverage reports
- pluginmgr 0.5.0 support


## 2.2.3
### Added
- app versioning (#10)
### Fixed
- pinned pluginmgr version to <0.5.0 for the time being


## 2.2.2
### Added
- wsgi plugin: static_routes config attribute
### Fixed
- fix #8: re-index data handler graceful error handling when passed empty rows in data
- fix #8: errors in data handlers will now log errors instead of raising


## 2.2.1
### Fixed
- nested configuration handlers
- nested configuration sharing


## 2.2.0
### Added
- shared config attributes in vodka.config.shared (#6)
- can now specify additional template locations for TemplatedApplication instances via the 'template_locations' configuration attribute. (#3)
- can now override another applications templates by creating an aproporiately named subdirectory in the overriding applications template directory (#3)
- WebApplication: added 'includes' config attribute for controlled static media library loading (js, css)
### Fixed
- bartender newapp command now creates an empty __init__.py in the plugin directory
### Changed
- templating logic was split out of WebApplication into TemplatedApplication


## 2.1.1
### Added
- support for asyncio as async handler (py >= 3.4)
- setuptools entry point 'vodka.extend' to allow loading of plugin extensions
### Fixed
- trailing whitespace removed


## 2.1.0
### Added
- Python 3 support
- config attribute deprecation indication
- wsgi plugin: added **bind** config attribute that will replace **host** and **port** in a future version. If **bind**, **host** and **port** are all set **bind** will be given priority.
### Fixed
- Configuration validation for plugins that used config attributes in their initialization
### Changed
- WebApplication: **tmpl_engine** config attribute renamed to **template_engine**


## 2.0.5
### Added
- wsgi: support for route decorators in config
- wsgi: added **host** variable to template env
- flask: crossdomain route decorator


## 2.0.4
### Added
- documentation
- application configuration attribute: requires - allows an application to specify other applications as required to make sure they get loaded first in the app loading process
- gunicorn wsgi server support
- web application ssl support
### Fixed
- module name specified in application config is now always respected
- newapp command will now create an __init__.py file
- applications can now provide their own plugins
- gevent async handler
### Removed
- util.SearchPathImporter as it was redundant


## 2.0.3
### Added
- bartender command: **newapp**, generates a blank vodka application stucture
- util.SearchPathImporter for vodka application loading
### Changed
- refactored app loading to allow each app to have a separate home location
- wsgi plugin: request env now contains an app object for each instantiated app
### Deprecated
- home config variable in vodka config root, replaced by app home


## 2.0.2
### Added
- plugins/django, allows you to use django**s orm
- bartender command: **config**, interactive config creation
- impl plugin.setup() method that is called right before a plugin is started
- impl base class for class registry decorator
- additional unittests
### Fixed
- plugins/flask, fail gracefully when trying to import flask
### Changed
- plugins are now instantiated before applications
- vodka.app.register now a decorator