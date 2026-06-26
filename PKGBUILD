pkgname=sundials-seq
_pkgname=sundials
pkgver=7.8.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers (sequential version)'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD-3-Clause)
depends=(libgomp glibc suitesparse superlu_mt)
makedepends=(cmake gcc-fortran python)
source=(https://github.com/LLNL/sundials/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('c2ca15a16d7ae0d79cf1c2c288335f16b0f1c2c6d349db20aff2ce3fd1296d5a')
provides=(sundials)
conflicts=(sundials)

build() {
  cd $_pkgname-$pkgver
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF \
    -DSUNDIALS_ENABLE_MPI=OFF \
    -DSUNDIALS_ENABLE_PTHREAD=ON \
    -DSUNDIALS_ENABLE_OPENMP=ON \
    -DSUNDIALS_ENABLE_KLU=ON \
    -DSUNDIALS_ENABLE_C_EXAMPLES=OFF \
    -DSUNDIALS_ENABLE_SUPERLUMT=ON \
    -DSUPERLUMT_THREAD_TYPE=OPENMP \
    -DSUPERLUMT_INCLUDE_DIR=/usr/include/superlu_mt \
    -DSUNDIALS_ENABLE_SUPERLUMT_CHECKS=ON \
    -DSUNDIALS_INDEX_SIZE=32 \
    -B build .
  cmake --build build
}

package() {
  cd $_pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
