# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsd
pkgver=1.7.8
pkgrel=1
pkgdesc="3rd party drivers for INDI: GPSD"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL2)
arch=(i686 x86_64)
depends=(libindi gpsd)
makedepends=(cmake)
source=("https://github.com/indilib/indi/archive/v${pkgver}.tar.gz")
sha256sums=('55959bfa271048840782ee61a7c33d769790b7b3e333143de9c8bd60e6e8c5e2')

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
    -DWITH_GPSD=On \
    ../indi-${pkgver}/3rdparty
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
