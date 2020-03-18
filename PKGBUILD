# Maintainer: Masaki Haruka <yek@reasonset.net>
# Contributor: UTUMI Hirosi <utuhiro78 att yahoo dott co dott jp>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release

_mozcver=2.23.2815.102
_fcitxver=2.23.2815.102.1
_neologddate=20200315
pkgver=${_mozcver}.${_neologddate}
pkgrel=1

pkgname=mozc-neologd-ut
true && pkgname=('mozc-neologd-ut' 'fcitx-mozc-neologd-ut')
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('custom')
depends=('protobuf')
makedepends=('clang' 'gyp' 'protobuf' 'ninja' 'pkg-config' 'python' 'curl' 'gtk2' 'qt5-base' 'zinnia' 'fcitx' 'libxcb' 'glib2' 'bzip2' 'unzip')

source=(
  mozc-${_mozcver}+dfsg.tar.xz::http://ftp.jp.debian.org/debian/pool/main/m/mozc/mozc_${_mozcver}+dfsg.orig.tar.xz
  japanese_usage_dictionary::git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_rev}
  fix-build-with-gcc8.patch::https://salsa.debian.org/debian/mozc/raw/master/debian/patches/Fix-build-with-gcc8.patch
  mozc-2.23.2815.102-python-3.patch::https://github.com/google/mozc/files/4048079/mozc-2.23.2815.102-python-3.patch.txt
  add_support_new_japanese_era.patch::https://salsa.debian.org/debian/mozc/raw/master/debian/patches/add_support_new_japanese_era.patch
  https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitxver}.patch
  https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz
  "https://osdn.net/frs/chamber_redir.php?m=osdn&f=%2Fusers%2F25%2F25485%2Fmozcdic-neologd-ut-20200315.1.tar.bz2"
)

sha1sums=(
  '7e0a39ffd5ea68ecadb792fc521c16b5be1f25cb'
  'SKIP'
  '4fe935b5c2d316119cf8957b6518b3b5e7bf6ecf'
  '1b281471dac2eeab6d9ad7c47e3929e1ac402344'
  '13f8fbbc768d5042fb55d877acf2a73fc8b5e3f0'
  '63a2b10e7d209c6216e2d912b2629efc44c637ea'
  '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d'
  'SKIP'
)

prepare() {
  cd mozc-${_mozcver}+dfsg
  patch -Np1 -i ${srcdir}/fix-build-with-gcc8.patch
  patch -Np1 -i ${srcdir}/mozc-2.23.2815.102-python-3.patch
  patch -Np1 -i ${srcdir}/add_support_new_japanese_era.patch
  patch -Np1 -i ${srcdir}/fcitx-mozc-${_fcitxver}.patch
  mkdir -p src/third_party/
  cp -a ${srcdir}/japanese_usage_dictionary src/third_party/
  cat ${srcdir}/mozcdic-neologd-ut-${_neologddate}.${pkgrel}/mozcdic-*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}

build() {
  cd mozc-${_mozcver}+dfsg/src

  # Avoid fcitx5 build errors
  rm -rf unix/fcitx5/

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool renderer/renderer.gyp:mozc_renderer unix/fcitx/fcitx.gyp:fcitx-mozc unix/fcitx/fcitx.gyp:gen_fcitx_mozc_i18n"

  GYP_DEFINES="use_libprotobuf=1 use_libzinnia=1 document_dir=/usr/share/licenses/mozc" python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets
}

package_mozc-neologd-ut() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  conflicts=('fcitx-mozc' 'mozc' 'fcitx-mozc-ut2' 'mozc-ut2' 'fcitx-mozc-ut' 'mozc-ut' 'fcitx-mozc-neologd-ut+ut2')
  cd mozc-${_mozcver}+dfsg/src
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
