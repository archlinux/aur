# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

pkgbase=fcitx
pkgname=('fcitx' 'fcitx-gtk2' 'fcitx-gtk3' 'fcitx-qt4')
pkgver=4.2.8
pkgrel=3
groups=('fcitx-im')
arch=('i686' 'x86_64')
url="http://fcitx-im.org"
license=('GPL')
makedepends=('cmake' 'doxygen' 'gtk2' 'gtk3' 'qt4' 'icu' 'mesa' \
             'iso-codes' 'gobject-introspection' 'libxkbfile')
source=(http://download.fcitx-im.org/$pkgbase/$pkgbase-${pkgver}_dict.tar.xz
        https://github.com/fcitx/fcitx/commit/b0a5439ac0188211c0955baf6811a0e3406ac812.patch
        https://github.com/fcitx/fcitx/commit/94635187b18badb1a2dff821de9a30a20d00feb1.patch
        https://github.com/fcitx/fcitx/commit/46d5a69d595ac825f47a3c22ddeb8ce71b04e887.patch)

build() {
  #source /etc/profile.d/qt4.sh

  cd "$srcdir/$pkgbase-$pkgver"

  # Fix ELF file patch
  patch -p1 -i ../b0a5439ac0188211c0955baf6811a0e3406ac812.patch

  # Fix switch key issue
  patch -p1 -i ../94635187b18badb1a2dff821de9a30a20d00feb1.patch
  patch -p1 -i ../46d5a69d595ac825f47a3c22ddeb8ce71b04e887.patch

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
	      'fcitx-kkc: libkkc (Japanese Kana Kanji input method) engine for fcitx'
	      'fcitx-libpinyin: Fcitx Wrapper for libpinyin, Library to deal with pinyin'
	      'fcitx-m17n: Multilingual text processing library'
	      'fcitx-mozc: Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)'
	      'fcitx-qt4: QT4 IM Module for fcitx'
	      'fcitx-qt5: QT5 IM Module for fcitx'
	      'fcitx-rime: Rime input method engine (Traditional Chinese)'
	      'fcitx-sayura: Sinhala Transe IME engine for fcitx'
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

md5sums=('79676d18536ebb9d0a0fa47e96416016'
         '0f3f85204ac1559bbf2cff304122234e'
         '417cd212d9fb7b9881232d57d023e49f'
         'd91ae8316154eccce3234c55e53a3c3b')
