# Changelog


## Unreleased


## 1.8.0
### Added
- inet type `IpNetwork`
### Fixed
- collections.abc deprecation warning


## 1.7.1
### Fixed
- mkdocs no longer a requirement for a normal installation of the package


## 1.7.0
### Added
- `confu.util.SettingsManager`: scoped settings management with environment variable override support


## 1.6.1
### Fixed
- version in pyproject.toml


## 1.6.0
### Added
- Python 3.8 support (#33)
- Python 3.9 support (#41)
- `apply_argparse`: helper function to update Config object with output from parser (#31)
- `argparse_options`: `default_from_schema` keyword argument added (#31)
- Poetry added for dependency management (#39)
### Removed
- Python 3.5 support (#32)
- Python 3.4 support
- Python 2.7 support


## 1.5.0
### Added
- Python 3.7 support (#29)
- `Directory Attribute`: `require_exist` argument (#28)
- `File Attribute`: `require_exist` argument (#25)
### Changed
- PyPI package renamed to `confu`
- `Directory Attribute`: expand user and make path absolute during validation (#27)
- `File Attribute`: expand user and make path absolute during validation (#26)


## 1.4.1
### Fixed
- added missing docs files


## 1.4.0
### Added
- `argparse_options`: `attributes` keyword argument added (#24)
- `click_options`: `attributes` keyword argument added (#24)
### Changed
- use pymdgen for automatic api docs (#22)


## 1.3.0
### Added
- `Attribute`: `cli` argument can now be a function (#21)
### Fixed
- fix #23: better error handling in apply_defaults


## 1.2.0
### Added
- `defaults` parameter for argparse_options and click_options (#20)
### Fixed
- `List` still requires name attribute on init (#17)


## 1.1.3
### Fixed
- Fixed issue where `List` holding `Schema` type items would lose items to validation warnings (#18)


## 1.1.2
### Fixed
- some attribute validators still have issues with a None default (#16)
- For string attributes a blank default value should infer blank=True (#15)


## 1.1.0
### Fixed
- IPAddress field validation issue with blank=True (#13)
- Allow None as a default value (#14)
- Auto set attribute name if not specified (#12)
- added `valid` property to Config that will be true if config was validated without
- code cleanup
- test coverage to 91%
- updated outdated requirements to prepare for 1.0.0 release


## 1.0.0


## 0.7.0


## 0.6.0
### Added
- `blank` argument for `Str` attribute - specifies whether value can be blank or not, defaults to `False`
### Fixed
- proxy schema needs to be able to apply defaults (#10)
- issue where list validation would sometimes lead to duplicate items added to the list
### Changed
- `Directory` attribute will forfeit validation if `blank` is `True` and value is `""`


## 0.5.2
### Fixed
- recursive directory creation for Directory Attribute if `create` is specified


## 0.5.1
### Fixed
- `apply_defaults` now properly works with nested items


## 0.5.0
### Added
- `File` attribute
- `Email` attribute
- `Url` attribute
- `IpAddress` attribute
- `Schema` attribute now has an optional `item` argument that if set allows for validation of dicts with arbitrary keys.
- Support for ConfigParser instances in validate
### Changed
- schema moved to directory so it's easier to group and add new attributes going forward, imports remain unaffected.
- `validate` will now pass **kwargs on to `Schema.validate`
- Facsimile to Ctl


## 0.4.0
### Added
- `ProxySchema`
- `apply_defaults` to apply schema defaults to a config dict
- `Config` object
### Fixed
- `Schema.walk` now triggers the callback before entering subschemas
### Changed
- Schema now extends Attribute and is now working on instances rather than classmethod based
- Attribute name is now optional when attribute is member of list
- renamed `ListAttribute` to `List`
- renamed `StringAttribute` to `Str`
- renamed `IntAttribute` to `Int`
- renamed `FloatAttribute` to `Float`
- renamed `BooleanAttribute` to `Bool`
- renamed `DirectoryAttribute` to `Directory`


## 0.3.0
### Added
- py2.7 support
- DirectoryAttribute
- generator.generate shortcut
### Fixed
- validation: schema validation returning None value
- validation: warnings raised with the wrong exception type
- exceptions: can now have integers in config path (from list index for example)
### Changed
- renamed `UnicodeAttribute` to `StringAttribute` that is now looking for either string or unicode types during validation