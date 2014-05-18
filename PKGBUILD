# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt4')
pkgver=4.2.8.4
pkgrel=1
groups=('fcitx-im')
arch=('i686' 'x86_64')
url="http://fcitx-im.org"
license=('GPL')
makedepends=('cmake' 'doxygen' 'gtk2' 'gtk3' 'qt4' 'icu' 'mesa' 'opencc' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'enchant')
source=(http://download.fcitx-im.org/$pkgbase/$pkgbase-${pkgver}_dict.tar.xz)

prepare() {
  cd ${pkgbase}-${pkgver}
}

build() {
  mkdir -p build
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
           'libxfixes' 'dbus-core' 'icu')
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

sha512sums=('39bffcd003aebb4e0714d245c32e839833b8507eaf819d5f6ec100ba2ed35b321f38e9a6052371abf0f5b73bb2828f10ae1bd555a41c30353beaf81bd121d03b')
