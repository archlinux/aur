# 0.6.5
    - Bugfix for lower star filtrations with edges that come in at exactly 0 (courtesy of Riccardo Ceccaroni)

# 0.6.4
    - Add some includes to ripser.cpp for newer Ubuntu/C++ environments

# 0.6.3
    - Update numpy header

# 0.6.2
    - Prevent simplex assembly in last dimension for improved memory usage (courtesy of Umberto Lupo)

# 0.6.1
    - Lazy import plotting dependencies

# 0.6.0
    - Update C++ backend to commit 286d369 of [ripser](https://github.com/Ripser/ripser) but keeping same functionalities
    - Add support to robinhood hashmap into the C++ Backend
    - Update CI in order to compile C++ with robinhood enable
    - Enable Enclosing radius when threshold is set to infinity

# 0.5.5
    - Updating CI/CD pipeline.

# 0.5.4
    - Fixing issue with inconsistent answers from different scipy.sparse formats, courtesy of Umberto Lupo

# 0.5.3
    - Adding link to ripser++ GPU version by Simon Zhang

# 0.5.2:
    - Cocycle indices now correspond to point cloud indices, even
      when a greedy permutation is in use

# 0.4.1:
    - Fixed packing so C++ is MSVC compatible.

# 0.4.0:
    - Added license to distributed packages.

# 0.3.2:
    - Added support for greedy permutations.
    - Outsourced plotting to persim.
    - Outsourced data construction in examples to tadasets.
    - Revamped documentation.

# 0.3.0:
    - Completed JOSS review, thanks @lmcinnes and @arokem!!
    - Documentation details updated.

# 0.2.7:
    - Updating home url

# 0.2.6:
    - Update license to MIT.

# 0.2.5:
    - Docs and notebooks revamp.
    - Support for Windows.

# 0.2.4:
    - Interface redesign

# 0.2.3:
    - Support for lower star filtrations
    - Notebook on lower star filtrations

# 0.2.1:
    - Sparse distance matrix support
    - Two additional notebooks about sparsity
    - Language agnostic bindings support
    - Bug fixes (filtrations with low number of points)

# 0.2.0:
    - Bug fixes (int rounding error for small magnitude threshold)

# 0.1.7:
    - Generation of cocycles.
    - Handle inf in C code and in plotting.
    - Many new options for plotting diagrams.
