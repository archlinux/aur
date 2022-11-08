1.1 (2022-10-06)
================

- Drop support for Python 2.7, 3.4, 3.5, 3.6.

- Add support for Python 3.8, 3.9, 3.10.

- Drop runtime dependency on setuptools / pkg_resources by switching to
  ``importlib.metadata``.

1.0 (2017-10-11)
================

- Improve the exception message for ``InvalidURI`` to show the ``config_uri``.
  See https://github.com/Pylons/plaster/pull/17

0.5 (2017-06-02)
================

- When a scheme is not supplied, ``plaster.parse_uri`` will now autogenerate
  a scheme from the file extension with the format ``file+<ext>`` instead of
  simply ``<ext>`` (for example, ``file+ini`` instead of ``ini``).
  See https://github.com/Pylons/plaster/pull/16

- Absolute lookups are now pulled from the start of the scheme instead of
  the end. This means that if you want to explicitly define the package that
  the loader is pulled from, use ``package+scheme`` instead of
  ``scheme+package``.
  See https://github.com/Pylons/plaster/pull/16

0.4 (2017-03-30)
================

- Removed the ``plaster.NoSectionError`` exception. It's expected that
  individual loaders should return an empty dictionary of settings in the
  case that a section cannot be found.
  See https://github.com/Pylons/plaster/pull/12

- Expect the ``wsgi`` protocol to raise ``LookupError`` exceptions when
  a named wsgi component cannot be found.
  See https://github.com/Pylons/plaster/pull/12

0.3 (2017-03-27)
================

- Lookup now works differently. First "foo+bar" looks for an installed project
  distribution named "bar" with a loader named "foo". If this fails then it
  looks for any loader named "foo+bar".

- Rename the loader entry point to ``plaster.loader_factory``.

- Add the concept of protocols to ``plaster.get_loader`` and
  ``plaster.find_loaders``.

- ``plaster.find_loaders`` now works on just schemes and protocols
  instead of full ``PlasterURL`` objects and implements the lookup
  algorithm for finding loader factories.

- Change the ``ILoaderInfo`` interface to avoid being coupled to a
  particular uri. ``ILoaderInfo.load`` now takes a ``config_uri``
  parameter.

- Add a ``options`` dictionary to ``PlasterURL`` containing any arguments
  decoded from the query string. Loaders may use these for whatever they wish
  but one good option is default values in a config file.

- Define the ``IWSGIProtocol`` interface which addons can use to implement
  a loader that can return full wsgi apps, servers and filters.

- The scheme is now case-insensitive.

0.2 (2016-06-15)
================

- Allow ``config_uri`` syntax ``scheme:path`` alongside ``scheme://path``.
  See https://github.com/Pylons/plaster/issues/3

- Improve errors to show the user-supplied values in the error message.
  See https://github.com/Pylons/plaster/pull/4

- Add ``plaster.find_loaders`` which can be used by people who need a way
  to recover when ambiguous loaders are discovered via ``plaster.get_loader``.
  See https://github.com/Pylons/plaster/pull/5

- Rename ``plaster.Loader`` to ``plaster.ILoader`` to signify its purpose
  as an interface with no actual implementation.
  See https://github.com/Pylons/plaster/pull/5

- Introduce ``plaster.ILoaderFactory`` to document what the entry point targets
  are expected to implement.
  See https://github.com/Pylons/plaster/pull/5

0.1 (2016-06-12)
================

- Initial release.
