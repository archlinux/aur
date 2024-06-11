# Maintainer: Yonggang Li <gnaggnoyil@gmail.com>

# Built with:
# ```
# extra-x86_64-build \
#   -- \
#   -I ~/.cache/yay/python-accessible-pygments/python-accessible-pygments-0.0.5-1-any.pkg.tar.zst \
#   -I ~/.cache/yay/python-pydata-sphinx-theme/python-pydata-sphinx-theme-0.15.3-1-any.pkg.tar.zst \
#   -I ~/.cache/yay/python-sphinx-book-theme/python-sphinx-book-theme-1.1.2-1-any.pkg.tar.zst \
#   -I ~/.cache/yay/papi/papi-7.1.0-2-x86_64.pkg.tar.zst \
#   -- \
#   http_proxy=http://127.0.0.1:1081 https_proxy=http://127.0.0.1:1081
# ```

pkgname=hpx
pkgver=1.10.0
pkgrel=1
pkgdesc='The C++ Standard Library for Parallelism and Concurrency'
arch=('i686' 'x86_64')
url="https://github.com/STEllAR-GROUP/${pkgname}"
license=("BSL-1.0")
conflicts=("${pkgname}-git")
makedepends=(
    'cmake'
    # For `HPX_WITH_DOCUMENTATION`
    'doxygen'
    'python-sphinx'
    'python-sphinxcontrib-bibtex'
    'python-sphinx-copybutton'
    'python-sphinx-book-theme' # aur and requires `aur/python-accessible-pygments` and `aur/python-pydata-sphinx-theme`
    'python-breathe'
    # Should dependencies for examples list as makedepends or depends?
    'hdf5'
    #'onetbb' # Not sure the difference between this and intel-oneapi-tbb
)
depends=(
    'boost' # As a library it requires boost headers
    'gperftools' # For tcmalloc
    'cuda'
    'openmpi'
    'hwloc'
    # `bzip2` is already a dependency of `boost-libs`->`boost`
    'snappy'
    # `zlib` is already a dependency of
    # * `boost-libs`->`boost` and
    # * `zstd`->`boost-libs`->`boost`
    ## `pkgconf` is already a dependency of base-devel
    'asio'
    'papi' # aur
    'nlohmann-json' # For `HPX_COMMAND_LINE_HANDLING_LOCAL_WITH_JSON_CONFIGURATION_FILES`
)
source=(
    '0001-fix_nlohmann_json_target.patch'
    '0002-fix_conditionally_unincluded_header.patch'
    # As of v1.10.0 hpx doc build cannot be run in pararrel when doc output
    # formats contain at least singlehtml and latexpdf due to at least two race
    # conditions:
    # 1. The following code in `cmake/templates/conf.py.in`:
    #     ```
    #     if not os.path.exists(basedir):
    #         os.makedirs(basedir)
    #     ```
    # 2. The `cmake -E copy_if_different` command registered to documentation
    #    build targets by `add_custom_command`
    # To workaround this, the solution we use is to first apply this patch to
    # detach all documentation build targets from cmake `ALL` target. Then in
    # actual build process we first build others in parallel as normal, then
    # force single core build for docs.
    '0003-workaround_to_depart_doc_build.patch'
    "https://github.com/STEllAR-GROUP/${pkgname}/archive/refs/tags/v${pkgver}.zip"
)
sha512sums=('166f0c1b7e54dbbf26805fa27750c4519f4c25b7bce629e5f60308ef49f1e7d7ebbd31f261c04052ed59d42ad0355d26507651f64559527e46b64470bcd10c24'
            '27950978979e76b19cc699b8441dfa6e4722fc2e48c082c3869e5ddaf5369f268b992f62bb295ae06c4fc87e4ca769111573ccdcdadd30e451ff7fea19bb957e'
            'acb6489bb31eee6282191335f573e3281b61e1a2f12f0d8e949546f27c96b4273189093b0ff2df42286af7ae183fa562b0e2d37ea9796a918998d0322cd25817'
            'bce580c06eb455149134dc75ff7173b9c2fd55014b4c6ee16938ce5f50e7c6bb6964e29aa8ba3b113361780894704df071de75a0403f82aad45fe8fe01b9477c')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -i "${srcdir}/0001-fix_nlohmann_json_target.patch" -p1
    patch -i "${srcdir}/0002-fix_conditionally_unincluded_header.patch" -p1
    patch -i "${srcdir}/0003-workaround_to_depart_doc_build.patch" -p1
}

build() {
    local _env=(
        # As of date 20240609 Arch cuda package no longer set links at
        # /opt/cuda/bin
        CC=/usr/bin/gcc-13
        CXX=/usr/bin/g++-13
    )

    local _args=(
        -DCMAKE_BUILD_TYPE=Release
        -DCMAKE_INSTALL_PREFIX=/usr
        
        #-DHPX_WITH_MALLOC=tcmalloc # Default
        -DHPX_WITH_CUDA=ON
        -DHPX_WITH_PARCELPORT_MPI=ON
        #-DHPX_WITH_PARCELPORT_TCP=ON # Default
        # No lci package in offical/aur
        #-DHPX_WITH_PARCELPORT_LCI=OFF # Default
        # No apex package in offical/aur
        #-DHPX_WITH_APEX=OFF # Default de facto
        # (Stackful) Coroutine support in HPX:
        # * On non-x86 platforms `HPX_WITH_GENERIC_CONTEXT_COROUTINES` must be
        #   `ON`, where the support is based on Boost.Context
        # * On x86 platforms `HPX_WITH_GENERIC_CONTEXT_COROUTINES` can be `OFF`.
        #   And when it's `OFF`, win32 uses Boost.Fiber, linux uses hpx's own
        #   implementation, and other POSIX platforms and bgq and powerpc and
        #   s390x uses another hpx's own implementation
        # * APPLE, BLUEGENEQ, riscv64 and arm64 have the default value as `ON`.
        #   the rest have the default value as `OFF`
        # Use default value here since vcpkg doesn't set this cache var as well.
        #-DHPX_WITH_GENERIC_CONTEXT_COROUTINES=OFF # Default for linux x86/x64
        # Default value is not set, and hpx headers will set the corresponding
        # compile def values (64 on Linux x86/x64 non Xeon phi platforms), hence
        # the "default" 64 value mentioned in doc.
        #-DHPX_WITH_MAX_CPU_COUNT=64 # Semi Default
        -DHPX_WITH_CXX_STANDARD=20 # Default is 17, should we set to 17 since it's a public property?
        # Set this option to `ON` only to allow `tests.examples` target to be
        # enabled.
        #-DHPX_WITH_EXAMPLES=ON # Default
        #-DHPX_WITH_TESTS=ON # Default

        #-DHPX_WITH_AUTOMATIC_SERIALIZATION_REGISTRATION=ON # Default
        # Default value is `"${PROJECT_BINARY_DIR}/scripts"`. Should not touch.
        #-DHPX_WITH_BENCHMARK_SCRIPTS_PATH=blah # Default
        # Since we produce binary packages for Arch, this option need to be set
        # as `ON`, although it's not used widely in the project
        -DHPX_WITH_BUILD_BINARY_PACKAGE=ON
        -DHPX_WITH_CHECK_MODULE_DEPENDENCIES=ON
        #-DHPX_WITH_COMPILER_WARNINGS=ON # Default
        # Current v1.10.0 will have `unused-parameter` error if we turn this on.
        #-DHPX_WITH_COMPILER_WARNINGS_AS_ERRORS=OFF # Default
        -DHPX_WITH_COMPRESSION_BZIP2=ON
        -DHPX_WITH_COMPRESSION_SNAPPY=ON
        -DHPX_WITH_COMPRESSION_ZLIB=ON
        # Vc support is deprecated. No `eve` and `sve` in offical/aur. (There's
        # an `eve-git` in aur tho). And `eve` requires HPX to use C++20 or
        # later. So we choose `STD_EXPERIMENTAL_SIMD` here.
        #-DHPX_WITH_DATAPAR=ON # Default for `STD_EXPERIMENTAL_SIMD`
        -DHPX_WITH_DATAPAR_BACKEND=STD_EXPERIMENTAL_SIMD
        # `HPX_WITH_DATAPAR_VC_NO_LIBRARY` is not an option for 
        # `STD_EXPERIMENTAL_SIMD` case.
        #-DHPX_WITH_DEPRECATION_WARNINGS=ON # Default
        -DHPX_WITH_DISABLED_SIGNAL_EXCEPTION_HANDLERS=ON
        #-DHPX_WITH_DYNAMIC_HPX_MAIN=ON # Default for Linux and Apple
        #-DHPX_WITH_FAULT_TOLERANCE=OFF # Default
        # We need to set this as `ON` as long as we link libraries that's not
        # on the system ld library path
        -DHPX_WITH_FULL_RPATH=OFF
        #-DHPX_WITH_GCC_VERSION_CHECK=ON # Default
        #-DHPX_WITH_HIDDEN_VISIBILITY=OFF # Default
        #-DHPX_WITH_HIP=OFF # Default for GCC
        # After `hipsycl` transferred into `adaptivecpp`, it is preferred that a
        # `adaptivecpp-X` package that provides `hipsycl`. However, as of the
        # date 20240606, there're only `adaptivecpp-X-git` and outdated
        # `hipsycl-X` and `hipsycl-X-git` packages. Therefore we prefer adding
        # `adaptivecpp-X` packages first, then enable `HPX_WITH_HIPSYCL`
        # And since we are building this package with GCC, sycl with OneAPI
        # support cannot be enabled either. From the two points above,
        # `HPX_WITH_SYCL` should then just be `OFF`.
        #-DHPX_WITH_HIPSYCL=OFF # Default
        -DHPX_WITH_IGNORE_COMPILER_COMPATIBILITY=OFF
        #-DHPX_WITH_LOGGING=ON # Default
        -DHPX_WITH_MODULES_AS_STATIC_LIBRARIES=OFF
        # It seems this option enables code that lowers current thread priority,
        # and user can control whether to run this code or not using config
        # at run time? Perhaps it's better to enable this option?
        -DHPX_WITH_NICE_THREADLEVEL=ON
        #-DHPX_WITH_PARCEL_COALESCING=On # Default
        # Let's see what would happen if we force this option as `ON` with cuda
        # (and optionally lci) enabled.
        # OK, setting this option to on with cuda enable would result in
        # corresponding `pc.in` file containing genexp `$<HOST_LINK>` (No
        # explicit generation of this genexp in hpx src. Not sure if it's due to
        # cmake version or something), which is not suitable for
        # `file(GENERATE)`
        #-DHPX_WITH_PKGCONFIG=OFF # Default for cuda enabled
        # Experimental in HPX. And it affects build process only too.
        #-DHPX_WITH_PRECOMPILED_HEADERS=OFF # Default
        #-DHPX_WITH_RUN_MAIN_EVERYWHERE=OFF # Default
        #-DHPX_WITH_STACKOVERFLOW_DETECTION=OFF # Default for linux Release
        # We build shared library here for Archlinux
        #-DHPX_WITH_STATIC_LINKING=OFF # Default
        # HPX's cmakelists will check support anyway.
        #-DHPX_WITH_SUPPORT_NO_UNIQUE_ADDRESS_ATTRIBUTE=ON # Default
        #-DHPX_WITH_SYCL=OFF # Default
        #-DHPX_WITH_SYCL_FLAGS="" # Default
        #-DHPX_WITH_UNITY_BUILD=OFF # Default
        # Generated ycm file doesn't seem to be able to be "packaged". It's more
        # just files used specified to current cmake source dir
        #-DHPX_WITH_VIM_YCM=OFF # Default
        #-DHPX_WITH_ZERO_COPY_SERIALIZATION_THRESHOLD=8192 # Default

        # Note HPX hard requires asio, and not the boost one.
        #-DHPX_WITH_ASIO_TAG=XXXX # Default
        #-DHPX_WITH_COMPILE_ONLY_TESTS=ON # Default
        #-DHPX_WITH_DISTRIBUTED_RUNTIME=ON # Default
        -DHPX_WITH_DOCUMENTATION=ON
        -DHPX_WITH_DOCUMENTATION_OUTPUT_FORMATS=html\;singlehtml\;latexpdf\;man
        -DHPX_WITH_EXAMPLES_HDF5=ON
        -DHPX_WITH_EXAMPLES_OPENMP=ON
        # Since Archlinux drops qt4 support and move it to aur...
        #-DHPX_WITH_EXAMPLES_QT4=OFF # Default
        # No offical/aur package for https://github.com/sandialabs/qthreads
        #-DHPX_WITH_EXAMPLES_QTHREADS=OFF # Default
        # See hpx/issues/6504 for why we disable this for now.
        #-DHPX_WITH_EXAMPLES_TBB=OFF # Default
        #-DHPX_WITH_EXECUTABLE_PREFIX="" # Default
        #-DHPX_WITH_FAIL_COMPILE_TESTS=ON # Default
        #-DHPX_WITH_FETCH_APEX=OFF # Default # Should be OFF
        #-DHPX_WITH_FETCH_ASIO=OFF # Default
        #-DHPX_WITH_FETCH_BOOST=OFF # Default # Should be OFF
        #-DHPX_WITH_FETCH_GASNET=OFF # Default
        #-DHPX_WITH_FETCH_HWLOC=OFF # Default
        #-DHPX_WITH_FETCH_LCI=OFF # Default # Should be OFF
        #-DHPX_WITH_IO_COUNTERS=ON # Default for linux and HPX_WITH_DISTRIBUTED_RUNTIME set to ON
        #-DHPX_WITH_LCI_TAG=XXX # Default
        #-DHPX_WITH_PARALLEL_LINK_JOBS=2 # Default
        # Allow all parts of tests (including `tests.examples`) to be built.
        #-DHPX_WITH_TESTS_BENCHMARKS=ON # Default
        #-DHPX_WITH_TESTS_EXAMPLES=ON # Default
        #-DHPX_WITH_TESTS_EXTERNAL_BUILD=ON # Default
        -DHPX_WITH_TESTS_HEADERS=ON
        #-DHPX_WITH_TESTS_REGRESSIONS=ON # Default
        #-DHPX_WITH_TESTS_UNIT=ON # Default
        -DHPX_WITH_TOOLS=ON

        #-DHPX_COROUTINES_WITH_SWAP_CONTEXT_EMULATION=OFF # Default # Windows only
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_COROUTINES_WITH_THREAD_SCHEDULE_HINT_RUNS_AS_CHILD=OFF # Default
        # No idea if we should enable this or not. Enabling this might be ok
        # but perhaps following the default value is better.
        #-DHPX_WITH_COROUTINE_COUNTERS=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_IO_POOL=ON # Default
        #-DHPX_WITH_MAX_NUMA_DOMAIN_COUNT=8 # Default
        # No idea if we should enable this or not. It seems that this option
        # requires `HPX_WITH_THREAD_LOCAL_STORAGE` to be `ON`. Plus, this option
        # and `HPX_WITH_THREAD_LOCAL_STORAGE` both seem to be originally used
        # for intel compiler support, and it seems later commits of hpx make
        # default value of this option be `OFF` for a reason. Perhaps following
        # the default value is better.
        #-DHPX_WITH_SCHEDULER_LOCAL_STORAGE=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_SPINLOCK_DEADLOCK_DETECTION=OFF # Default
        #-DHPX_WITH_SPINLOCK_POOL_NUM=128 # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_STACKTRACES=ON # Default
        #-DHPX_WITH_STACKTRACES_DEMANGLE_SYMBOLS=ON # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_STACKTRACES_STATIC_SYMBOLS=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_BACKTRACE_DEPTH=20 # Default
        #-DHPX_WITH_THREAD_BACKTRACE_ON_SUSPENSION=OFF # Default
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_THREAD_CREATION_AND_CLEANUP_RATES=OFF # Default
        # No idea if we should eanble this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_CUMULATIVE_COUNTS=ON # Default
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. But VcPkg enable this option. Perhaps following
        # VcPkg value is better.
        -DHPX_WITH_THREAD_IDLE_RATES=ON
        # No idea if we should enable this or not. Same as discussed for
        # `HPX_WITH_SCHEDULER_LOCAL_STORAGE`. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_LOCAL_STORAGE=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # valuie is better.
        #-DHPX_WITH_THREAD_MANAGER_IDLE_BACKOFF=ON # Default
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_THREAD_QUEUE_WAITTIME=OFF # Default
        #-DHPX_WITH_THREAD_STACK_MMAP=ON # Default de facto
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_THREAD_STEALING_COUNTS=OFF # Default
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. But VcPkg enable this option. Perhaps following
        # Vcpkg value is better.
        -DHPX_WITH_THREAD_TARGET_ADDRESS=ON
        #-DHPX_WITH_TIMER_POOL=ON # Default
        #-DHPX_WITH_WORK_REQUESTING_SCHEDULERS=ON # Default

        # This options seems to be more related to debug info.
        #-DHPX_WITH_AGAS_DUMP_REFCNT_ENTRIES=OFF

        #-DHPX_WITH_NETWORKING=ON # Default
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_PARCELPORT_ACTION_COUNTERS=OFF # Default de facto
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_PARCELPORT_COUNTERS=OFF # Default de facto
        # No offical/aur package for https://gasnet.lbl.gov/
        #-DHPX_WITH_PARCELPORT_GASNET=OFF # Default de facto
        # Since lci parcelport is set to `OFF`
        #-DHPX_WITH_PARCELPORT_LCI_LOG=OFF # Default de facto
        # Since lci parcelport is set to `OFF`
        #-DHPX_WITH_PARCELPORT_LCI_PCOUNTER=OFF # Default de facto
        # Experimental in HPX. `libfabric` is the dependency
        #-DHPX_WITH_PARCELPORT_LIBFABRIC=OFF # Default de facto
        # No idea if we should enable this or not. This package is built for
        # Archlinux releases. Perhaps following the default value is better.
        #-DHPX_WITH_PARCEL_PROFILING=OFF # Default de facto for `HPX_WITH_APEX` being `OFF`

        # The only offical package that provides `ittnotify.h` is
        # `intel-oneapi-basekit`, yet conflicts with `intel-oneapi-common` and
        # thus its child packages. No idea why. Disable it for now.
        #-DHPX_WITH_ITTNOTIFY=OFF # Default de facto
        # No idea if we should enable this or not. Perhaps enabling this is
        # better.
        -DHPX_WITH_PAPI=ON

        #-DHPX_WITH_ATTACH_DEBUGGER_ON_TEST_FAILURE=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_PARALLEL_TESTS_BIND_NONE=OFF # Default
        # This seems to affect tests only. Though we already decided to disable
        # it.
        #-DHPX_WITH_SANITIZERS=OFF # Default de facto
        #-DHPX_WITH_TESTS_COMMAND_LINE="" # Default de facto
        # This seems to affect tests only.
        #-DHPX_WITH_TESTS_DEBUG_LOG=OFF # Default
        # This seems to affect tests only.
        #-DHPX_WITH_TESTS_DEBUG_LOG_DESTINATION=cout # Default
        #-DHPX_WITH_TESTS_MAX_THREADS_PER_LOCALITY=0 # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_DEBUG_INFO=OFF # Default at least for release
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_DESCRIPTION_FULL=OFF # Default
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_THREAD_GUARD_PAGE=ON # Default
        #-DHPX_WITH_VALGRIND=OFF # Default de facto
        # No idea if we should enable this or not. Perhaps following the default
        # value is better.
        #-DHPX_WITH_VERIFY_LOCKS=OFF # Default at least for release
        #-DHPX_WITH_VERIFY_LOCKS_BACKTRACE=OFF # Default

        # The corresponding macro doesn't seem to work when cuda is enabled. But
        # we follow the default value of `ON` anyway.
        #-DHPX_ALLOCATOR_SUPPORT_WITH_CACHING=ON # Default
        -DHPX_COMMAND_LINE_HANDLING_LOCAL_WITH_JSON_CONFIGURATION_FILES=ON
        #-DHPX_DATASTRUCTURES_WITH_ADAPT_STD_TUPLE=ON # Default
        # It seems `hpx::variant` is an alias of `std::variant` with cxx17 copy
        # elision.
        #-DHPX_DATASTRUCTURES_WITH_ADAPT_STD_VARIANT_DEFAULT=OFF # Default for cxx17 copy elision
        # No need if hpx uses cxx17 filesystem
        #-DHPX_FILESYSTEM_WITH_BOOST_FILESYSTEM_COMPATIBILITY=OFF # Default for cxx17 filesystem
        # Doesn't seem to be needed since this option makes hpx uses boost
        # iterator instead of std ones.
        #-DHPX_ITERATOR_SUPPORT_WITH_BOOST_ITERATOR_TRAVERSAL_TAG_COMPATIBILITY=OFF # Default
        #-DHPX_LOGGING_WITH_SEPARATE_DESTINATIONS=ON # Default
        # `whats_new_1_8_0.rst` mentions the following 3 options as "that these
        # options enable questionable functionalities".
        # `ALLOW_CONST_TUPLE_MEMBERS` seems to only enforce some questionable
        # `const_cast`. So better disable this option.
        #-DHPX_SERIALIZATION_WITH_ALLOW_CONST_TUPLE_MEMBERS=OFF # Default
        # Vanilla HPX seems to strongly discourage the serialization of raw
        # pointers. Though I yet haven't find some direct risks. Anyway, disable
        # this option.
        #-DHPX_SERIALIZATION_WITH_ALLOW_RAW_POINTER_SERIALIZATION=OFF # Default
        # This option seems to give to strong assumptions, probably only
        # suitable for SHAD. Disable this option anyway.
        #-DHPX_SERIALIZATION_WITH_ALL_TYPES_ARE_BITWISE_SERIALIZABLE=OFF # Default
        -DHPX_SERIALIZATION_WITH_BOOST_TYPES=ON
        -DHPX_SERIALIZATION_WITH_SUPPORTS_ENDIANESS=ON
        # HPX says this is only intended for systems like FreeBSD.
        #-DHPX_TOPOLOGY_WITH_ADDITIONAL_HWLOC_TESTING=OFF # Default
        # No pwr package in offical/aur .
        #-DHPX_WITH_POWER_COUNTER=OFF # Default

        #-DHPX_WITH_FETCH_JSON=OFF # Default de facto
        #-DHPX_WITH_PARCELPORT_MPI_MULTITHREADED=ON # Default
    )

    mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    env ${_env[@]} cmake ${_args[@]} ..
    cmake --build . --config Release
    # Build docs. CMake will overwrite `MAKEFLAGS`.
    cmake --build . --config Release --target docs -j 1
}

# Most tests fail. Need further investigation.
#check() {
#    cd "${srcdir}/${pkgname}-${pkgver}/build"
#    ctest --build-config Release --stop-on-failure .
#}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    DESTDIR=${pkgdir} make install
    # Installed license file of hpx does not lay on Arch's expected location.
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/share/hpx/LICENSE_1_0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
