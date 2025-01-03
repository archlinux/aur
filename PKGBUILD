# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=dbcsr
pkgver=2.8.0
pkgrel=2
pkgdesc="Distributed Block Compressed Sparse Row matrix library"
arch=(x86_64)
url="https://github.com/cp2k/dbcsr"
license=(GPL-2.0-only)
depends=(libxsmm blas lapack openmpi)
makedepends=(cmake ninja gcc-fortran python fypp)
source=($pkgname-$pkgver.tar.gz::https://github.com/cp2k/$pkgname/archive/refs/tags/v$pkgver.tar.gz
        cmake.patch)
sha256sums=('470470338fb840776fbe6991e718699d879936d2f7a3f60af4df0aaaa99ca258'
            'af12e55b6cbdd504379349a88c499e4ceac53bd8eb907133aaa95b8a97da85be')
options=(!lto)

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
