# Maintainer: Lehel Gyuro <lehel@freemail.hu>
# Contributor: Marc-Olivier Barre <mobarre-archlinux@snarchi.io>
# Contributor: Sebastian Baberowski <sebastian@baberowski.com>

pkgname=libqhy
pkgver=2.2.4
pkgrel=1
pkgdesc="libqhy used by INDI QHY drivers. Please note that for sake of simplicity package version follows libindi versionning."
url="http://www.indilib.org/index.php?title=Main_Page"
license=(MIT)
arch=(i686 x86_64 aarch64)
depends=(libusb gcc-libs glibc )
conflicts=(libqhy-git)
makedepends=(cmake)
source=("https://github.com/indilib/indi-3rdparty/archive/v${pkgver}.tar.gz")
sha256sums=("bb1efc5a6a7a00ce34dd5f3817c877d5537050550be8f8654aaa3d3ec08cc5ef")

prepare() {
  mkdir -p build
  cd indi-3rdparty-${pkgver}
  find ./ -name CMakeLists.txt -exec sed -i -e 's|"\/lib|"${CMAKE_INSTALL_PREFIX}/lib|g' {} \;        # Allow installing outside of /lib
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUDEVRULES_INSTALL_DIR=/usr/lib/udev/rules.d \
    ../indi-3rdparty-${pkgver}/libqhy
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
