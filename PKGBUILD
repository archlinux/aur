# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=pololu-tic-software
pkgver=1.7.0.r4.g488f984
pkgrel=1
pkgdesc="Pololu Tic software and library"
url="https://www.pololu.com/category/212/tic-stepper-motor-controllers"
license=(custom)
arch=(i686 x86_64)
depends=(qt5-base libusbp-1)
makedepends=(cmake)
source=("git+https://github.com/pololu/pololu-tic-software.git")
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake 
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../$pkgname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$pkgname/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/lib/udev/rules.d/" ../$pkgname/udev-rules/99-pololu.rules
}
