# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=seacas
pkgname=exodusii
pkgver=2026.08.11
pkgrel=1
pkgdesc="Exodus II finite element mesh and results database library (from SEACAS)"
arch=('x86_64')
url="https://github.com/sandialabs/$_name"
license=('BSD-3-Clause')
depends=('glibc'
         'libgfortran'
         'openmpi'
         'netcdf-openmpi'
         'hdf5-openmpi'
         'pnetcdf-openmpi')
makedepends=('cmake'
             'gcc-fortran'
             'python')
_tag=v${pkgver//./-}
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('9010d5fe17e14f556ae2a065573ab297bd861738742ead92895025d27fec31bb')

prepare() {
  cd "$_name-${_tag#v}"
  # Run the installed Python tests from the test install in the build directory instead of /usr
  sed -i 's|${CMAKE_INSTALL_PREFIX}/lib/tests/|${CMAKE_BINARY_DIR}/test-install${CMAKE_INSTALL_PREFIX}/lib/tests/|' packages/seacas/scripts/CMakeLists.txt
}

build() {
  cd "$_name-${_tag#v}"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DCMAKE_Fortran_COMPILER=mpif90 -DBUILD_SHARED_LIBS=ON -DSEACASExodus_ENABLE_STATIC=OFF -DSeacas_ENABLE_SEACASExodus=ON -DSeacas_ENABLE_Fortran=ON -DSeacas_ENABLE_SEACASExodus_for=ON -DSeacas_ENABLE_SEACASExoIIv2for32=ON -DSeacas_SKIP_FORTRANCINTERFACE_VERIFY_TEST=ON -DTPL_ENABLE_MPI=ON -DTPL_ENABLE_Pthread=ON -DSEACASExodus_ENABLE_THREADSAFE=ON -DTPL_ENABLE_Netcdf=ON -DTPL_ENABLE_Pnetcdf=ON -DTPL_Netcdf_Enables_PNetcdf=ON -DTPL_ENABLE_Matio=OFF -DTPL_ENABLE_CGNS=OFF -DSeacas_ENABLE_TESTS=ON -DMPI_EXEC_PRE_NUMPROCS_FLAGS=--oversubscribe -Wno-dev
  cmake --build build
}

check() {
  cd "$_name-${_tag#v}"
  DESTDIR="$PWD"/build/test-install cmake --install build
  export ACCESS="$PWD"/build/test-install/usr
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_name-${_tag#v}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
