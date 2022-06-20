Changes from version 4.1 to 4.2
===============================

This update mostly involves some improvements to the new patch-based
computations, in response to feedback from users, who have been trying it out
in a variety of use cases.  Especially note the new optional ``func`` argument
to `BinnedCorr2.estimate_cov` and `estimate_multi_cov`, which lets you
calculate covariances of arbitrary functions of a correlation object or list
of correlation objects.  See `Covariance of Derived Quantities` for details.

Another big improvement is the ability to correctly perform three-point
cross-correlations. I still don't have heterogeneous cross correlations like
NGG or NNG, but now NNN, GGG, and KKK can be done correctly for 2 or 3
different catalogs.  This update does technically involve an API change,
since the old code tried to do something when given 3 catalogs, but it
wasn't really correct, and (consequently) I don't think anyone was actually
trying to use that feature.

See the listing below for the complete list of new features and changes.
`Relevant PRs and Issues,
<https://github.com/rmjarvis/TreeCorr/milestone/7?closed=1>`_
whose issue numbers are listed below for the relevant items.

.. note::

    This will be the last (non-bug-fix) TreeCorr release to support Python 2.7.
    It is becoming harder to continue to support this platform now that it is
    officially sunsetted, so we encourage all users to switch their code to
    Python 3.x ASAP.  TreeCorr is currently compatible with Python versions
    2.7, 3.5, 3.6, 3.7, 3.8, 3.9.  We will probably also drop 3.5 in the next
    release as well, since that is also retired at this point.

API Changes
-----------

- Changed the 3pt process function, when given 3 arguments, to accumulate all
  triangles where points from the three input catalogs can fall into any
  of the three triangle corners.  If you need the old behavior of keeping
  track of which catalog goes into which triangle corner, the new
  ???CrossCorrelation classes do so both more efficiently and more
  accurately than the previous code. (#115)
- Changed the `NNNCorrelation.calculateZeta` function to only take
  RDD and DRR parameters for the cross terms (if desired) rather than all
  six (DDR, DRD, RDD, DRR, RDR, RRD).  The new cross-correlation behavior of
  the `NNNCorrelation.process` function now efficiently calculates in RDD what
  used to be calculated in three calls for DDR, DRD, and RDD.  Likewise the
  new DRR calculates what used to require DRR, RDR, and RRD. (#122)

Performance improvements
------------------------

- Only show at most 10 rows with NaNs in cases where there are lots of such
  rows. (#111)
- No longer remakes patches and writes them to disk if they are already present
  on disk.  If you want to force a rewrite for any reason, you can explicitly
  call `Catalog.write_patches`. (#116)
- Computing the data/random cross correlations for 3pt are now much faster,
  since you only need one call for RDD and one for DRR, not all the 6 different
  permuations. (Specifically, DDR, DRD, RDR, RRD are no longer needed.) (#122)

New features
------------

- Implement patch-based calculations for 3-point correlations.  This enables
  things like jackknife correlations, low-memory calculations, and MPI execution
  when doing NNN, KKK, or GGG correlations. (#97, #125)
- Allow min_rpar and max_rpar for Euclidean metric.  Also Periodic, although
  I don't know if that's useful. (#101)
- Added ability to read from hdf5 catalogs.  (#106)
- Added ability to use named columns in ASCII files if the file has column
  names. (#108)
- Added optional initialize=False and finalize=False options to process
  functions. (#109)
- Added ability to do 3 point cross-correlations properly, rather than the not
  exactly correct version that had been implemented.  Not all combinations are
  implemented.  So far just GGG, KKK, and NNN. (#115)
- Added ability to read from parquet catalogs.  (#117)
- Added optional func parameter to estimate_cov and estimate_multi_cov. (#118)
- Added ability to write output files as hdf5.  (#122)

Bug fixes
---------

- Fixed a couple problems that could arise in patch-based calculations when
  one or more of the patches have no objects. (#123)


Changes from version 4.2.0 to 4.2.1
===================================

- Fixed a bug when running NN correlations with MPI.  Thanks to Joe Zuntz for
  the bug report. (#127)

Changes from version 4.2.1 to 4.2.2
===================================

- Fixed a build problem with gcc versions 10 and 11.  Thanks to Johannes Lange
  for reporting the problem.

Changes from version 4.2.2 to 4.2.3
===================================

- Fixed a bug in the Map^3 calculation when the aperture radii are different.
  Thanks to Laila Linke for both finding the problem and providing the fix. (#128)

Changes from version 4.2.3 to 4.2.4
===================================

- Fixed a bug when running the Rlens metric with patches. Thanks to Marina Ricci
  for the bug report. (#131)

Changes from version 4.2.4 to 4.2.5
===================================

- Fixed bugs in the shot noise variance estimate for GGG and the propagation of
  the error to Map3.  Thanks to Lucas Secco for the bug report. (#133)

Changes from version 4.2.5 to 4.2.6
===================================

- Fixed a numerical bug that could suppress the signal in GG correlations in
  spherical coordinates if there are multiple objects at the same position.
  Thanks to Sandra Unruh for the bug report. (#134)

Changes from version 4.2.6 to 4.2.7
===================================

- Fixed a memory problem when computing patch-based covariance matrix when npatches
  is moderately large (e.g. 500). Thanks to Joe Zuntz and Judit Prat for finding and
  reporting the bug. (#137)

Changes from version 4.2.7 to 4.2.8
===================================

- Fixed a bug in the calculation of jackknife and sample variance when only the second
  catalog in a cross-correlation uses patches.

Changes from version 4.2.8 to 4.2.9
===================================

- Fixed a error in the low_mem calculation when ra_units and/or dec_units are not
  radians. Thanks to Chun-Hao To for the bug report. (#144)
