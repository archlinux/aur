# Maintainer: Anton Kudelin <kudelin at proton dot me>

pkgname=libxs
pkgver=1.0.0
pkgrel=1
pkgdesc="Library of specialized algebra and performance primitives"
arch=(x86_64 aarch64)
url="https://github.com/hfp/libxs"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(cmake ninja gcc-fortran)
checkdepends=(blas)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('de26f50cb986a2f0e4f92c0eb489d40a44f7e4c5acd22751a6cfa2829dabd04d')

build() {
  cd "$srcdir"
  cmake \
    -B build \
    -S $pkgname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    -D LIBXS_FORTRAN=ON \
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
  install -Dm644 $pkgname-$pkgver/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
