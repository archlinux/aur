# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt4')
pkgver=4.2.9.2
pkgrel=1
groups=('fcitx-im')
arch=('i686' 'x86_64')
url="http://fcitx-im.org"
license=('GPL' 'LGPL')
makedepends=('extra-cmake-modules' 'doxygen' 'gtk2' 'gtk3' 'qt4' 'icu' 'mesa' 'opencc' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'enchant' 'python2')
source=("https://download.fcitx-im.org/$pkgbase/$pkgbase-${pkgver}_dict.tar.xz"{,.sig})
sha512sums=('9228fc4629479e2c518e0d0a7dbe604f6e56e864b41927d120e1f0b7a277ff53ff1b393870480bc1660662751a31885ddc1ddf43133a11edc2e96cbc7701daee'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DFORCE_OPENCC=ON \
    -DFORCE_PRESAGE=ON \
    -DFORCE_ENCHANT=ON \
    -DENABLE_TEST=ON \
    -DENABLE_GTK2_IM_MODULE=ON \
    -DENABLE_GTK3_IM_MODULE=ON \
    -DENABLE_QT_IM_MODULE=ON \
    -DQT_QMAKE_EXECUTABLE=qmake-qt4
  make
}

check() {
  cd build
  make test
}

package_fcitx() {
  pkgdesc="Flexible Context-aware Input Tool with eXtension"
  depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info' \
           'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile' \
           'libxfixes' 'dbus' 'icu' 'libxkbcommon')
  optdepends=('enchant: for word predication support'
              'opencc: optional engine to do chinese convert'
              'gettext: for fcitx-po-parser')
  install=fcitx.install

  cd build
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/lib/"{gtk-2.0,gtk-3.0,qt4}
  rm -r "${pkgdir}/usr/lib/fcitx/qt"
  rm -r "${pkgdir}/usr/include/fcitx-qt"
  rm "${pkgdir}/usr/lib/fcitx/libexec/fcitx-qt-gui-wrapper"
  rm "${pkgdir}/usr/lib/"libfcitx-qt.so*
  rm "${pkgdir}/usr/lib/pkgconfig/fcitx-qt.pc"
}

package_fcitx-gtk2() {
  pkgdesc='GTK2 IM Module for fcitx'
  depends=('gtk2' "fcitx>=$pkgver")
  install=fcitx-gtk2.install

  cd "${srcdir}/build/src/frontend/gtk2"
  make DESTDIR="${pkgdir}" install
}

package_fcitx-gtk3() {
  pkgdesc='GTK3 IM Module for fcitx'
  depends=('gtk3' "fcitx>=$pkgver")
  install=fcitx-gtk3.install

  cd "${srcdir}/build/src/frontend/gtk3"
  make DESTDIR="${pkgdir}" install
}

package_fcitx-qt4() {
  pkgdesc='Qt4 IM Module for fcitx'
  depends=('qt4' "fcitx>=$pkgver")
  replaces=('fcitx-qt')
  provides=('fcitx-qt')
  conflicts=('fcitx-qt')

  cd "${srcdir}/build/src/frontend/qt"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/build/tools/gui"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/build/src/lib/fcitx-qt"
  make DESTDIR="${pkgdir}" install
}

