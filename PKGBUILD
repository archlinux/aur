# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

buildarch=20

pkgname=hawaii-qt5-wayland-rpi-git
pkgver=20150405.7a3f6dc
pkgrel=1
pkgdesc="A cross-platform application and UI framework (QtWayland)"
arch=('armv6h' 'armv7h')
url="http://www.qt.io/"
license=('GPL3' 'LGPL')
depends=('qt5-base' 'qt5-declarative' 'libxcomposite' 'libxrender' 'mtdev' 'wayland' 'raspberrypi-firmware-tools')
provides=('qt5-wayland' 'hawaii-qt5-wayland-git')
conflicts=('qt5-wayland' 'hawaii-qt5-wayland-git')
replaces=('qt5-wayland' 'hawaii-qt5-wayland-git')
makedepends=('git' 'gdb')
options=('!libtool' 'debug')
_ver=5.6.0

_gitroot="git://github.com/maui-packages/qtwayland"
_gitbranch=output54
_gitname=hawaii-qtwayland
source=(${_gitname}::${_gitroot}#branch=${_gitbranch}
        '0001-Fix-build-on-general-purpose-distros.patch'
        '0001-brcm-egl-Avoid-conflicts-with-GLES3.patch')
md5sums=('SKIP'
         'ae08121dd500084d88be708f454729bd'
         '17bbee0eeab0096f725daa0b887650c4')

pkgver() {
  cd ${_gitname}
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd ${_gitname}
  patch -p1 < $srcdir/0001-Fix-build-on-general-purpose-distros.patch
  patch -p1 < $srcdir/0001-brcm-egl-Avoid-conflicts-with-GLES3.patch
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
