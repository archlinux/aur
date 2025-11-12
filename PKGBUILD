pkgname=sundials-seq
_pkgname=sundials
pkgver=7.5.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers (sequential version)'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD)
depends=(suitesparse)
makedepends=(cmake gcc-fortran python)
source=(https://github.com/LLNL/sundials/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('8b5fe715009cd0f1a0ff244729c2570e3e631d3bf357495e7813b5063d4d0cf3')
provides=(sundials)
conflicts=(sundials)

build() {
  cd $_pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_MPI=OFF \
    -DENABLE_PTHREAD=ON	\
    -DENABLE_OPENMP=ON \
    -DENABLE_KLU=ON \
    -DKLU_LIBRARY_DIR=/usr/lib \
    -DKLU_INCLUDE_DIR=/usr/include/suitesparse \
    -DEXAMPLES_ENABLE_C=OFF \
    -DEXAMPLES_INSTALL_PATH=/usr/share/sundials/examples \
    -B build .
  cmake --build build
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
