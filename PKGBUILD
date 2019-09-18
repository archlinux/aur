# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-asi
pkgver=1.8.1
pkgrel=1
pkgdesc="3rd party drivers for INDI, support for ZWO devices: ASI cameras, EFW filter wheel, ASI ST4 port and ASI focuser"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL2.1)
arch=(i686 x86_64)
depends=(libindi)
makedepends=(cmake)
source=("https://github.com/indilib/indi/archive/v${pkgver}.tar.gz")
sha256sums=('d9250a60ce0f37c800982ef3f3c3a00a77f4eb9f500f1e96edbc1ea7c988d489')

prepare() {
  mkdir -p build
  cd indi-${pkgver}/3rdparty

  #set all to off by default
  sed -i -e '/option(WITH_.*On/s/ On/ Off/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DWITH_ASICAM=On \
    ../indi-${pkgver}/3rdparty
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
