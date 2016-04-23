# Maintainer: trickart <trickart412@gmail.com>
# Contributor: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.17.2315.102
_dicver=20160418
_revision=1

_fcitxver=2.17.2313.102.1

_pkgbase=mozc
pkgname=('mozc-neologd-ut' 'fcitx-mozc-neologd-ut')
true && pkgname=('mozc-neologd-ut' 'fcitx-mozc-neologd-ut')
pkgver=${_mozcver}.${_dicver}.${_revision}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc_01.html"
license=('custom')
makedepends=('clang' 'ninja' 'pkg-config' 'python2' 'curl' 'gtk2' 'qt4' 'subversion' 'zinnia' 'fcitx')
source=(mozc-neologd-ut-${pkgver}.tar.xz::https://sourceforge.net/projects/trickart-aur/files/mozc-neologd-ut/mozc-neologd-ut-${pkgver}.tar.xz
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitxver}.patch
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz)

sha1sums=('57b5d6b6d02ea01142ab2f09116fd5d861fa0f18'
          '31de8917e9369bfd638e5725d57469bfde6aeb84'
          '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d')

prepare() {
  cd mozc-neologd-ut-${pkgver}

  # Adjust to use python2
  find . -name  \*.py        -type f -exec sed -i -e "1s|python.*$|python2|"  {} +
  find . -regex '.*\.gypi?$' -type f -exec sed -i -e "s|'python'|'python2'|g" {} +

  # Apply fcitx patch
  patch -Np2 -i "${srcdir}/fcitx-mozc-${_fcitxver}.patch"

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

build() {
  cd mozc-neologd-ut-${pkgver}

  # Use Qt4
  _rcc_loc=`pkg-config QtCore --variable=rcc_location`
  _qt4dir=${_rcc_loc%%/bin/rcc}
  _qt4i=`pkg-config --cflags-only-I QtGui`
  CFLAGS+=" $_qt4i"
  CXXFLAGS+=" $_qt4i"

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n renderer/renderer.gyp:mozc_renderer"

  QTDIR=$_qt4dir GYP_DEFINES="document_dir=/usr/share/licenses/${pkgbase}" python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype $_targets
}

package_mozc-neologd-ut() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt4' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut' 'mozc-ut')
  cd mozc-neologd-ut-${pkgver}
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-neologd-ut() {
  pkgdesc="Fcitx engine module for Mozc"
  arch=('i686' 'x86_64')
  depends=("mozc-neologd-ut=${pkgver}" 'fcitx')
  replaces=('fcitx-mozc', 'fcitx-mozc-ut')

  cd mozc-neologd-ut-${pkgver}
  for mofile in out_linux/${_bldtype}/gen/unix/fcitx/po/*.mo
  do
    filename=`basename $mofile`
    lang=${filename/.mo/}
    install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx-mozc.mo"
  done

  install -D -m 755 out_linux/${_bldtype}/fcitx-mozc.so "${pkgdir}/usr/lib/fcitx/fcitx-mozc.so"
  install -D -m 644 unix/fcitx/fcitx-mozc.conf "${pkgdir}/usr/share/fcitx/addon/fcitx-mozc.conf"
  install -D -m 644 unix/fcitx/mozc.conf "${pkgdir}/usr/share/fcitx/inputmethod/mozc.conf"

  install -d "${pkgdir}/usr/share/fcitx/mozc/icon"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-alpha_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_full.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-alpha_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_half.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-direct.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-direct.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-hiragana.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-hiragana.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-katakana_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_full.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-katakana_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_half.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-dictionary.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-dictionary.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-properties.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-properties.png"
  install -m 644 "${srcdir}/fcitx-mozc-icons/mozc-tool.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-tool.png"
}
