# Changelog


## Unreleased


## 1.2.1
### Changed
- reverted pinning of click version, now pinned again at >= 5


## 1.2.0
### Added
- download and repo urls to setup.py (#10)
- toml support
- extras
- roundtrip support
- support for typed codecs (#3)
### Changed
- don't sort keys by default in yaml


## 1.1.0
### Added
- tests for python 3.9
### Changed
- use collections.abc
### Removed
- python 3.5 support


## 1.0.0
### Added
- tests for python 3.7 and 3.8
### Changed
- don't reuse class attribute for defaults
### Removed
- python 2.7 support
- tests for python 3.7 and 3.8


## 0.6.0
### Fixed
- log on click Context referencing non-existant `cls` property
### Changed
- decrease PyYAML requirement to >=3.10


## 0.5.0
### Added
- option_list to Context
- log to Context
- config search path includes ~/.$APP_NAME
### Changed
- empty meta returns empty dict instead of None


## 0.4.0
### Added
- py3 support
### Fixed
- set click.Context.home when config is found


## 0.3.0
### Fixed
- version bump for proper semantic versioning


## 0.2.1
### Added
- CHANGELOG!
- allow changing config_name
- try_read
- config.meta
- config.copy()
- click.Context
### Removed
- unused get_type, Endpoint