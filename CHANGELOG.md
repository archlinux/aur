# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [PEP
440](https://www.python.org/dev/peps/pep-0440/).

## v0.6.0 -- 2023-12-04

### Added

- `DataArray` now lazy-copies the underlying data at write-time. Changes to the
  data after instantiation will now be reflected in the written file.

## v0.5.2 -- 2023-06-14

### Added

- Can now pass a communicator object to parallel writers (#4)

## v0.5.1 -- 2023-04-13

### Added

- CI now with Github Actions

### Fixed

- Wrong number of nodes for hexahedron cell (8 instead of 9)

## v0.5.0 -- 2022-11-25

### Added

- Drop-in replacement for `pyevtk.hl` that is less restrictive and more
  feature-rich than the original (e.g. arbitrary number of components in data
  and data compression).

### Fixed

- Bug that prevented using variable size cells in `UnstructuredGrid`

### Deprecated

- Support for Python 3.6 removed, this is the last compatible version

## v0.4.0 -- 2021-05-04

### Added

- Support for `os.PathLike` for filenames
- Support for `PImageData`

### Changed

- Using relative path for Source in `PRRectilinearGrid`
- Tests use temporary directories and files
- Array data is converted to `ndarray` if necessary with `numpy.asarray`
- Version numbers are managed with `vX.Y.Z` tags using
  [Versioneer](https://github.com/python-versioneer/python-versioneer) and
  follow PEP440

## v0.3.2 -- 2020-11-17

### Added

- Support for Big Endian byte order

## v0.3.1 -- 2020-11-17

### Added

- Can write to buffered streams
- Support for ParaViewData group files

### Fixed

- Bug where array dimensions would be rearranged with compression

## v0.3.0 -- 2020-05-29

### Added

- Support for `UnstructuredGrid` files

## v0.2.2 -- 2020-05-27

### Added

- Support for appended data section

### Fixed

- Formatting of array values in ascii mode for integer types

## v0.2.1 -- 2020-05-14

### Fixed

- Unnecessary copy of data before b64encode

## v0.2.0 -- 2020-05-14

### Added

- Support for compression with zlib

## v0.1.0 -- 2020-05-12

### Added

- MPI Implementation for `PRectilinearGrid`

### Fixed

- Typo in `addCellData()` function name

## v0.0.7 -- 2019-04-05

### Added

- Support to write to file handles

## v0.0.6 -- 2019-03-02

### Added

- Context manager capacity to `VTKFile`

## v0.0.4 -- 2018-09-13

Initial proper release.
