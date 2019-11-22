# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir
pkgver=1.5.0
pkgrel=2
pkgdesc="Canonical's display server"
url='https://mir-server.io'
arch=(x86_64 i686)
license=(GPL LGPL)
conflicts=(mir)
provides=(mir)
depends=(gtest boost-libs capnproto google-glog gflags libglvnd  liburcu lttng-ust libepoxy libxml++2.6 nettle libinput libxkbcommon python-pillow freetype2 libevdev protobuf python-dbus python-gobject hicolor-icon-theme libxcursor yaml-cpp)
makedepends=(git glm doxygen cmake boost gcovr gmock lcov valgrind python-dbusmock umockdev wlcs)
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos'
            'qtubuntu: opt requirement for miral demos')
source=("https://github.com/MirServer/mir/archive/v${pkgver}.tar.gz"
        'https://patch-diff.githubusercontent.com/raw/MirServer/mir/pull/1087.patch'
        'https://patch-diff.githubusercontent.com/raw/MirServer/mir/pull/1088.patch')
sha256sums=('526f844a7ac8ca7ede2ec33f3e942e0c130a76b1cf453d05a4f3f36e31b1cda8'
            'SKIP'
            'SKIP')

BUILD_DIR=build

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i "${srcdir}/1087.patch"
  patch -Np1 -i "${srcdir}/1088.patch"
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
