# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=palace
pkgname=${_pkgname}-git
pkgver=0.16.1.r183.g3670079
pkgrel=1
pkgdesc="3D finite element solver for computational electromagnetics"
arch=('x86_64')
url="https://github.com/awslabs/palace"
license=('Apache-2.0')
depends=(
    "bash"
    "openmpi"
    "blas"
    "libstdc++"
    "libgcc"
    "libgomp"
    "glibc"
    "arpack"
    "scnlib"
    "mfem-palace"
    "libceed"
    "fmt"
    "json-schema-validator"
    "nlohmann-json"
)
makedepends=(
    "gcc"
    "gcc-fortran"
    "cmake"
    "python"
    "pkg-config"
    "libunwind"
    "zlib"
    "git"
)
checkdepends=()
optdepends=(
    "julia: to use 'palace-validate-config'"
)
options=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}::git+${url}"
    "0001-fix-cmake-namespace.patch"
    "0002-arpack-pkgconfig.patch"
    "0003-fix-superlu-target.patch"
)
b2sums=('SKIP'
        '10bce669747dc84a0f395f070d14fa755ed0f56c89c726221c6569c88aeb6c5f4ff0fd455dffdef75380e119782460e705669461c58abfc937be499cf949399c'
        'a6f1c4abb27b192b31fc59a94c5b0f6c4728f7d8871a7d8d1d6bbc8daae5769d39f2965f7b77678a2d130a551ccb11f8acf55153b18c35d11f6d53a3cac27351'
        '0905f09e9f3079e2cf93779979211e7889b30a3a2c6c359c77e33814e646590b7469e664be51eb419d0c9b0a179a4550d39762652689761c989a57ca6c4aaaad')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # Fixup STRUMPACK and Butterflypack namespace
  patch -Np1 < ../"0001-fix-cmake-namespace.patch"

  # We need to find arpack via pkg-config
  patch -Np1 < ../"0002-arpack-pkgconfig.patch"

  # We need to find the superlu target manually
  patch -Np1 < ../"0003-fix-superlu-target.patch"

  # We are manually moving the schema files ourselves, update the script accordingly
  # Also rename the help message
  sed -i \
    -e 's|SCRIPT_DIR=.*|SCRIPT_DIR=/usr/share/palace|' \
    -e 's|validate-config|palace-validate-config|' scripts/validate-config

  # We are also moving the binary, so the launcher script needs to be updated
  sed -i 's|PALACE_DIR=.*|PALACE_DIR=/usr/lib/palace|' scripts/palace
}

build() {
    cmake_flags=(
        -D CMAKE_INSTALL_PREFIX=/usr
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        # -D CMAKE_INSTALL_RPATH=/usr/lib
        # -D CMAKE_INSTALL_RPATH_USE_LINK_PATH=ON
        -D BLA_VENDOR=OpenBLAS
        # For Mumps
        # -D CMAKE_EXE_LINKER_FLAGS="-lscotch -lscotcherr -lesmumps"
    )

    palace_flags=(
        -D PALACE_WITH_OPENMP=ON            # Default: OFF
        -D PALACE_WITH_CUDA=OFF             # Default: OFF
        -D PALACE_WITH_HIP=OFF              # Default: OFF

        -D PALACE_WITH_SUPERLU=ON           # Default: ON
        -D PALACE_WITH_STRUMPACK=ON         # Default: OFF
        -D PALACE_WITH_MUMPS=OFF            # Default: OFF
        -D PALACE_WITH_SLEPC=OFF            # Default: ON
        -D PALACE_WITH_ARPACK=ON            # Default: ON
        -D PALACE_WITH_SUNDIALS=ON          # Default: ON
        -D PALACE_WITH_GSLIB=ON             # Default: ON
    )

    external_deps=(
        -D SUPERLU_DIST_INCLUDE_DIR="/usr/include/superlu_dist/"
        -D ARPACK_DIR="/usr/include/arpack/"
    )

    cmake \
        "${palace_flags[@]}" \
        "${external_deps[@]}" \
        "${cmake_flags[@]}" \
        -B build \
        -S ${_pkgname}/palace

    cmake --build build
}

# check() {
#   local excluded_tests=""
#   local ctest_flags=(
#     --test-dir build
#     # show the stdout and stderr when the test fails
#     --output-on-failure
#     # execute tests in parallel
#     --parallel $(nproc)
#     # exclude problematic tests
#     --exclude-regex "$excluded_tests"
#   )
#   ctest "${ctest_flags[@]}"
# }

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 ${_pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Rename generic binary 'validate-config' to 'palace-validate-config'
    mv "${pkgdir}/usr/bin/validate-config" "${pkgdir}/usr/bin/palace-validate-config"

    # Move schema directory from bin to /usr/share
    install -d "${pkgdir}/usr/share/${_pkgname}"
    mv "${pkgdir}/usr/bin/schema" "${pkgdir}/usr/share/${_pkgname}/"

    # Move the binary to /usr/lib/
    install -d "${pkgdir}/usr/lib/${_pkgname}"
    # TODO: Probably a more agnostic way of finding this binary?
    mv "${pkgdir}/usr/bin/palace-x86_64.bin" "${pkgdir}/usr/lib/${_pkgname}"
}

# vim: set ts=4 sw=4 et:
