# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt')
pkgver=4.2.6.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL')
makedepends=('cmake' 'intltool' 'doxygen' 'gtk2' 'gtk3' 'qt' 'icu' 'wget' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'enchant')
source=(http://fcitx.googlecode.com/files/${pkgbase}-${pkgver}.tar.xz)
sha1sums=('dc4577bb6bd6de41317f978196f377fc801cc63a')

build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_OPENCC=OFF \
    -DFORCE_PRESAGE=ON \
    -DENABLE_TEST=ON \
    -DENABLE_GTK3_IM_MODULE=ON \
    -DENABLE_QT_IM_MODULE=ON
  make
}

check() {
  cd "${srcdir}"/build
  make test
}

package_fcitx() {
  pkgdesc="Free Chinese Input Toy of X - Input Method Server for X window system"
  depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info' \
           'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile' \
           'libxfixes' 'dbus-core' 'icu')
  optdepends=('enchant: for word predication support')
  install=fcitx.install

  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/usr/lib/{gtk-2.0,gtk-3.0,qt}
}

package_fcitx-gtk2() {
  pkgdesc='GTK2 IM Module for fcitx'
  depends=('gtk2' 'fcitx')
  install=fcitx-gtk2.install

  cd "${srcdir}"/build/src/frontend/gtk2
  make DESTDIR="${pkgdir}" install
}

package_fcitx-gtk3() {
  pkgdesc='GTK3 IM Module for fcitx'
  depends=('gtk3' 'fcitx')
  install=fcitx-gtk3.install

  cd "${srcdir}"/build/src/frontend/gtk3
  make DESTDIR="${pkgdir}" install
}

package_fcitx-qt() {
  pkgdesc='QT IM Module for fcitx'
  depends=('qt' 'fcitx')

  cd "${srcdir}"/build/src/frontend/qt
  make DESTDIR="${pkgdir}" install
}
