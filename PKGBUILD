# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=dsdcc
pkgver=1.8.3
pkgrel=1
pkgdesc="Digital Speech Decoder (DSD) rewritten as a C++ library"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/f4exb/dsdcc"
license=('GPL3')
depends=('mbelib' 'serialdv')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c865969948c5c9dd80900cb0656605d603a2ab688f98d6641bb3a6d97b592ed')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i 's|LIBSERIAL_NAMES|LIBSERIALDV_NAMES|g' cmake/Modules/FindSerialDV.cmake
}

build() {
  mkdir -p "$srcdir"/$pkgname-$pkgver/build
  cd "$srcdir"/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBSERIALDV_INCLUDE_DIR=/usr/include/serialdv \
    -DUSE_MBELIB=ON

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
