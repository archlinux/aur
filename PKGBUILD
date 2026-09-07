pkgname=sundials-seq
_pkgname=sundials
pkgver=7.9.0
pkgrel=1
pkgdesc='Suite of nonlinear differential/algebraic equation solvers (sequential version)'
arch=(x86_64)
url='https://computing.llnl.gov/projects/sundials'
license=(BSD-3-Clause)
depends=(libgomp glibc suitesparse superlu_mt)
makedepends=(cmake gcc-fortran python)
source=(https://github.com/LLNL/sundials/archive/v$pkgver/$_pkgname-$pkgver.tar.gz)
sha256sums=('01fe0742edac64f0d2976436be74ddd3ac6bcdde0e6638ba56b5942aefea42aa')
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
