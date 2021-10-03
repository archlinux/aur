Changelog
=========


0.6.2 (2020-12-15)
------------------

Fix
~~~
- UTF-8 values would end in tracebacks (fixes #51) [Valentin Lab]


0.6.1 (2018-12-14)
------------------

New
~~~
- Added ``-V|--version`` shyaml command line option to get full version
  information. [Valentin Lab]

  This includes ``shyaml``'s version, but also PyYAML version installed,
  and availability of the C libyaml bindings, and if they are used.


Fix
~~~
- Document behavior on empty input. [Valentin Lab]


0.6.0 (2018-12-13)
------------------

New
~~~
- Python 3.7 compatibility. [Valentin Lab]
- Support YAML streams (fixes #32) [Valentin Lab]
- ``shyaml`` can now be used from within python. [Valentin Lab]

  You can import ``shyaml`` and launch inner function in a python
  program thanks to accessible API.

- ``-q`` or ``--quiet`` to avoid printing error message on missing
  paths. (fix #14) [Valentin Lab]
- Full support of yaml tags (fix #40) [Valentin Lab]

Changes
~~~~~~~
- Finish to document all behaviors. [Valentin Lab]

Fix
~~~
- Script was not installed correctly on windows. (fix #38) [Valentin
  Lab]
- Python 3 incompatible code removed in ``get-values{,-0}``. [Valentin
  Lab]
- Use C yaml implementation from ``libyaml`` when available (fix #3)
  [Valentin Lab]


0.5.2 (2018-04-25)
------------------

Fix
~~~
- Missing doc about ``get-length`` and typo corrected in help message.
  [Valentin Lab]
- Python 3.0 exception when querying for missing keys removed. (fix #34)
  [Valentin Lab]


0.5.1 (2018-03-06)
------------------

New
~~~
- Add ``requirements`` section. [Valentin Lab]
- Add command ``get-length`` for structures or sequences (closes #25,
  fixes #20) [gt3389b]

Fix
~~~
- Add homebrew installation instructions. [Zhiming Wang]
- Using ``-y`` with no argument casted an exception instead of
  displaying usage. (fixes #41) [Valentin Lab]


0.5.0 (2017-03-23)
------------------

New
~~~
- Introduce ``-y`` option to force full yaml output. [Valentin Lab]

  By default, output of literal string where directly printed unquoted and
  useable. If this is very useful, there are many cases where this is not
  consistent and is ambiguous, especially when this string is itself a
  YAML representation.

  This could actually lead to subtle bugs occuring when re-using
  ``shyaml`` output for further parsing.

  So if you want unquoted literal types to further process these elements,
  use ``-y``. If you expect a string and wan't it plain raw, avoid ``-y``.



0.4.2 (2017-02-08)
------------------

Fix
~~~
- ``<<:`` YAML merging facility support. [Valentin Lab]


0.4.1 (2016-08-29)
------------------

Fix
~~~
- On python2, unicode strings would be displayed literaly (fixes #26).
  [Valentin Lab]

  ``str`` is not the correct type to match all type of strings in python
  2. So unicode strings (usually produced thanks to accentuated
  characters) would be printed quoted (the python representation).



0.4.0 (2016-01-11)
------------------

New
~~~
- Avoid reordering mapping keys in the output. [Valentin Lab]

  Several commands from ``shyaml`` will output YAML themselves. But in the
  process, the whole content is parsed and re-dumped. This can lead to
  differences with the original inputs. The ordering of keys can be
  annoying in some use cases, even if, well mappings should not be
  ordered, these are ordered by the sequential nature of a file, and using
  'omap' is often tedious. ``shyaml`` now keep the original order the keys
  were met.



0.3.4 (2015-03-06)
------------------

New
~~~
- Added a nice ``--help`` doc. [Valentin Lab]
- Added ``key-values{,-0}`` argument to get key and values in one go.
  [Valentin Lab]
- Error is casted if no default specified and the key is not existent.
  [Valentin Lab]

Changes
~~~~~~~
- Be more informative in some key related error message. (fixed #7)
  [Valentin Lab]


0.2.2 (2014-03-19)
------------------

Fix
~~~
- No argument at all was treated as one empty string argument. Thx Yassa
  Bb. (fixes #6) [Valentin Lab]


0.2.1 (2013-11-23)
------------------

New
~~~
- Python3 support. [Valentin Lab]

Fix
~~~
- Keys can now be empty or contains dots ``.`` if they are properly
  escaped (fixes #5, thanks to Daniel Giribet) [Daniel Giribet]


0.2.0 (2013-05-03)
------------------

New
~~~
- Support for iteration in sequence and struct in one go. [Valentin Lab]

Fix
~~~
- Forgot to mention ``./autogen.sh`` execution when getting the code
  from git, and be more clear about other means of installation.
  [Valentin Lab]


0.1.3 (2013-03-29)
------------------

Fix
~~~
- Removed the spurious line feed at the end of any ``shyaml`` output.
  [Valentin Lab]
- Support querying for... nothing. Which now returns the whole input
  YAML. [Valentin Lab]

  Before this fix, you couldn't ask for ``shyaml get-value`` alone, even if it
  makes sense but is completely useless as it returns the whole YAML input.



0.1.2 (2013-03-23)
------------------

New
~~~
- Support for list indexes (see README.rst). [Valentin Lab]
- Catch exceptions when parsing structure and output a clean error
  message. [Valentin Lab]


0.1.1 (2013-02-27)
------------------

Changes
~~~~~~~
- Some minor enhancements, and an "Install" section. [Valentin Lab]


0.1.0 (2013-02-27)
------------------
- First import. [Valentin Lab]


