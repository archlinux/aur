Changelog
=========

2.5.0 (2022-03-03)
------------------

* Fixes to BitString decoding and encoding of IA5String and UTCTime (thanks to 0xbf00)

2.4.2 (2021-10-29)
------------------

* Fix a minor mistake in the dump.py example
* Add Python 3.9 and 3.10

2.4.1 (2020-07-16)
------------------

* Fix #89 - Replace explicit references to enum34 by enum-compat

2.4.0 (2020-06-23)
------------------

* Fix #21 - Invalid decoding in non-Universal classes
* Fix #57 - Invalid encoding of non-Universal classes

2.3.1 (2020-04-06)
------------------

* No change in code, only in packaging and in texts (README, ...)

2.3.0 (2020-04-05)
------------------

* Tests: Replace nose by pytest
* Add Python 3.8, remove Python 3.4 support
* PR#26 (from rumbah): Add test for default (implicit) encoding types
* PR#25 (from thomwiggers): Attempt to support BIT STRING
* Fix wrong example code, see #27
* (from jcrowgey) Makes the package usable with pip install
* Remove support of Python 3.3 (some dependencies do not support 3.3)
* PR#15 (from ThePlasmaRailgun) Fix parsing of object identifier
* PR#10 (from robinleander): Allow user to determine decoding tagtype


2.2.0 (2017-10-30)
------------------

* Use "true" enums instead of classes. Use enun34 backport for old Python versions.

2.1.1 (2017-10-30)
------------------

* Fix a bug (#9): two's complement corner case with values such as -32769. Add new test cases to test them.

2.1.0 (2016-12-18)
------------------

* Add more documentation
* Use (simulated) enumerations
* Add Python 2.6 in automated checks and tests
* Add type hints (for static checking) and fix some code

2.0.0 (2016-12-16)
------------------

* First public release by Sebastien Andrivet
* Support both python 2 and 3 (with Python-Future)
* All strings are now in unicode
* Add more ASN.1 tags (like PrintableString)
* Fix errors in the example (dump.py)
* Code reorganization

0.9 (2011-05-18)
----------------

* Initial public release by Geert Jansen
