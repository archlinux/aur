# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=qmlfmt-git
pkgver=0.1.0.r7.58bf170
pkgrel=1
pkgdesc="Command line application that formats QML files"
arch=('i686' 'x86_64')
url="https://github.com/jesperhh/qmlfmt"
license=('unknown')
depends=('qt5-base')
makedepends=('git' 'cmake>=3.0' 'qt5-script' 'qt5-declarative')
conflicts=('qmlfmt')
provides=('qmlfmt')
source=("git://github.com/jesperhh/qmlfmt.git")
sha512sums=('SKIP')

pkgver() {
  cd qmlfmt
  echo "0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  sed qmlfmt/QtCreator/QtCreator.cmake -i \
    -e 's/http/https/' \
    -e 's/3.3/4.0/' \
    -e 's/3.3.0/4.0.3/g' \
    -e 's/$<CONFIG>/RELEASE/g' \
    -e '8aPATCH_COMMAND sed -i -e "s# QTC_REL_TOOLS_PATH##" src/libs/utils/consoleprocess_unix.cpp'
  sed qmlfmt/QtCreator/CMakeLists.txt -i \
    -e '14afind_package(Qt5Qml REQUIRED)' \
    -e 's/:Concurrent/:Concurrent Qt5::Qml/'
  sed -i '11a#include <qmljs/parser/qmljsengine_p.h>' qmlfmt/qmlfmt.cpp
  cd build
  cmake ../qmlfmt \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp build/qmlfmt ${pkgdir}/usr/bin
}
