# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx
pkgdesc="Flexible Context-aware Input Tool with eXtension"
pkgver=4.2.9.7
pkgrel=3
groups=('fcitx-im')
arch=('x86_64')
url="https://fcitx-im.org"
license=('GPL' 'LGPL')
provides=('fcitx-gtk2' 'fcitx-gtk3')
conflicts=('fcitx-gtk2' 'fcitx-gtk3')
replaces=('fcitx-gtk2' 'fcitx-gtk3')
depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info'
          'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile'
          'libxfixes' 'dbus' 'icu' 'libxkbcommon')
optdepends=('enchant: for word predication support'
            'opencc: optional engine to do chinese convert'
            'gettext: for fcitx-po-parser'
            'fcitx-configtool: for configuration (GTK based)'
            'kcm-fcitx: for configuration under KDE')
makedepends=('extra-cmake-modules' 'doxygen' 'gtk2' 'gtk3' 'mesa' 'opencc'
             'iso-codes' 'gobject-introspection' 'enchant' 'python')
source=("https://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}_dict.tar.xz"{,.sig})
sha512sums=('b940478c648e30b2ea55903465ed02c8a0c3ae3539e4bd5b77be46a9e4d0c13ceff074ddd7532f86893111eb96308e1740db621a83fb809e4fd02256d75ebe7b'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

prepare() {
  mkdir build

  sed -e 's|enchant/enchant.h|enchant-2/enchant.h|' -i $pkgname-$pkgver/cmake/FindEnchant.cmake
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
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

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
