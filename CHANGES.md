#Change Log

## (v0.3) Feature Release (18 Mar 2016)

- Fix bug in ``predict()`` for ``LombScargle`` methods when ``center_data=False``
- Fix bug in ``score()`` for ``LombScargle`` methods when ``center_data=False`` and ``fit_offset=False``
- Make ``supersmoother`` a soft dependency
- New feature: ``gatspy.periodic.TrendedLombScargle`` extends ``LombScargle``
  by adding a linear trend parameter ``d*t`` to the fitted model
- Fixed download URL for RR Lyrae datasets
- Dropped support for Python 2.6 and 3.3

## (v0.2.1) bugfix release (19 Aug 2015)

- Fix installation issues [PR 11](https://github.com/astroML/gatspy/pull/11)
- Fix corner cases in rrlyrae_fast
- Fix so that data does not download on import
- Make astroML a soft dependency
- ipython-style code snippets in documentation

## (v0.2) Feature Release (07 June 2015)

- Improved test coverage & refactored much of the code
- Refactored datasets objects to be picklable for easier parallel analysis
- New feature: ``gatspy.periodic.LombScargleFast`` implements the fast,
  O[N log(N)] periodogram of Press et al.
- New feature: ``gatspy.periodic.RRLyraeTemplateModeler`` implements a
  template-based fitting method, using the RR Lyrae templates from Sesar (2010)
- sphinx-based documentation build added: http://astroML.org/gatspy/

## (v0.1.1) Bug Fix (28 January 2015)

- Catch NaNs in generated rrlyrae light curves
- correctly handle the period=0 case (previously led to assertion error)

## (v0.1) Initial Release (28 January 2015)

- Single-band: ``LombScargle``, ``LombScargleAstroML``, ``SuperSmoother``
- Multi-band: ``LombScargleMultiband``, ``SuperSmootherMultiband``
- Datasets: Sesar 2010 RR Lyrae, generated RR Lyrae from templates.
