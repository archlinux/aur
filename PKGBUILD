# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=dbcsr
pkgver=2.10.0
pkgrel=1
pkgdesc="Distributed Block Compressed Sparse Row matrix library"
arch=(x86_64 aarch64)
url="https://github.com/cp2k/dbcsr"
license=(GPL-2.0-only)
depends=(libxs blas lapack openmpi)
makedepends=(cmake ninja gcc-fortran python fypp)
source=($pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('47bebf30dfda9c8af497182e1fe7bdfb01a73bdd741d1cfdf2f27c0108390a17')
options=(!lto)

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D USE_MPI=ON \
    -D USE_MPI_F08=ON \
    -D USE_LIBXS=ON \
    -D BUILD_TESTING=ON \
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
