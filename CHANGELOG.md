# Changelog

## [0.29.0-1] 2026-05-30

### Added

- add this `CHANGELOG.md` to track packaging changes
- optional dependency on `python-uv-build>=0.11.0` to use generated uv metadata

### Changed

- drop support for Python 3.10 and older
- dependency version boundary; `python-jinja>=1:3.0.0,<1:4.0.0`
- dependency version boundary; `python-typer>0.16,<0.27`
- dependency version boundary; `python-typer>0.16,<0.27`
- dependency version boundary; `python-pydantic>=2.10,<3.0.0`
- dependency version boundary; `python-pydantic>=2.10,<3.0.0`
- dependency version boundary; `python-httpx>=0.23.1,<0.29.0`
- dependency version boundary; `python-ruamel-yaml>=0.18.6,<0.20.0`
- FINALLY remove upper version boundary for ruff linter

### Fixed

- inconsistent tab indentation in `check()`

### Removed

- unused dependencies: `python-dateutil`, `python-typing_extensions`

[0.29.0-1]: https://github.com/openapi-generators/openapi-python-client/releases/tag/v0.29.0
