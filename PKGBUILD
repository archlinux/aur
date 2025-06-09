# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-dsi
pkgver=2.1.4
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-dsi"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(glibc libindi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" "fix_cmake.patch")
sha256sums=("e9ab43d08d09555d2c9d3c658d1bcc3130c3465a3afe2300995fba0d6e737080" "306f36440f2aa12e203464cab50e3d86b67455453e1908fc676682a60a6d7fd4")

prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  sed -i -e '/option(WITH_.*On)$/s/ On)$/ Off)/' CMakeLists.txt
  patch -Np1 < ${srcdir}/fix_cmake.patch
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    -DFIRMWARE_INSTALL_DIR=/usr \
    -DWITH_DSI=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
