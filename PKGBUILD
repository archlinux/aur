pkgname=sundials-seq
_pkgname=sundials
pkgver=7.6.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers (sequential version)'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD-3-Clause)
depends=(libgomp glibc suitesparse superlu_mt)
makedepends=(cmake gcc-fortran python)
source=(https://github.com/LLNL/sundials/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('3e84f9e162d994d034b214279c1e5df2e2758e97051a466a5788ff9f3ff0b7be')
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
    -DENABLE_SUPERLUMT=ON \
    -DSUPERLUMT_THREAD_TYPE=OPENMP \
    -DSUPERLUMT_INCLUDE_DIR=/usr/include/superlu_mt \
    -DSUPERLUMT_WORKS=ON \
    -DSUNDIALS_INDEX_SIZE=32 \
    -B build .
  cmake --build build
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
