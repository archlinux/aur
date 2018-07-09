# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=0.32.0
pkgrel=3
pkgdesc="Canonical's display server"
url='https://mir-server.io'
arch=(x86_64 i686)
license=(GPL LGPL)
conflicts=(mir)
provides=(mir)
depends=(boost gcovr lcov capnproto google-glog gflags libglvnd valgrind liburcu lttng-ust libepoxy nettle libinput libxml++2.6 libxkbcommon python-pillow freetype2 gmock libevdev umockdev python-dbusmock protobuf python-dbus python-gobject hicolor-icon-theme lib32-glibc)
makedepends=(glm doxygen cmake)
optdepends=('qterminal: required for miral demos'
            'xcursor-dmz: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos')
source=("https://github.com/MirServer/mir/releases/download/v${pkgver}/mir-${pkgver}.tar.xz"
        'https://raw.githubusercontent.com/capnproto/capnproto/04fd66e2992a3ed38d686642a3c479a7f3e131c9/c%2B%2B/cmake/FindCapnProto.cmake')
sha256sums=('7fc79361f00f11795ee6a8092af6008aa9b56f3c7693343a4b6fe5c167e332a9'
            '83153402ea0220a9ed3f9d2c2c157eb49fedf340f368cd8173f0966b3fbf2647')

BUILD_DIR=build

prepare() {
  cd ${pkgname}-${pkgver}
  cp ../FindCapnProto.cmake cmake/
}

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p ${BUILD_DIR}
  cd ${BUILD_DIR}
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./
}

check() {
  cd ${pkgname}-${pkgver}/${BUILD_DIR}
  GTEST_OUTPUT=xml:./
  bin/mir_acceptance_tests
  bin/mir_integration_tests
  bin/mir_unit_tests
}

package() {
  cd ${pkgname}-${pkgver}/${BUILD_DIR}
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et:
