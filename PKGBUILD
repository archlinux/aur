# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=hawaii-qt5-wayland-git
pkgver=20150516.1d0475d
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=('i686' 'x86_64' 'armv6h')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('qt5-base' 'qt5-declarative' 'libxcomposite' 'libxrender' 'mtdev' 'wayland')
provides=('qt5-wayland')
conflicts=('qt5-wayland')
replaces=('qt5-wayland')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
_ver=5.4.2

_gitroot="git://github.com/maui-packages/qtwayland"
_gitbranch=output54
_gitname=hawaii-qtwayland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd ${_gitname}
  qmake CONFIG+=wayland-compositor
  make
}

package() {
  cd ${_gitname}
  make INSTALL_ROOT="${pkgdir}" install

  # Workaround to install generated private headers
  cp ./include/QtCompositor/${_ver}/QtCompositor/private/{qwayland-server-*,*protocol*}.h \
      ${pkgdir}/usr/include/qt/QtCompositor/${_ver}/QtCompositor/private/
}
