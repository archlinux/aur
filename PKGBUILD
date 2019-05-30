# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3')
pkgver=4.2.9.6
pkgrel=2
groups=('fcitx-im')
arch=('x86_64')
url="https://fcitx-im.org"
license=('GPL' 'LGPL')
makedepends=('extra-cmake-modules' 'doxygen' 'gtk2' 'gtk3' 'icu' 'mesa' 'opencc' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'enchant' 'python2')
source=("https://download.fcitx-im.org/$pkgbase/$pkgbase-${pkgver}_dict.tar.xz"{,.sig})
sha512sums=('dc8308d1a4e9b7595da285ca6521f33027f5b8e6968bc28f751bd4f40116166cabbe1c05e29072afbe88473d2a9d6999124476260785e07f62a243df6e896bb0'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

prepare() {
  mkdir build

  sed -e 's|enchant/enchant.h|enchant-2/enchant.h|' -i $pkgbase-$pkgver/cmake/FindEnchant.cmake
}

build() {
  cd build

  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DFORCE_OPENCC=ON \
    -DFORCE_PRESAGE=ON \
    -DFORCE_ENCHANT=ON \
    -DENABLE_TEST=ON \
    -DENABLE_QT=OFF \
    -DENABLE_GTK2_IM_MODULE=ON \
    -DENABLE_GTK3_IM_MODULE=ON \
    -DENCHANT_INCLUDE_DIR=/usr/include/enchant-2/ \
    -DENCHANT_LIBRARIES=/usr/lib/libenchant-2.so
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
  make DESTDIR="$pkgdir" install

  rm -r "$pkgdir"/usr/lib/{gtk-2.0,gtk-3.0}
}

package_fcitx-gtk2() {
  pkgdesc='GTK2 IM Module for fcitx'
  depends=('gtk2' "fcitx>=$pkgver")
  install=fcitx-gtk2.install

  cd build/src/frontend/gtk2
  make DESTDIR="$pkgdir" install
}

package_fcitx-gtk3() {
  pkgdesc='GTK3 IM Module for fcitx'
  depends=('gtk3' "fcitx>=$pkgver")
  install=fcitx-gtk3.install

  cd build/src/frontend/gtk3
  make DESTDIR="$pkgdir" install
}
