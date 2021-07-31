# Changelog

## [0.5.3] - 2021-06-09

### Bug Fixes
- Implement _working_ temporary workaround for launcher failing when Steam starts the executable via `reaper`
- Fix EDLaunch.exe path being treated as product whitelist item

## [0.5.2] - 2021-06-09

### Security
- Address [CVE-2021-31957] by building with latest version of .net SDK (5.0.301)

### Bug Fixes
- Implement temporary workaround for launcher failing when Steam starts the executable via `reaper`

## [0.5.1] - 2021-06-04

### Enhancements

- Automatically fix Odyssey filter by providing correct override in default `settings.json`

  Users upgrading from previous versions will need to manually update their `settings.json` file or delete it and let it be auto-created again.
  
  Manual update should include the following:
  ```json
  "filterOverrides": [
        { "sku": "FORC-FDEV-DO-1000", "filter": "edo" }
    ]
  ```

### Bug Fixes

- Fix filter overrides not being case-insensitive
- Fix `/novr` flag being treated as a product whitelist

## [0.5.0] - 2021-06-03

### Breaking Changes
- Restart option has moved to the `/restart delay` argument and is no longer specified in the config file.
  
  This allows for creating separate shortcuts, one for normal gameplay and one for restarting.
  
  Instead of specifying `restart: { enabled: true, shutdownTimeout: 3 }`, modify your launch options to include `/restart 3`.

### New Features
- Add ability to override a product's filter via the config file
  
  Useful for when FDev makes a copy/paste error for a new product (i.e. when they released Odyssey with an "edh" filter instead of "edo")

## [0.4.0] - 2021-05-11

### New Features
- Add support for Frontier accounts via the `/frontier` argument. This includes logging in with a single game installation (e.g. Steam) and
  keeping the game up-to-date if you don't use Steam or Epic. See the readme for instructions on how to use this feature.
  
### Security
- Address [CVE-2021-31204] by building with latest version of .net (5.0.6)

## [0.3.1] - 2021-03-31

### New Features
- Add ability to select product to run

### Enhancements
- Add workaround for Steam always setting `$LC_ALL` to `C` which prevented the correct game language from being selected
- Include launcher's directory as potential Elite Dangerous install location

### Bug Fixes
- Properly parse proton when it's in `compatibilitytools.d` dir. Custom versions of proton, such as [Proton-GE], are stored here.
- Fix `$XDG_CONFIG_DIR` not always being parsed properly
- Fix not being able to handle a variable amount of steam linux runtime args (i.e. `--deploy=soldier --suite=soldier --verb=waitforexitandrun` vs `--verb=waitforexitandrun`)

## [0.3.0] - 2020-12-28

### New Features

- Add support for specifying Elite's language instead of just using the system default

## [0.2.0] - 2020-12-13

### New Features

- Add support for launching via Proton 5.13 and greater which runs via Steam Linux Runtime

### Bug Fixes

- Fix not being able to find libsteam_api.so on linux
- Fix invalid path on windows when looking for a fallback installation path 
- Fix incorrect linux path in setup instructions

## [0.1.1] - 2020-12-08

### Enhancements

- Log settings file location

### Bug Fixes

- Fix windows build looking in wrong location for settings file

## [0.1.0] - 2020-12-05

Initial release

[unreleased]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.5.3...HEAD
[0.5.3]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.5.2...v0.5.3
[0.5.2]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.5.1...v0.5.2
[0.5.1]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.5.0...v0.5.1
[0.5.0]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/rfvgyhn/min-ed-launcher/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/rfvgyhn/min-ed-launcher/compare/67d8c3f...v0.1.0
[Proton-GE]: https://github.com/GloriousEggroll/proton-ge-custom
[CVE-2021-31204]: https://github.com/dotnet/announcements/issues/185
[CVE-2021-31957]: https://github.com/dotnet/announcements/issues/189