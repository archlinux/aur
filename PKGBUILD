# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=Trilinos
pkgname=pamgen
pkgver=17.3.0
pkgrel=1
pkgdesc="Parallel inline mesh generator for hexahedral and quadrilateral meshes (from Trilinos)"
arch=('x86_64')
url="https://github.com/trilinos/$_name"
license=('LGPL-2.1-or-later')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'openmpi')
makedepends=('cmake'
             'python')
conflicts=('trilinos')
_tag=trilinos-release-${pkgver//./-}
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('8094740da60bf75b675ad556ed00e337c8547be0dc9603893c4894f4abf0396b')

build() {
  cd "$_name-$_tag"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DBUILD_SHARED_LIBS=ON -DTPL_ENABLE_MPI=ON -DTrilinos_ENABLE_Fortran=OFF -DTrilinos_ENABLE_ALL_PACKAGES=OFF -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF -DTrilinos_ENABLE_Pamgen=ON -DPamgen_ENABLE_TESTS=ON -DPamgen_ENABLE_EXAMPLES=ON -DMPI_EXEC_PRE_NUMPROCS_FLAGS=--oversubscribe -Wno-dev
  cmake --build build
}

check() {
  cd "$_name-$_tag"
  ctest --test-dir build --output-on-failure
}

package() {
  cd "$_name-$_tag"
  DESTDIR="$pkgdir" cmake --install build
}
