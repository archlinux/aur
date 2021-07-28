Changelog
=========

Unreleased
----------

2.1.0
-----

- Add support for factory_boy >= 3.2.0
- Drop support for Python 2.7, 3.4, 3.5. We now support only python >= 3.6.
- Drop support for pytest < 4.6. We now support only pytest >= 4.6.
- Add missing versions of python (3.9 and 3.10) and pytest (6.x.x) to the CI test matrix.


2.0.3
-----

- Fix compatibility with pytest 5.


2.0.2
-----

- Fix warning `use of getfuncargvalue is deprecated, use getfixturevalue` (sliverc)


2.0.1
-----

Breaking change due to the heavy refactor of both pytest and factory_boy.

- Failing test for using a `attributes` field on the factory (blueyed)
- Minimal pytest version is 3.3.2 (olegpidsadnyi)
- Minimal factory_boy version is 2.10.0 (olegpidsadnyi)


1.3.2
-----

- use {posargs} in pytest command (blueyed)
- pin factory_boy<2.9 (blueyed)


1.3.1
-----

- fix LazyFixture evaluation order (olegpidsadnyi)


1.3.0
-----

- replace request._fixturedefs by request._fixture_defs (p13773)


1.2.2
-----

- fix post-generation dependencies (olegpidsadnyi)


1.2.1
-----

- automatical resolution of the post-generation dependencies (olegpidsadnyi, kvas-it)


1.1.6
-----

- fixes fixture function module name attribute (olegpidsadnyi)
- fixes _after_postgeneration hook invocation for deferred post-generation declarations (olegpidsadnyi)


1.1.5
-----

- support factory models to be passed as strings (bubenkoff)


1.1.3
-----

- circular dependency determination is fixed for the post-generation (olegpidsadnyi)


1.1.2
-----

- circular dependency determination is fixed for the RelatedFactory attributes (olegpidsadnyi)


1.1.1
-----

- fix installation issue when django environment is not set (bubenkoff, amakhnach)


1.1.0
-----

- fixture dependencies on deferred post-generation declarations (olegpidsadnyi)


1.0.3
-----

- post_generation extra parameters fixed (olegpidsadnyi)
- fixture partial specialization (olegpidsadnyi)
- fixes readme and example (dduong42)
- lazy fixtures (olegpidsadnyi)
- deferred post-generation evaluation (olegpidsadnyi)
- hooks (olegpidsadnyi)


1.0.2
-----

- refactoring of the fixture function compilation (olegpidsadnyi)
- related factory fix (olegpidsadnyi)
- post_generation fixture dependency fixed (olegpidsadnyi)
- model fixture registration with specific name (olegpidsadnyi)
- README updated (olegpidsadnyi)

1.0.1
-----

- use ``inflection`` package to convert camel case to underscore (bubenkoff)

1.0.0
-----

- initial release (olegpidsadnyi)
