1.0.1 (2022-11-06)
==================

- Minor release to cleanup README.

1.0 (2022-11-06)
================

- Drop support for Python 2.7, 3.4, 3.5, 3.6.

- Add support for Python 3.8, 3.9, 3.10.

- Blackify the codebase.

- Switch CI to Github Actions.

0.7 (2019-04-12)
================

- Support Python 3.7.

- Depend on ``pastedeploy >= 2.0`` to enforce new behavior when overriding
  defaults. Default values passed into the loader will now override values in
  the ``[DEFAULT]`` section.
  See https://github.com/Pylons/plaster_pastedeploy/pull/17

0.6 (2018-07-11)
================

- Change ``setup_logging`` to invoke ``logging.config.fileConfig`` with
  ``disable_existing_loggers=False`` to avoid disabling any loggers that were
  imported prior to configuration of the logging system.
  See https://github.com/Pylons/plaster_pastedeploy/pull/16

0.5 (2018-03-29)
================

- Removed environment variable support entirely for now. The feature requires
  bugfixes upstream in PasteDeploy which have not been done yet and this was
  breaking people's environments so it is gone for now.
  See https://github.com/Pylons/plaster_pastedeploy/pull/15

0.4.2 (2017-11-20)
==================

- Fix ``ConfigDict.copy`` so that it works.
  See https://github.com/Pylons/plaster_pastedeploy/pull/14

0.4.1 (2017-07-10)
==================

- Disable environment variable support on Python 2. PasteDeploy does not
  support escaping the contents on Python 2 which means any variable with
  a value of the format %(foo)s would break the parser. Because this is
  implicit behavior it was deemed too error prone to support.
  See https://github.com/Pylons/plaster_pastedeploy/pull/10

- Escape environment variables such that their contents are not subject to
  interpolation. See https://github.com/Pylons/plaster_pastedeploy/pull/10

- Invoke ``logging.basicConfig`` when ``setup_logging`` is called and the
  config file doesn't contain any logging setup or the URI is using the
  ``egg:`` protocol. See https://github.com/Pylons/plaster_pastedeploy/pull/11

0.4 (2017-07-09)
================

- Fix ``get_settings`` for an arbitrary section to follow the same rules as
  PasteDeploy with regards to the handling of defaults. The goal of this
  package is to be compliant with PasteDeploy's format for all sections in
  the file such that there are no surprising format changes in various
  sections.

  Supported added for ``set default_foo = bar`` and ``get foo = default_foo``
  syntax to override a default value and to pull a default value into the
  settings, respectively. In the above example the value ``foo = bar`` would
  be returned. Any other defaults not pulled into the section via either
  interpolation or the ``get`` syntax will be ignored.

  See https://github.com/Pylons/plaster_pastedeploy/pull/6

- Inject environment variables into the defaults automatically. These will
  be available for interpolation as ``ENV_<foo>``. For example if environment
  variable ``APP_DEBUG=true`` then ``%(ENV_APP_DEBUG)s`` will work within the
  ini file. See https://github.com/Pylons/plaster_pastedeploy/pull/7

- ``get_settings`` and ``get_wsgi_app_settings`` both return only the local
  config now. However, the returned object has a ``global_conf`` attribute
  containing the defaults as well as a ``loader`` attribute pointing at
  the loader instance.
  See https://github.com/Pylons/plaster_pastedeploy/pull/8

0.3.2 (2017-07-01)
==================

- Resolve an issue in which ``NoSectionError`` would not be properly caught on
  Python 2.7 if the ``configparser`` module was installed from PyPI.
  See https://github.com/Pylons/plaster_pastedeploy/issues/5

0.3.1 (2017-06-02)
==================

- Recognize the ``pastedeploy+egg`` scheme as an ``egg`` type.

0.3 (2017-06-02)
================

- Drop the ``ini`` scheme and replace with ``file+ini`` and ``pastedeploy``.
  Also rename ``ini+pastedeploy`` and ``egg+pastedeploy`` to
  ``pastedeploy+ini`` and ``pastedeploy+egg`` respectively.
  See https://github.com/Pylons/plaster_pastedeploy/pull/4

0.2.1 (2017-03-29)
==================

- Fix a bug in 0.2 in which an exception was raised for an invalid section
  if the a non-config-file-based protocol was used.

0.2 (2017-03-29)
================

- No longer raise ``plaster.NoSectionError`` exceptions. Empty dictionaries
  are returned for missing sections and a user should check ``get_sections``
  for the list of valid sections.

0.1 (2017-03-27)
================

- Initial release.
