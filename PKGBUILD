# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=dbcsr
pkgver=2.9.1
pkgrel=1
pkgdesc="Distributed Block Compressed Sparse Row matrix library"
arch=(x86_64)
url="https://github.com/cp2k/dbcsr"
license=(GPL-2.0-only)
depends=(libxsmm blas lapack openmpi)
makedepends=(cmake ninja gcc-fortran python fypp)
source=($pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('5cc9e9f41cf58697374baf7a45326e26860a755aecf22a7c9333152ec09fe7bd')
options=(!lto)

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D USE_MPI_F08=ON \
    -D USE_SMM=libxsmm \
    -G Ninja \
    -W no-dev
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ctest
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" cmake --install build
}
