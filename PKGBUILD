# $Id: PKGBUILD 226039 2017-04-27 13:52:30Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

_pkgname=fcitx5-qt
pkgbase=$_pkgname-git
pkgname=(fcitx5-qt5-git fcitx5-qt4-git fcitx5-qt6-git)
pkgver=5.1.5.r0.gcc77e32
pkgrel=2
pkgdesc="Fcitx Qt Library"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-qt"
license=('LGPL-2.1-or-later')
depends=('fcitx5-git')
makedepends=('extra-cmake-modules' 'git' 'qt4' 'qt5-base' 'qt6-base' 'qt6-wayland' 'ninja')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd $_pkgname

  cmake -GNinja . \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
      -DENABLE_QT4=On \
      -DENABLE_QT5=On \
      -DENABLE_QT6=On

  ninja

  # install into /tmp and split the package
  DESTDIR="/tmp/$_pkgname/" ninja install
}

_mv_pkg(){
  mkdir -p "$pkgdir/$(dirname $1)"
  mv "$@" "$pkgdir/$(dirname $1)"
}

package_fcitx5-qt6-git(){
  depends=('fcitx5-git' 'qt6-base' 'qt6-wayland' 'libxkbcommon' 'gcc-libs' 'wayland' 'glibc' 'libxcb')
  provides=('fcitx5-qt6' 'fcitx5-qt')
  conflicts=('fcitx5-qt6' 'fcitx5-qt')
  pkgdesc="Fcitx Qt Library, for Qt6"

  cd /tmp/$_pkgname
  _mv_pkg usr/bin/fcitx5-qt6-immodule-probing
  _mv_pkg usr/share/applications/org.fcitx.fcitx5-qt6-gui-wrapper.desktop
  _mv_pkg usr/share/locale
  _mv_pkg usr/lib/qt6
  _mv_pkg usr/lib/libFcitx5Qt6*
  _mv_pkg usr/lib/fcitx5-qt6*
  _mv_pkg usr/lib/fcitx5/qt6
  _mv_pkg usr/lib/cmake/Fcitx5Qt6*
  _mv_pkg usr/include/Fcitx5Qt6
}

package_fcitx5-qt5-git(){
  depends=('fcitx5-git' 'qt5-base' 'libxkbcommon' 'gcc-libs' 'libxcb' 'glibc')
  provides=('fcitx5-qt5')
  conflicts=('fcitx5-qt5')
  pkgdesc="Fcitx Qt Library, for Qt5"

  cd /tmp/$_pkgname
  _mv_pkg usr/bin/fcitx5-qt5-immodule-probing
  _mv_pkg usr/lib/qt
  _mv_pkg usr/lib/libFcitx5Qt5*
  _mv_pkg usr/lib/fcitx5-qt5*
  _mv_pkg usr/lib/fcitx5/qt5
  _mv_pkg usr/lib/cmake/Fcitx5Qt5*
  _mv_pkg usr/include/Fcitx5Qt5
}

package_fcitx5-qt4-git(){
  depends=('fcitx5-git' 'qt4' 'libxkbcommon' 'gcc-libs' 'libx11' 'glibc')
  provides=('fcitx5-qt4')
  conflicts=('fcitx5-qt4')
  pkgdesc="Fcitx Qt Library, for Qt4"

  cd /tmp/$_pkgname
  _mv_pkg usr/share/applications/org.fcitx.fcitx5-qt5-gui-wrapper.desktop
  _mv_pkg usr/lib/qt4
  _mv_pkg usr/lib/libFcitx5Qt4*
  _mv_pkg usr/lib/cmake/Fcitx5Qt4*
  _mv_pkg usr/include/Fcitx5Qt4
}


