# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=butterflypack
pkgname=${_pkgname}-git
pkgver=4.1.0.r32.ga6a83e9
pkgrel=2
pkgdesc="Large-Scale dense linear systems solver"
arch=('x86_64')
url="https://github.com/liuyangzhuan/ButterflyPACK"
license=('LicenseRef-Custom')
depends=(
  'glibc'
  'libgomp'
  'libgfortran'
  'libstdc++'
  'libgcc'
  'lapack'
  'scalapack'
  'blas'
  'openmpi'
  'zfp'
  'arpack'
)
makedepends=(
  'cmake'
  'git'
)
checkdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=()
source=("${_pkgname}::git+${url}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # Don't compile the examples
  sed -i '/add_subdirectory(EXAMPLE)/d' CMakeLists.txt

  # We want the installed headers to respect CMAKE_INSTALL_INCLUDEDIR
  sed -i 's/$<INSTALL_INTERFACE:include>/$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>/g' CMakeLists.txt
  sed -i 's/$<INSTALL_INTERFACE:include>/$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>/g' SRC/CMakeLists.txt

  # ZFP include is not needed (and incorrect), remove it
  sed -i 's/ -I${TPL_ZFP_INCLUDE}//g' CMakeLists.txt
}

build() {
  local cmake_options=(
    -B build
    -S ${_pkgname}
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D BUILD_SHARED_LIBS=ON
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_INCLUDEDIR=include/${_pkgname}/
    -D BLA_VENDOR="OpenBLAS"
    # -D CMAKE_Fortran_COMPILER=mpif90
    # -D CMAKE_CXX_COMPILER=mpicxx
    # -D CMAKE_C_COMPILER=mpicc
  )

  local butterfly_opts=(
    -D enable_openmp=ON
    -D enable_mpi=ON
    # TODO: enable_python doesn't work?
    # -D enable_python=ON
    -D enable_toplevel_openmp=ON
  )
  
  local butterfly_deps=(
    -D TPL_ARPACK_LIBRARIES="/usr/lib/libarpack.so;/usr/lib/libparpack.so"
    -D TPL_ZFP_LIBRARIES="/usr/lib/libzfp.so;/usr/lib/libcfp.so;/usr/lib/libzFORp.so"
  )
  cmake \
    "${cmake_options[@]}" \
    "${butterfly_opts[@]}" \
    "${butterfly_deps[@]}"
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
    DESTDIR="$pkgdir/" cmake --install build
    install -Dm644 "${_pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=4 sw=4 et:
