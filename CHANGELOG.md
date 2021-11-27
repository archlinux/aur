# Changelog

## [2.2.3]
### Fixed
- Minor doc issues and doc build

## [2.2.2]
### Added
- Support for python3.10

### Fixed
- Error when adding two equal points where one point's coordinates are not reduced mod p (issue #75)

## [2.2.1]
### Fixed
- Incorrect DER encoding of data with length >=0x80 (issue #61)

## [2.2.0]
### Added
- Support for python3.9

### Removed
- Support for python3.5

### Fixed
- Multiplying by negative scalars (issue #70)
- Reading and writing keys to disk using encoders that output bytes (PR #62)

### Updated
- `fastecdsa.keys.import_key` now has a consistent return type (`Tuple[Optional[int], Point]`) for public and private 
keys. Previously public key imports returned `Point`, they now return `Tuple[None, Point]`, in other words a tuple
with the first entry being `None` (the private key) and the second entry being the point representing the public key.

## [2.1.5]
### Fixed
- Timing leakage from nonce bit length aka the [Minerva](https://minerva.crocs.fi.muni.cz/) vulnerability (PR #60)

## [2.1.4]
### Fixed
- Reduction by base point order in scalar multiplication breaks when input point does not have that order (PR #58)
- Edge case for curves with order 2 was not handled (PR #58) 
- Signature verification of pre-hashed messages broken (PR #56)

## [2.1.3]
### Fixed
- Multiplying base point by curve order caused an error (issue #54)

## [2.1.2]
### Fixed
- Point at infinity handling in C extensions (issue #52)
- DER signature decoding that assumed length was always encoded in one byte

## [2.1.1]
### Fixed
- RFC6979 nonce generation for signatures on pre-hashed messages (issue #46)

## [2.1.0]
### Added
- Curves W25519 and W448 from [NIST.SP.800-186](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-186-draft.pdf)

### Fixed
- Curves with no OID are not added to the lookup by OID map
- Type validation for operations of points (issue #50)

## [2.0.0]
### Added
- This changelog
- Type hints for clearer function signatures

### Removed
- Support for python2.x
- Support for python3.4 and older
- Various unused imports

### Fixed
- Issue with benchmark script when C extensions weren't built in place (issue #44)
