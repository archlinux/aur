# Changelog

## 2.1.0

### Added
- Added a better error message when reading empty files
- Added a new `xyz` attribute to `LasData` that returns x, y, z as a new numpy array or sets the x, y, z from an array
- Added `LasData.remove_extra_dim` and `LasData.remove_extra_dims` to allow the removal of extra dimensions (__only__)

### Changed
- Minimum `lazrs` version updated to 0.4.0 to bring support for LAZ with variable size chunks
  (used in [COPC](https://copc.io) files). the `laszip` backend already supported variable size chunks LAZ.
- Improved assigning to multiple dimensions at once (`las[['x', 'y', 'z']] = ...`)
- `laspy` will no longer raise encoding errors when reading files for which the header's `generating_software` or
  `system_identifier` as well as the vlr's `description` is not `ascii` encoded as the spec mandates.
  However, an encoding error will be raised when writing such files.
- `LasData.__getitem__` will now return a `LasData` when indexing with slice or numpy array.
   `assert isinstance(las[[1, 2, 3, 4]], laspy.LasData)`
 
### Fixed
- Fix `PackedPointRecord.__len__` when array has no dim
- Fix scaled extra byte creation when the offsets/scales given to `ExtraBytesParam` where of type `list` or `tuple`
- Fix `ScaledArrayView` to allow indexing with `list` or `numpy.array`.

## Version 2.0.3

## Fixed
- Fix function that parses geotiff VLRs
- Fix handling of points with 'unregistered' extra bytes (PR #158)
- Fix to handle empty LAS/LAZ more robustly

## Version 2.0.2

### Changed
- Update minimum lazrs version which allows to:
  - Fix Appending in LAZ files.
  - Improve memory usage when reading/writing. (issue #152)

### Fixed
- Fix system_identifier reading by ignoring non ascii characters instead of erroring ,(issue #148, PR #149).
- Fix `LasData.change_scaling` method.

## Version 2.0.1

### Fixed
- Fix `.min` `.max` methods of array views
- Ship the tests as part of the source distribution (But they won't be installed with `pip install`)

## Version 2.0.0

- Overhaul of the internals by essentially incorporating pylas into laspy,
  while the API to retrieve and set dimensions stayed the same, other parts changed
  and will require adaptation.
- Better LAZ support
    * Added support for writing LAZ
    * Changed decompression mechanism by using either `laszip` python bindings (and not laszip-cli)
      or `lazrs`
- Added ability to read and write LAS/LAS in `stream` / `chunked` mode.
- Changed laspy to support the reading and writing of LAS/LAZ data from and to `file-objects` and `bytes`
- Dropped support for python2.7, python3.6+ is supported.

---

## Version 1.7.0

- Fixed bug in point record format 5, 9 and 10 [#105](https://github.com/laspy/laspy/issues/105)
- Return explicit msg if laszip executable was not found [#110](https://github.com/laspy/laspy/issues/110)
- Supprt numpy 1.17 [#122](https://github.com/laspy/laspy/issues/122)

## Version 1.6.0

- Bug fix  [#92](https://github.com/laspy/laspy/issues/92)
- Test creation of all valid custom dimension data types
- Modify handling of extra bytes to be char data instead of numeric byte data

## Version 1.5.1

- Bug fixes [#67](https://github.com/laspy/laspy/pull/67), [#75](https://github.com/laspy/laspy/pull/75), [b02b40900b5](https://github.com/laspy/laspy/commit/b02b40900b5620972930cd0c201b4db1a6a69754)
- Allow usage of `laszip-cli` when working with LAZ files [#77](https://github.com/laspy/laspy/pull/77)

## Version 1.5.0

- Improved memory handling in base.FileManager [#48](https://github.com/laspy/laspy/pull/48)
- Introduced `r-` file mode, that only reads the header of as LAS file [#48](https://github.com/laspy/laspy/pull/48)
- LAS v. 1.4 bug fixes [#55](https://github.com/laspy/laspy/pull/55)
- Python 3 support [#62](https://github.com/laspy/laspy/pull/62)

