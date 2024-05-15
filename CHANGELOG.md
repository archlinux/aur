# Changelog

## [1.6.3-1] 2024-05-15

### Changed

- Moved `fluidsynth` and `libmad` from optional to required dependencies (Gyroplast)
- Adapt source path to desktop icon (Gyroplast)

## [1.6.2-1] 2024-04-04

Switch to an actively maintained
[fork](https://github.com/gameflorist/dunedynasty) of the
abandoned, [original project](https://dunedynasty.sourceforge.net).

### Added

- Add dependencies on `alsa-lib`, `enet`, and `libgl` (Gyroplast)
- Add preference for GLVND over legacy OpenGL (Gyroplast)

### Changed

- Switch sources to actively maintained fork (Gyroplast)
- Install upstream-provided .desktop file (Gyroplast)

### Fixed

- Suppress format-security error to compile with default makepkg cflags (Gyroplast)

### Removed

- Remove post-upgrade message (Gyroplast)

## [1.5.7-1] 2014-01-12

Package submitted.

### Added

- Add .desktop file (carstene1ns)

[1.6.3-1]: https://github.com/gameflorist/dunedynasty/releases/tag/v1.6.3
[1.6.2-1]: https://github.com/gameflorist/dunedynasty/releases/tag/v1.6.2
[1.5.7-1]: https://dunedynasty.sourceforge.net/changes.html#version-1.5.7-2013-08-18

