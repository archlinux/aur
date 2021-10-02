# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
### Changed

## [4.0.0] - 2020-10-10

### Added

- New gel module
- New module myprimers_gdoc for storing primers in a google doc
- New module fakeseq for making DNA ladders.
- New module ladders containing DNA molecular weight markers.

### Changed

- Changes to myprimer module.

## [3.1.3] - 2020-10-10

### Added

- added .sorted_features method for SeqRecord
- added a new lcs (*l*ongest *c*ommon *s*ubstring) method for SeqRecord and DseqRecord

### Changed

- changed format for changelog
- biopython 1.78 in requirements.txt
- fix to scripts/check_my_primers.py

## [3.1.2] - 2020-09-28

### Changed

-Bugfix release. There was a bug in stamping genbank files with cSEGUID.

## [3.1.1] - 2020-09-25

### Changed

-Bugfix release. There was a bug in locating features in certain circular assemblies.
-Added a test: "test_marker_replacement_on_plasmid" in test_module_assembly.py to test for this.

## [3.1.0] - 2020-09-16

### Changed

-Changed to src layout for the package. Changed how melting temperature is calculated.
-Changes to tests, added a conftest.py. Updated for comatibility with biopython 1.7.8.
-Removed mysequences.py
-Reformatted code with BLACK
-Use github actions for building and testing


## [3.0.2a1] - 2019-07-23

### Changed

-.upper() and .lower() methods for Dseq and Dseqrecord classes. Improved slicing

## [3.0.1] - 2019-05-28

### Changed

-Many changes and improvements, especially for the Assembly class.

## [3.0.0] - 2019-05-17

### Changed

 ---

## [2.0.3] - 2017-12-14

### Changed

 ---

## [2.0.3a1] - 2017-12-14

### Changed

-pcr function now takes an amplicon. This way an amplicon can easily be rerun after
 modification of primers or template

## [2.0.3a0] - 2017-12-03

### Changed

 ---

## [2.0.2] - 2017-08-26

### Changed

 ---

## [2.0.2] - 2017-08-26

### Changed

 ---

## [2.0.1] - 2017-08-24

### Changed

 ---

## [2.0.0] - 2017-06-23

### Changed

-First release of 2.0.0. This version adds changes in the alpha versions

## [2.0.0a4] - 2017-05-05

### Changed

-Fixed bug in _multiply_circular

## [2.0.0a3] - 2017-04-04

### Changed

-added the all module, from pydna.all import *, now imports a set of useful pydna modules
 into the main namespace.
-Finer control over cache, genbank download is now on by default.
 Bug fix in assembly_fragments function that created too long primer tails.

## [2.0.0a2] - ---

### Changed

 ----


## [2.0.0a1] -

### Changed

-removed setting functions for cache in __init_ and the delete_cache function for simplicity
-removed these functions
-pydna.design.print_primer_pair
-pydna.design.cloning_primers
-pydna.design.integration_primers
-pydna.design.assembly_primers

## [2.0.0a0] - 2017-03-15

### Changed

-alpha release, removed imports in __init__
-This version breaks compatibility.

## [1.2.0] - 2017-03-10

### Changed

-New and simpler primer design api, especially for gibson assembly primers. See docstrings
-Dseqrecord.find method that allows finding subsequences "over the edge" of circular sequences.

## [1.1.5] - 2016-12-16

### Changed

-added message for Dseqrecord write

## [1.1.4] - 2016-12-15

### Changed

-split some files into more logical and smaller chunks.
-The Primer class is now the same in primer design and amplify modules
-less modules are imported in __init__.py
-pydna.getcache returns the pydna_cache environment variable
-pydna.cached sets pydna_cache to "cached"
-pydna.nocache sets pydna_cache to "nocache"
-pydna.refresh sets pydna_cache to "refresh"
-Many of the Classes have new __repr__ methods compatible with the Jupyter notebook.
-One Jupyter notebook is now run as a part of the test suite using pytest/nbval
-pydna.parse_primers now return a list of Primer class objects
-pydna.read_primer now a Primer class object
-pydna.read_url and pydna.parse_url removed, since they are too risky.
-it is better to use pydna.download_text in combination with read or parse.
 this way, the intermediate text can be inspected and genbankfixer can be applied if
 necessary

## [1.1.1] - 2016-11-20

### Changed

-New module genbankfixer for salvaging broken genbank files (pydna.gbtext_clean).
-New pydna.readprimer function (shortcut for reading to Biopython.SeqRecord).
-Tests merged to pytest.
-read_url function
-parse_url function
-download_text function
-New key function for cache of Assemblies.

## [1.0.2] - 2016-10-08

### Changed

-Python 3 only!
-pydna.open_cache -> pydna.open_cache_folder; opens the cache folder in the file browser
-logging level is not "info"
 added the possiblity to specify a text file containing primers and
 a path to the ApE plasmid editor (http://biologylabs.utah.edu/jorgensen/wayned/ape/)
 These settings can be made in the pydna.ini file that is located in the
 "user_config_dir" specified on each platform by the appdirs module.
 on linux it is in ~/.config/pydna
-Bugfix: invisible gel bands in the gel module.

## [1.0.1] - 2016-03-10

### Changed

-Bugfix: for errors in IPython import if IPython is too old ( < 4.0)
-Bugfix: Large genbank records were not downloaded completely.

## [1.0.0] - -

### Changed

-Gel simulation added

## [0.9.3] - 2015-06-03

### Changed

-Shelve does not work under MacOS under certain conditions.
-This release tries to solve this by not specifying file extensions
 for the cache files. Two functions are added, pydna.

## [0.9.2] - 2015-05-28

### Changed

-pydna_data_dir is encoded to a string in __init__.py instead of
 unicode. The Popen module does not accept environment variables that
 are not strings.

## [0.9.1] - 2015-05-26

### Changed

-fixed critical error in the calculation of seguid and cseguid
 checksums

## [0.9.0] - 2015-05-26

### Changed

-seguid and cseguid are now url safe so they can be part of urls and
 file names.
-Dseqrecord.locus is an alias of Dseqrecord.name
-Dseqrecord.accession is an alias of Dseqrecord.id
-Dseqrecord.definition is an alias of Dseqrecord.description
-changed how circular assembly products are identified to use cseguid.
-removed proxy handling when proxy not set in download module.
-added CHANGELOG.md, currently empty.
-environment variable datadir is now pydna_data_dir.
-removed environmental variable pydna_dna_dir.
-if Dseqrecord is initiated with a name property that is longer than
 16 characters, it is truncated to 16 chars and a warning is issued.
-Default Dseqrecord name property is "na".
-Default Dseqrecord id property is "-".
-Default Dseqrecord description property is "@".
-Dseqrecord __eq__ and __ne__ methods defined.
-Dseqrecord.write now overwrites an old sequence with the same
-filename if the primary sequence is the same.
-Dseqrecord.read now only looks in current working directory.
-fixed ipynb_import test code.

## [0.8.4] - 2015-04-17

### Changed

-Bugfix for parsing text files with unicode characters.
## [0.8.3] - -

### Changed

 -
## [0.8.2] - -

### Changed

 -
## [0.8.1] - 2015-03-07

### Changed

 Bugfix for windows. The data directory was not created.

## [0.8.0] - 2015-02-06

### Changed

-Mapping reads added.

## [0.7.2] - 2014-11-21

### Changed

-First public release with the changes from 0.7.0 and 0.7.1.
-Added a Pretty_str class to beautify output of strings in
 the IPython shell.

## [0.7.1] - notpublic

### Changed

-Short linkers can be incorporated in PCR primers in the
 assembly_primers function.

## [0.7.0] - notpublic

### Changed

-Caching to speed up Amplify, Assembly, download and the
-Desqrecord synced method. The data is stored in four shelf
 files in the users application directory.

-amplify.shelf
-assembly.shelf
-genbank.shelf
-synced.shelf

-The location is os specific.
-See the documentation of appdirs
 https://pypi.python.org/pypi/appdirs/1.4.0

## [0.6.6] -

### Changed

-new function nopcr.

## [0.6.5] - 2014-07-31

### Changed

-bugfix: cutting an amplicon object now preserves features
-Changed requirement for NetworkX to 1.8.1

## [0.6.4] - 2014-07-09

### Changed

-The pcr function and Anneal class can now deal with primers
 with ambiguous codons like R = A or G. In the resulting PCR
 product, the ambiguous nucleotides are preserved in the tails
 i.e. the primer part not annealing. The annealing part will
 have the sequence corresponding to the template.

## [0.6.3] - 2014-07-06

### Changed

-Dseqrecord.add_feature can now take a string or some other
 sequence as input. The assembly primers function can now produce
 primers for a circular assembly.

## [0.6.2] - 2014-06-13

### Changed

-Dseqrecord gained three new methods:

-isorf() method returning True or False.

-List_features() method returns a list of all features as a
 formatted ASCII table.

-Extract_feature() extracts a feature in the form os a new
 Dseqrecord object.

-Changes to how the primer_design functions work, especially
 assembly primers.

## [0.6.1] - 2014-04-25

### Changed

-Fixed a bug in the Dseqrecord synced method and removed the
 utils synced function.

## [0.6.0] - 2014-04-18

### Changed

-Bugfixes and improvements in documentation.

## [0.5.0] - 2013-12-16

### Changed

-Changes to how the amplify and assembly modules work
 the Amplicon and Assembly classes are now subclasses of
 Dseqrecord.

## [0.2.2] - 2013-11-05

### Changed

-bugfix: changed the handling of compound features
 to fit with the new version of BioPython (1.62) which is
 now a requirement.

## [0.2.1] - 2013-08-18

### Changed

 ---

## [0.1.8] - 2013-06-02

### Changed

-bugfix: changed the SeqFeatures added to PCR products in the
-amplify module to a dict of list of strings instead of
 a dict of strings.

## [0.1.7] - 2013-05-29

### Changed

-Changed the code in amplify.Amplicon to handle features
 spanning the origin of circular sequences.

## [0.1.6] - 2013-04-22

### Changed

-Changed the behaviour of the find method of the Dseq object
 to find substrings that span the origin. Slicing for circular
 Dseq objects now works slightly different.

## [0.1.5] - 2013-04-18

### Changed

-Changed the setup.py script to permit installation
 of the source installer without access to a c compiler.

## [0.1.4] - 2013-04-10

### Changed

-Cleaned up some docstrings
-Renamed Drecord -> Dseqrecord to be more consistent with
-Dseq and Biopython Seq/SeqRecord.

-Changed name of keyword argument for read and parse.
-ds=True returns Dseqrecord(s) while ds=False returns SeqRecords.

## [0.1.3] - 2013-04-09

### Changed

-pydna created from Python-dna.

[unreleased]: https://github.com/BjornFJohansson/pydna/compare/HEAD..3.1.3
[3.1.3]: https://github.com/BjornFJohansson/pydna/compare/3.1.3..3.1.2
[3.1.2]: https://github.com/BjornFJohansson/pydna/compare/3.1.2..3.1.1
[3.1.1]: https://github.com/BjornFJohansson/pydna/compare/3.1.1..3.1.0a1
[3.1.0a1]: https://github.com/BjornFJohansson/pydna/compare/3.1.0a1..3.1.0a0
[3.1.0a0]: https://github.com/BjornFJohansson/pydna/compare/3.1.0a0..3.1.0
[3.1.0]: https://github.com/BjornFJohansson/pydna/compare/3.1.0..3.0.2a5
[3.0.2a5]: https://github.com/BjornFJohansson/pydna/compare/3.0.2a5..3.0.2a4
[3.0.2a4]: https://github.com/BjornFJohansson/pydna/compare/3.0.2a4..3.0.2a3
[3.0.2a3]: https://github.com/BjornFJohansson/pydna/compare/3.0.2a3..3.0.2a2
[3.0.2a2]: https://github.com/BjornFJohansson/pydna/compare/3.0.2a2..3.0.2a1
[3.0.2a1]: https://github.com/BjornFJohansson/pydna/compare/3.0.2a1..3.0.2
[3.0.2]: https://github.com/BjornFJohansson/pydna/compare/3.0.2..3.0.1
[3.0.1]: https://github.com/BjornFJohansson/pydna/compare/3.0.1..3.0.0a9
[3.0.0a9]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a9..3.0.0a8
[3.0.0a8]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a8..3.0.0a7
[3.0.0a7]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a7..3.0.0a6
[3.0.0a6]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a6..3.0.0a5
[3.0.0a5]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a5..3.0.0a46
[3.0.0a46]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a46..3.0.0a45
[3.0.0a45]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a45..3.0.0a44
[3.0.0a44]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a44..3.0.0a43
[3.0.0a43]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a43..3.0.0a42
[3.0.0a42]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a42..3.0.0a41
[3.0.0a41]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a41..3.0.0a40
[3.0.0a40]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a40..3.0.0a4
[3.0.0a4]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a4..3.0.0a39
[3.0.0a39]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a39..3.0.0a38
[3.0.0a38]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a38..3.0.0a37
[3.0.0a37]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a37..3.0.0a36
[3.0.0a36]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a36..3.0.0a35
[3.0.0a35]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a35..3.0.0a32
[3.0.0a32]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a32..3.0.0a31
[3.0.0a31]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a31..3.0.0a30
[3.0.0a30]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a30..3.0.0a3
[3.0.0a3]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a3..3.0.0a29
[3.0.0a29]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a29..3.0.0a28
[3.0.0a28]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a28..3.0.0a27
[3.0.0a27]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a27..3.0.0a26
[3.0.0a26]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a26..3.0.0a25
[3.0.0a25]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a25..3.0.0a24
[3.0.0a24]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a24..3.0.0a23
[3.0.0a23]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a23..3.0.0a22
[3.0.0a22]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a22..3.0.0a21
[3.0.0a21]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a21..3.0.0a20
[3.0.0a20]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a20..3.0.0a2
[3.0.0a2]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a2..3.0.0a19
[3.0.0a19]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a19..3.0.0a18
[3.0.0a18]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a18..3.0.0a17
[3.0.0a17]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a17..3.0.0a16
[3.0.0a16]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a16..3.0.0a15
[3.0.0a15]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a15..3.0.0a14
[3.0.0a14]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a14..3.0.0a13
[3.0.0a13]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a13..3.0.0a12
[3.0.0a12]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a12..3.0.0a11
[3.0.0a11]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a11..3.0.0a10
[3.0.0a10]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a10..3.0.0a1
[3.0.0a1]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a1..3.0.0a0
[3.0.0a0]: https://github.com/BjornFJohansson/pydna/compare/3.0.0a0..3.0.0
[3.0.0]: https://github.com/BjornFJohansson/pydna/compare/3.0.0..2.0.4a5
[2.0.4a5]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a5..2.0.4a4
[2.0.4a4]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a4..2.0.4a3
[2.0.4a3]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a3..2.0.4a2
[2.0.4a2]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a2..2.0.4a1
[2.0.4a1]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a1..2.0.4a0
[2.0.4a0]: https://github.com/BjornFJohansson/pydna/compare/2.0.4a0..2.0.3a0
[2.0.3a0]: https://github.com/BjornFJohansson/pydna/compare/2.0.3a0..2.0.3
[2.0.3]: https://github.com/BjornFJohansson/pydna/compare/2.0.3..2.0.2a0
[2.0.2a0]: https://github.com/BjornFJohansson/pydna/compare/2.0.2a0..2.0.2
[2.0.2]: https://github.com/BjornFJohansson/pydna/compare/2.0.2..2.0.1
[2.0.1]: https://github.com/BjornFJohansson/pydna/compare/2.0.1..2.0.0a8
[2.0.0a8]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a8..2.0.0a7
[2.0.0a7]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a7..2.0.0a6
[2.0.0a6]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a6..2.0.0a5
[2.0.0a5]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a5..2.0.0a4
[2.0.0a4]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a4..2.0.0a3
[2.0.0a3]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a3..2.0.0a2
[2.0.0a2]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a2..2.0.0a0
[2.0.0a0]: https://github.com/BjornFJohansson/pydna/compare/2.0.0a0..2.0.0
[2.0.0]: https://github.com/BjornFJohansson/pydna/compare/2.0.0..1.2.0a1
[1.2.0a1]: https://github.com/BjornFJohansson/pydna/compare/1.2.0a1..1.2.0a0
[1.2.0a0]: https://github.com/BjornFJohansson/pydna/compare/1.2.0a0..1.2.0
[1.2.0]: https://github.com/BjornFJohansson/pydna/compare/1.2.0..1.1.6a4
[1.1.6a4]: https://github.com/BjornFJohansson/pydna/compare/1.1.6a4..1.1.5
[1.1.5]: https://github.com/BjornFJohansson/pydna/compare/1.1.5..1.1.4
[1.1.4]: https://github.com/BjornFJohansson/pydna/compare/1.1.4..1.1.1
[1.1.1]: https://github.com/BjornFJohansson/pydna/compare/1.1.1..1.0.2
[1.0.2]: https://github.com/BjornFJohansson/pydna/compare/1.0.2..1.0.1
[1.0.1]: https://github.com/BjornFJohansson/pydna/compare/1.0.1..1.0.0
[1.0.0]: https://github.com/BjornFJohansson/pydna/compare/1.0.0..0.9.9
[0.9.9]: https://github.com/BjornFJohansson/pydna/compare/0.9.9..0.9.8
[0.9.8]: https://github.com/BjornFJohansson/pydna/compare/0.9.8..0.9.7
[0.9.7]: https://github.com/BjornFJohansson/pydna/compare/0.9.7..0.9.6
[0.9.6]: https://github.com/BjornFJohansson/pydna/compare/0.9.6..0.9.5
[0.9.5]: https://github.com/BjornFJohansson/pydna/compare/0.9.5..0.9.4
[0.9.4]: https://github.com/BjornFJohansson/pydna/compare/0.9.4..0.9.3
[0.9.3]: https://github.com/BjornFJohansson/pydna/compare/0.9.3..0.9.2
[0.9.2]: https://github.com/BjornFJohansson/pydna/compare/0.9.2..0.9.1
[0.9.1]: https://github.com/BjornFJohansson/pydna/compare/0.9.1..0.9.0
[0.9.0]: https://github.com/BjornFJohansson/pydna/compare/0.9.0..0.8.4
[0.8.4]: https://github.com/BjornFJohansson/pydna/compare/0.8.4..0.8.3
[0.8.3]: https://github.com/BjornFJohansson/pydna/compare/0.8.3..0.8.2
[0.8.2]: https://github.com/BjornFJohansson/pydna/compare/0.8.2..0.8.1
[0.8.1]: https://github.com/BjornFJohansson/pydna/compare/0.8.1..0.8.0
