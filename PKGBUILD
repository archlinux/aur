# Maintainer: trickart <trickart412+aur at gmail dott com>
# Contributor: Masaki Haruka <yek@reasonset.net>
# Contributor: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.23.2815.102
_fcitxver=2.23.2815.102.1
_neologddate=20200521
_neologdrel=1
_ut2mozcver=2.20.2677.102
_ut2dicver=20171008
pkgver=${_mozcver}.${_neologddate}.${_ut2dicver}
pkgrel=2

pkgbase=fcitx-mozc-neologd-ut+ut2
pkgname=${pkgbase}
true && pkgname=('mozc-neologd-ut+ut2' 'fcitx-mozc-neologd-ut+ut2')
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
makedepends=('clang' 'gyp' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'zinnia' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=(
  http://ftp.jp.debian.org/debian/pool/main/m/mozc/mozc_${_mozcver}+dfsg.orig.tar.xz
  protobuf-3.5.2.tar.gz::https://github.com/protocolbuffers/protobuf/archive/v3.5.2.tar.gz
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/usage_dict.txt.patch
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/Fix-build-with-gcc8.patch
  https://salsa.debian.org/debian/mozc/-/raw/master/debian/patches/Change-from-python2-code-to-python3.patch
  https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitxver}.patch
  https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz
  https://osdn.net/users/trickart/pf/trickart_pkgbuild/dl/mozc-neologd-ut/mozcdic-neologd-ut-${_neologddate}.${_neologdrel}.tar.bz2
  "https://osdn.net/downloads/users/26/26381/mozc-ut2-2.20.2677.102.20171008.tar.xz"
  add_support_new_japanese_era_for_mozc.patch
  add_support_new_japanese_era_for_ut2.patch
)

sha1sums=(
  '7e0a39ffd5ea68ecadb792fc521c16b5be1f25cb'
  'd0c551031828ed9c07cc683762353a67b1a17627'
  'c6f5aac79c7e98fbda96de251d8f0d0787344ca9'
  '4fe935b5c2d316119cf8957b6518b3b5e7bf6ecf'
  'SKIP'
  '63a2b10e7d209c6216e2d912b2629efc44c637ea'
  '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d'
  'c09d1da0445868474ed0dae2b580d17dbc2f5364'
  '3ac129c9cd843c51a3e0a124a47cfb8eddab2c08'
  'ea8df0fc171c321457bd0692795f0c61c7ee04ce'
  'fa72a89ac18649816e9717d4468a6145db802625'
)

prepare() {
  # japanese era patch is based add-new-japanese-era.patch
  # https://salsa.debian.org/debian/mozc/raw/master/debian/patches/add_support_new_japanese_era.patch
  patch -Np0 -i ${srcdir}/add_support_new_japanese_era_for_mozc.patch
  patch -Np0 -i ${srcdir}/add_support_new_japanese_era_for_ut2.patch
  cp -f $srcdir/mozc-ut2-${_ut2mozcver}.${_ut2dicver}/src/data/dictionary_oss/dictionary*.txt $srcdir/mozc-${_mozcver}+dfsg/src/data/dictionary_oss/

  cd mozc-${_mozcver}+dfsg
  mkdir -p src/third_party
  mv ${srcdir}/protobuf-3.5.2 src/third_party/protobuf
  patch -Np1 -i ${srcdir}/usage_dict.txt.patch
  patch -Np1 -i ${srcdir}/Fix-build-with-gcc8.patch
  patch -Np1 -i ${srcdir}/Change-from-python2-code-to-python3.patch
  patch -Np1 -i ${srcdir}/fcitx-mozc-${_fcitxver}.patch

  # Avoid fcitx5 build errors
  rm -rf src/unix/fcitx5/

  # Add a neologd dictionary
  cat ${srcdir}/mozcdic-neologd-ut-${_neologddate}.${_neologdrel}/mozcdic-*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
  cd mozc-${_mozcver}+dfsg/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="use_libzinnia=1 document_dir=/usr/share/licenses/mozc" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_mozc-neologd-ut+ut2() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut' 'mozc-neologd-ut' 'fcitx-mozc-neologd-ut')
  cd mozc-${_mozcver}+dfsg/src
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ../LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"
}

package_fcitx-mozc-neologd-ut+ut2() {
  pkgdesc="Fcitx engine module for Mozc"
  arch=('i686' 'x86_64')
  depends=("mozc-neologd-ut+ut2=${pkgver}" 'fcitx')
  replaces=('fcitx-mozc' 'fcitx-mozc-ut2' 'fcitx-mozc-ut')

  cd mozc-${_mozcver}+dfsg/src
  for mofile in out_linux/${_bldtype}/gen/unix/fcitx/po/*.mo
  do
    filename=`basename $mofile`
    lang=${filename/.mo/}
    install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx-mozc.mo"
  done

  install -D -m 755 out_linux/${_bldtype}/fcitx-mozc.so "${pkgdir}/usr/lib/fcitx/fcitx-mozc.so"
  install -D -m 644 unix/fcitx/fcitx-mozc.conf "${pkgdir}/usr/share/fcitx/addon/fcitx-mozc.conf"
  install -D -m 644 unix/fcitx/mozc.conf "${pkgdir}/usr/share/fcitx/inputmethod/mozc.conf"

  install -d ${pkgdir}/usr/share/fcitx/mozc/icon
  install -m 644 ${srcdir}/fcitx-mozc-icons/*.png ${pkgdir}/usr/share/fcitx/mozc/icon/
}
