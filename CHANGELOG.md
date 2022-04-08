# Changelog


## Unreleased


## 1.1.0
### Added
- python 3.10
### Removed
- python 3.6


## 1.0.1
### Fixed
- only require py3.6+


## 1.0.0
### Added
- poetry
- python to 3.9
### Removed
- python 2.7 - 3.5 support


## 0.6.0
### Added
- support entry points for plugins from external packages


## 0.5.1
### Fixed
- issue with get_instance not checking for existing plugins when passed a dict


## 0.5.0
### Added
- py36 tests
### Changed
- moved config plugins into separate config.ConfigPluginManager class
- renamed plugin config attr to pluginmgr_config
### Removed
- name attr from ConfigPlugin objects
- args and kwargs from config.PluginBase


## 0.4.0
### Added
- py3 support
### Fixed
- always use full module name in sys.modules
### Changed
- check searchpath for null values


## 0.3.0
### Added
- allow changing searchpath after instantiation


## 0.2.0
### Added
- variadic arguments to plugin ctors