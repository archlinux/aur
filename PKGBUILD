# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=strumpack
pkgname="${_pkgname}-git"
pkgver=8.0.0.r26.geb0d41c
pkgrel=1
pkgdesc="Library providing linear algebra routines and linear system solvers for spare and for dense rank-structured linear systems."
arch=('x86_64')
url="https://github.com/pghysels/STRUMPACK"
license=('LicenseRef-Custom')
depends=(
    'scotch'
    'parmetis'
    'butterflypack'
    'scalapack'
    'lapack'
    'blas'
    'libgomp'
    'libgfortran'
    'libgcc'
    'libstdc++'
    'openmpi'
    'openmp'
    'glibc'
)
makedepends=(
    'git'
)
checkdepends=()
optdepends=(
    'python: For Python API usage'
    'python-numpy: For Python API usage'
    'python-scikit-base: For Python API usage'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${pkgname}::git+${url}"
    "0001-link-butterflypack.patch"
    "0002-fix-rpath.patch"
)
b2sums=('SKIP'
        '8e61e6f70ff9e7d63c6ab95464130aa33ebd79fbb92185fc5d6a94eb974a62ebcf8926e471eb1db6f5267d5f0d2d357073e43cedfa4ef75c414c70bd147fb0ae'
        '1d43b742e41b5ba9d9fb64b094798bc93a82404ddcd71cb0e7d858297286f74634bbd0c61115bc538010ad0b2daaa0d1529281aa38d84d40698a1f11a8a294cb')
options=()

pkgver() {
    cd "$pkgname"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "${pkgname}"

    # The headers haven't been updated in HODLR
    sed -i 's/\(.\)C_BPACK_wrapper\.h/\1BPACK_wrapper.h/g' src/HODLR/HODLRWrapper.cpp

    # Make all of the header files respect CMAKE_INSTALL_INCLUDEDIR
    for f in $(find . -name CMakeLists.txt); do
        sed -i \
        -e 's|DESTINATION include|DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}|g' \
        -e 's|$<INSTALL_INTERFACE:include>|$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>|g' \
        "$f"
    done

    # In the tests, remove all of the hardcoded OMP_NUM_THREADS
    sed -i '/OMP_NUM_THREADS/d' test/CMakeLists.txt

    # Set the maximum amount of MPI ranks according to what CMake finds
    sed -i 's|${MPIEXEC_NUMPROC_FLAG} [0-9]\+|${MPIEXEC_NUMPROC_FLAG} ${MPI_MAX_NUMPROCS}|g' test/CMakeLists.txt

    # For ButterFlyPack, we have one "super" library rather than individual targets
    patch -Np1 < ../"0001-link-butterflypack.patch"

    # RPath handling is currently broken, remove all of the custom options here
    patch -Np1 < ../"0002-fix-rpath.patch"
}

build() {
    local cmake_options=(
        -B build
        -S ${pkgname}
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        -D CMAKE_PREFIX_PATH=/usr
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_INSTALL_INCLUDEDIR="include/${pkgname}"
        -D CMAKE_SKIP_INSTALL_RPATH=ON
        -D CMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE
    )

    local strumpack_opts=(
        -D STRUMPACK_USE_MPI=ON
        -D STRUMPACK_USE_OPENMP=ON
        # Third party opts
        -D TPL_ENABLE_PARMETIS=ON
        -D TPL_ENABLE_SCOTCH=ON
        -D TPL_ENABLE_PTSCOTCH=ON
        -D TPL_ENABLE_BPACK=ON
        # GPU
        -D TPL_ENABLE_SLATE=OFF
        -D TPL_ENABLE_MAGMA=OFF
        # Vendor specific
        -D STRUMPACK_USE_CUDA=OFF
        -D STRUMPACK_USE_HIP=OFF
        -D STRUMPACK_USE_SYCL=OFF
    )

    local strumpack_deps=(
        # Use Lapack/BLAS/Scalapack from OpenBlas by default
        -D TPL_LAPACK_LIBRARIES=/usr/lib/liblapack.so
        -D TPL_BLAS_LIBRARIES=/usr/lib/libblas.so
        -D TPL_SCALAPACK_LIBRARIES=/usr/lib/libscalapack.so
    )
    cmake \
        "${cmake_options[@]}" \
        "${strumpack_opts[@]}" \
        "${strumpack_deps[@]}"
    cmake --build build
    
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir build
#     # show the stdout and stderr when the test fails
#     --output-on-failure
#     # exclude problematic tests
#     --exclude-regex "$excluded_tests"
#   )
#   ctest "${ctest_flags[@]}"
# }

package() {
    DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
