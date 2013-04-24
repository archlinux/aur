# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt4')
pkgver=4.2.7
pkgrel=8
groups=('fcitx-im')
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPL')
makedepends=('cmake' 'doxygen' 'gtk2' 'gtk3' 'qt4' 'icu' 'mesa' \
             'iso-codes' 'gobject-introspection' 'libxkbfile' 'git')
source=(http://fcitx.googlecode.com/files/${pkgbase}-${pkgver}_dict.tar.xz
	https://github.com/fcitx/fcitx/commit/9937b68bad3a7e9465e17b711ce9c0a072d3071f.patch
	https://github.com/fcitx/fcitx/commit/10ff96ca1215187444951cdbebe9e0beacacdf5e.patch
	https://github.com/fcitx/fcitx/commit/dc36c1a88f863971f81a76b8d9ec0db23b0d9387.patch
	https://github.com/fcitx/fcitx/commit/a9e6570046f9c1477dd6ec6e30e91e020e62d698.patch
)

build() {
  #source /etc/profile.d/qt4.sh

  cd "$srcdir/$pkgbase-$pkgver"
  patch -Np1 -i "$srcdir/9937b68bad3a7e9465e17b711ce9c0a072d3071f.patch"
  patch -Np1 -i "$srcdir/10ff96ca1215187444951cdbebe9e0beacacdf5e.patch"
  git apply -v -p1 "$srcdir/dc36c1a88f863971f81a76b8d9ec0db23b0d9387.patch"
  patch -Np1 -i "$srcdir/a9e6570046f9c1477dd6ec6e30e91e020e62d698.patch"

  cd "$srcdir"
  mkdir -p build
  cd build

  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
  cd "${srcdir}/build"
  make test
}

package_fcitx() {
  pkgdesc="Flexible Context-aware Input Tool with eXtension"
  depends=('pango' 'libxinerama' 'gtk-update-icon-cache' 'shared-mime-info' \
           'hicolor-icon-theme' 'desktop-file-utils' 'libxkbfile' \
           'libxfixes' 'dbus-core' 'icu')
  optdepends=('enchant: for word predication support'
              'opencc: optional engine to do chinese convert'
  	      'fcitx-anthy: Hiragana text to Kana Kanji mixed text Japanese input method'
	      'fcitx-chewing: Intelligent Zhuyin input method library for traditional Chinese'
	      'fcitx-cloudpinyin: Standalone module for fcitx that uses pinyin API on the internet to provide additional input candidates'
	      'fcitx-configtool: GTK based config tool for Fcitx'
	      'fcitx-fbterm: Fbterm support for Fcitx'
	      'fcitx-googlepinyin: A fork from google pinyin on android for Fcitx'
	      'fcitx-gtk2: GTK2 IM Module for fcitx'
	      'fcitx-gtk3: GTK3 IM Module for fcitx'
	      'fcitx-hangul: Hangul (Korean) support for fcitx'
	      'fcitx-libpinyin: Fcitx Wrapper for libpinyin, Library to deal with pinyin'
	      'fcitx-m17n: Multilingual text processing library'
	      'fcitx-mozc: Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)'
	      'fcitx-qt4: QT4 IM Module for fcitx'
	      'fcitx-rime: Rime input method engine (Traditional Chinese)'
  	      'fcitx-sunpinyin: Statistical Language Model based pinyin IME by Sun'
	      'fcitx-table-extra: Extra tables for Fcitx, including Boshiamy, Zhengma, Cangjie3, Cangjie5'
	      'fcitx-table-other: Provides some other tables for Fcitx, fork from ibus-table-others, scim-tables'
	      'fcitx-ui-light: Light weight xlib and xft based ui for fcitx'
	      'fcitx-unikey: Fcitx Wrapper for unikey'
	      'kcm-fcitx: KDE Config Module for Fcitx'
	      'gettext: for fcitx-po-parser')
  install=fcitx.install

  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}/usr/lib/"{gtk-2.0,gtk-3.0,qt4}
  rm -r "${pkgdir}/usr/lib/fcitx/qt"
  rm -r "${pkgdir}/usr/include/fcitx-qt"
  rm "${pkgdir}/usr/bin/fcitx-qt-gui-wrapper"
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
  pkgdesc='QT4 IM Module for fcitx'
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

md5sums=('6e291717c24615b9dc9bfaa2949af3a7'
         '246e36c2232f107ed1692a52ebc43c39'
         '6f420547bc8af9627db2e5290f758433'
         '51e53377e1b83661f2896e25d1a46242'
         '5e9f90817722a138b459b2bf6a926f96')
