# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir-git
_pkgname=mir
pkgver=v0.31.2+380+g3013b91849
pkgrel=1
pkgdesc="Canonical's display server"
url='https://mir-server.io'
arch=(x86_64 i686)
license=(GPL LGPL)
conflicts=(mir)
provides=(mir)
depends=(boost gcovr lcov capnproto google-glog gflags libglvnd valgrind liburcu lttng-ust libepoxy nettle libinput libxml++2.6 libxkbcommon python-pillow freetype2 gmock libevdev umockdev python-dbusmock protobuf python-dbus python-gobject hicolor-icon-theme lib32-glibc)
makedepends=(git glm doxygen cmake)
optdepends=('qterminal: required for miral demos'
            'xcursor-dmz: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos')
source=('git+https://github.com/MirServer/mir.git'
        'https://raw.githubusercontent.com/capnproto/capnproto/04fd66e2992a3ed38d686642a3c479a7f3e131c9/c%2B%2B/cmake/FindCapnProto.cmake')
sha256sums=('SKIP'
            '83153402ea0220a9ed3f9d2c2c157eb49fedf340f368cd8173f0966b3fbf2647')

BUILD_DIR=build

prepare() {
  cd ${_pkgname}
  git submodule init
  git submodule update
  cp ../FindCapnProto.cmake cmake/
}

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${_pkgname}
  mkdir -p ${BUILD_DIR}
  cd ${BUILD_DIR}
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_LIBDIR="lib/" ..
  cmake --build ./
}

check() {
  cd ${_pkgname}/${BUILD_DIR}
  GTEST_OUTPUT=xml:./
  bin/mir_acceptance_tests
  bin/mir_integration_tests
  bin/mir_unit_tests
}

package() {
  cd ${_pkgname}/${BUILD_DIR}
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et:

