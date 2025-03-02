# Maintainer: Lehel Gyuro <lehel@freemail.hu>

pkgname=libindi-orion-ssg3
pkgver=2.1.2.1
pkgrel=1
pkgdesc="INDI driver for products manufactured by indi-orion-ssg3"
url="http://www.indilib.org/index.php?title=Main_Page"
license=(LGPL-2.1-or-later)
arch=(i686 x86_64 aarch64)
depends=(libindi=${pkgver} libqsi=${pkgver})
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz" "fix_cmake.patch")
sha256sums=("d29a667a5b9bf3b1d9be5f2ca81bfff5573e98a6941f764fd687d439e1b8abb6" "d933073ce88923fea8622fdb4c9ce7911505bb41b8c9d8e455c09d6648380874")

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
    -DWITH_QSI=On \
    ../indi-3rdparty-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
