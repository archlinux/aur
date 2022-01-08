ChangeLog
=========

1.12 (2022-01-07)
-----------------

* Faster and more space friendly pickling and unpickling.
  https://bugs.python.org/issue44154

* Algorithmically faster arithmetic for large denominators, although slower for
  small fraction components.
  https://bugs.python.org/issue43420
  Original patch for CPython by Sergey B. Kirpichev and Raymond Hettinger.

* Make sure ``bool(Fraction)`` always returns a ``bool``.
  https://bugs.python.org/issue39274

* Built using Cython 3.0.0a10.


1.11 (2019-12-19)
-----------------

* Fix ``OverflowError`` when parsing string values with long decimal parts.


1.10 (2019-08-23)
-----------------

* ``hash(fraction)`` is substantially faster in Py3.8+, following an optimisation
  in CPython 3.9 (https://bugs.python.org/issue37863).

* New method ``fraction.as_integer_ratio()``.


1.9 (2018-12-26)
----------------

* Substantially faster normalisation (and therefore instantiation) in Py3.5+.

* ``//`` (floordiv) now follows the expected rounding behaviour when used with
  floats (by converting to float first), and is much faster for integer operations.

* Fix return type of divmod(), where the first item should be an integer.

* Further speed up mod and divmod operations.


1.8 (2018-12-26)
----------------

* Faster mod and divmod calculation.


1.7 (2018-10-16)
----------------

* Faster normalisation and fraction string parsing.

* Add support for Python 3.7.

* Built using Cython 0.29.


1.6 (2018-03-23)
----------------

* Speed up Fraction creation from a string value by 3-5x.

* Built using Cython 0.28.1.


1.5 (2017-10-22)
----------------

* Result of power operator (``**``) was not normalised for negative values.

* Built using Cython 0.27.2.


1.4 (2017-09-16)
----------------

* Rebuilt using Cython 0.26.1 to improve support of Python 3.7.


1.3 (2016-07-24)
----------------

* repair the faster instantiation from Decimal values in Python 3.6

* avoid potential glitch for certain large numbers in normalisation under Python 2.x


1.2 (2016-04-08)
----------------

* change hash function in Python 2.x to match that of ``fractions.Fraction``


1.1 (2016-03-29)
----------------

* faster instantiation from float values

* faster instantiation from Decimal values in Python 3.6


1.0 (2015-09-10)
----------------

* ``Fraction.imag`` property could return non-zero

* parsing strings with long fraction parts could use an incorrect scale


0.7 (2014-10-09)
----------------

* faster instantiation from float and string values

* fix test in Python 2.x


0.6 (2014-10-09)
----------------

* faster normalisation (and thus instantiation)


0.5 (2014-10-06)
----------------

* faster math operations


0.4 (2014-10-06)
----------------

* enable legacy division support in Python 2.x


0.3 (2014-10-05)
----------------

* minor behavioural fixes in corner cases under Python 2.x
  (now passes all test in Py2.7 as well)


0.2 (2014-10-03)
----------------

* cache hash value of Fractions


0.1 (2014-09-24)
----------------

* initial public release
