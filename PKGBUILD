# Maintainer: Ivan Semkin (ivan at semkin dot ru)
# Contributor: kikadf <kikadf.01@gmail.com>

pkgname=mir-git
_pkgname=mir
pkgver=1.5.0+120+g5fdc44755a
pkgrel=2
pkgdesc="Canonical's display server"
url='https://mir-server.io'
arch=(x86_64 i686 armv7h aarch64)
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
source=('git+https://github.com/MirServer/mir.git'
        'https://patch-diff.githubusercontent.com/raw/MirServer/mir/pull/1087.patch'
        'https://patch-diff.githubusercontent.com/raw/MirServer/mir/pull/1088.patch')
sha256sums=('SKIP'
            'b86c2359309b951fdb574de9381d2fc879709a4be81d22b9f6cb10198c26b3a4'
            '1e1a1b188db2fa540c200bf66e15473230f91cdadffa3040985ec4b7503ce2bd')

BUILD_DIR=build

prepare() {
  cd ${_pkgname}
  git submodule init
  git submodule update
  patch -Np1 -i "${srcdir}/1087.patch"
  patch -Np1 -i "${srcdir}/1088.patch"
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

