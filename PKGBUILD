# Maintainer: MASAKI Haruka <yek@reasonset.net>
# Contributor: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.20.2677.102
_dicver=20171002
_revision=2
_fcitxver=2.18.2612.102.1

_pkgbase=mozc
pkgname=mozc-neologd-ut
true && pkgname=('fcitx-mozc-neologd-ut' 'mozc-neologd-ut')
pkgver=${_mozcver}.${_dicver}.${_revision}
pkgrel=1
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'ninja' 'pkg-config' 'python2' 'curl' 'gtk2' 'qt4' 'zinnia' 'fcitx' 'qt5-base')
source=('mozc-neologd-ut-2.20.2677.102.20171002.2.tar.xz::https://osdn.net/frs/chamber_redir.php?m=jaist&f=%2Fusers%2F16%2F16042%2Fmozc-neologd-ut-2.20.2677.102.20171002.2.tar.xz'
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitxver}.patch
        http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz)

sha1sums=('1f713933d3a15c15767b83635e63e0af5e98e533'
          'afeef31bf3d640f9cc630c2187dbfd4507367d78'
          '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d')

prepare() {
  cd mozc-neologd-ut-${pkgver}/src

  # Adjust to use python2
  find . -name  \*.py        -type f -exec sed -i -e "1s|python.*$|python2|"  {} +
  find . -regex '.*\.gypi?$' -type f -exec sed -i -e "s|'python'|'python2'|g" {} +

  # Apply fcitx patch
  patch -Np2 -i "${srcdir}/fcitx-mozc-${_fcitxver}.patch"
}

build() {
  cd mozc-neologd-ut-${pkgver}/src

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
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut')
  cd mozc-neologd-ut-${pkgver}/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-neologd-ut() {
  pkgdesc="Fcitx engine module for Mozc"
  arch=('i686' 'x86_64')
  depends=("mozc-neologd-ut=${pkgver}" 'fcitx')
  replaces=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-ut')

  cd mozc-neologd-ut-${pkgver}/src
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
