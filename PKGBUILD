# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=dbcsr
pkgver=2.7.0
pkgrel=1
pkgdesc="Distributed Block Compressed Sparse Row matrix library"
arch=(x86_64)
url="https://github.com/cp2k/dbcsr"
license=(GPL-2.0-only)
depends=(libxsmm blas lapack openmpi)
makedepends=(cmake ninja gcc-fortran python)
source=($pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/archive/refs/tags/v$pkgver.tar.gz
        cmake.patch)
sha256sums=('25c367b49fb108c5230bcfb127f05fc16deff2bb467f437023dfa6045aff66f6'
            'af12e55b6cbdd504379349a88c499e4ceac53bd8eb907133aaa95b8a97da85be')

prepare() {
  # Patching CMakeLists.txt
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < "$srcdir/cmake.patch"
}

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
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
