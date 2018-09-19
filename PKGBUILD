# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir-git
_pkgname=mir
pkgver=0.32.1+465+ga1dc983fd5
pkgrel=1
pkgdesc="Canonical's display server"
url='https://mir-server.io'
arch=(x86_64 i686 armv7h aarch64)
license=(GPL LGPL)
conflicts=(mir)
provides=(mir)
depends=(gtest boost-libs capnproto google-glog gflags libglvnd  liburcu lttng-ust libepoxy libxml++ nettle libinput libxkbcommon python-pillow freetype2 libevdev protobuf python-dbus python-gobject hicolor-icon-theme libxcursor yaml-cpp)
makedepends=(git glm doxygen cmake boost gcovr gmock lcov valgrind python-dbusmock umockdev)
optdepends=('qterminal: required for miral demos'
            'ttf-ubuntu-font-family: required for miral demos'
            'qt5-wayland: required for miral demos'
            'xcursor-dmz: opt requirement for miral demos'
            'qtubuntu: opt requirement for miral demos')
source=('git+https://github.com/MirServer/mir.git'
        'https://raw.githubusercontent.com/capnproto/capnproto/04fd66e2992a3ed38d686642a3c479a7f3e131c9/c%2B%2B/cmake/FindCapnProto.cmake'
        'protobufHeaders.patch')
sha256sums=('SKIP'
            '83153402ea0220a9ed3f9d2c2c157eb49fedf340f368cd8173f0966b3fbf2647'
            '88c025b35f4182fef7eed67db903e2580f69272cfaf38b7078fd571d8762a055')

BUILD_DIR=build

prepare() {
  cd ${_pkgname}
  git submodule init
  git submodule update
  cp ../FindCapnProto.cmake cmake/

  patch -Np1 -i "${srcdir}/protobufHeaders.patch"
}

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g' | cut -d "v" -f 2
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

