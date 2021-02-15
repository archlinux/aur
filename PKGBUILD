# Maintainer: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libindi-gpsd
pkgver=1.8.8
pkgrel=2
pkgdesc="3rd party drivers for INDI: GPSD"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(GPL2)
arch=(i686 x86_64)
depends=(libindi=${pkgver} gpsd)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" "upstream-pr-325.patch")
sha256sums=("0a50aff683e4e76d12b7558076734ace3c4340d93fcab2c25c8a7c0bc3d53816" "38a4f00ba07cefb42093df38075d76bbdf2b6139f0e5618bd786788b6eb21894")

prepare() {
  mkdir -p build
  cd  indi-3rdparty-${pkgver}
  patch -Np1 < ${srcdir}/upstream-pr-325.patch

  #set all to off by default
  sed -i -e '/option(WITH_.*On/s/ On/ Off/' CMakeLists.txt
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_GPSD=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
