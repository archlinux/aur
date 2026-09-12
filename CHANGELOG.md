# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

The version number is based on [calendar versioning](https://calver.org/).
The specific format is `YYYY.(M)M.(D)D`,
where the month and day may be single-digit because Python doesn't allow zero-padded
major/minor/micro version numbers like `05` (it'd have to be just `5`).

## [Unreleased]

### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security

## [2026.7.23]

### Changed
* Updated the ISO 639 data from SIL to the latest 2026-07-15 release.

## [2026.4.20]

### Changed
* Updated the ISO 639 data from SIL to the latest 2026-04-15 release.

## [2026.1.31]

### Changed
* Updated the ISO 639 data from SIL to the latest 2026-01-15 release.

## [2025.11.16]

### Fixed
* Fixed README.md (shown on the PyPI page) for the change from `exact` to `strict_case`
  in `Language.match`.

## [2025.11.11]

### Added
* Added support for Python 3.14.

### Changed
* Updated the ISO 639 data from SIL to the latest 2025-10-15 release.
* Case-insensitive matching for `Language.match` is now opt-in.
  The keyword argument has been renamed `strict_case` (from `exact` before),
  defaulting to `True`.

### Removed
* In `Language.match`, removed the keyword argument `exact`
  (replaced by `strict_case`, defaulting to `True`).
* Dropped support for Python 3.9.

## [2025.2.18]

### Added
* `Language.match` now supports case-insensitive matching
  and ignores leading/trailing whitespace by default.

## [2025.2.8]

### Added
* Explicitly indicated that the library is type-annotated.

## [2025.1.28]

### Changed
* Sped up the retrieval of `Language` objects during runtime.

## [2025.1.27]

### Changed
* Updated the ISO 639 data from SIL to the latest 2025-01-15 release.
* The data tables are now included as the original tab-separated value files
  instead of a compiled SQLite database.

### Fixed
* Fixed `Language.from_part3` so that it now also works for a retired ISO 639-3 code.

## [2024.10.22]

### Added
* Added support for Python 3.13.

### Removed
* Dropped support for Python 3.8.

### Fixed
* Added `CHANGELOG.md` to the PyPI source distribution.

## [2024.4.27]

### Changed
* Updated the ISO 639 data from SIL to the latest 2024-04-15 release.

## [2024.2.7]

### Changed
* Updated the ISO 639 data from SIL to the latest 2024-01-10 release.

## [2024.1.2]

### Changed
* Updated the ISO 639 data from SIL to the latest 2023-12-20 release.

## [2023.12.11]

### Added
* Added support for Python 3.12.

## [2023.6.15]

### Fixed
* Made `Language` class instances actually hashable (#3).

## [2023.4.13]

### Changed
* Disabled thread checking for the database, as it's read-only (#1).

## [2023.2.4]

### Changed
* Updated the ISO 639 data from SIL to the latest 2023-01-23 release.

## [2022.11.27]

### Added
* Defined the `LanguageNotFoundError` exception.
* Added support for Python 3.11.

### Changed
* If the `Language` class methods `match`, `from_part3`, etc. receive an invalid
  input language code or name, a `LanguageNotFoundError` is now raised.
  (Previously, `None` was returned with no exception raised.)

### Removed
* Dropped support for Python 3.7.

## [2022.9.17]

### Added
* Added constants `DATA_LAST_UPDATED` and `ALL_LANGUAGES`.

## [2022.5.16]

### Fixed
* Corrected repo name in package metadata and documentation.

## [2022.5.15]

* First release!
