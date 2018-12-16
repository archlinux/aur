# Maintainer: trickart <trickart412+aur@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

##
## Build configuration
##

## ニコニコ大百科IME辞書 (NICONICOPEDIA IME dictionary, see below)
#_NICODIC="true"

#***********************************************************************
# License information:
#
# Mozc:     3-clause BSD
# uim-mozc: 3-clause BSD
#
# Mozc-UT2 dictionary
# altcanna, jinmei, skk: GPL
# hatena: unknown
# edict: Creative Commons Attribution-ShareAlike License (V3.0)
# ekimei: redistributable
# zip code: public domain
# niconico: unknown
# ruby/shell scripts: GPL
#
# ** CAUTION **
# CC-BY-SA (EDICT) is incompatible with GPL (some of the other dic data).
# You should not redistribute the binary of mozc-ut2 including edict
# (and niconico which unknown license) at least.
#
#***********************************************************************
# Upstreams:
#
# mozc
# https://github.com/google/mozc
#
# Japanese zip code data by Japan Post
# http://www.post.japanpost.jp/zipcode/download.html
#
# Modified zip code data by Ibs
# http://zipcloud.ibsnet.co.jp/
#
# Mozc UT2 dictionary
# http://www.geocities.jp/ep3797/mozc-ut2.html
#
#***********************************************************************
# Changes to original mozc:
#
# 1. Add Mozc UT Dictionary
# 2. Add uim-mozc (optional)
#
#***********************************************************************

## Mozc compile option
_bldtype=Release
#_bldtype=Debug

_mozcrev=afb03ddfe72dde4cf2409863a3bfea160f7a66d8
_utdicver=20171008
_zipcoderel=201811

_fcitxver=2.23.2815.102.1

_pkgbase=mozc-ut2
pkgname=fcitx-mozc-ut2
pkgdesc="Mozc the Japanese Input Method with Mozc UT2 Dictionary (additional dictionary) and uim-mozc (optional)"
pkgver=2.23.2815.102.20171008
pkgrel=2
arch=('i686' 'x86_64')
url="http://linuxplayers.g1.xrea.com/mozc-ut2.html"
license=('BSD' 'GPL' 'CC-BY-SA' 'custom')
depends=('qt5-base' 'fcitx' 'zinnia')
makedepends=('python2' 'ruby' 'git' 'ninja' 'clang')
replaces=('mozc-fcitx' 'fcitx-mozc' 'fcitx-mozc-ut')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'mozc-ut' 'fcitx-mozc' 'mozc-ut2')
optdepends=('tegaki-models-zinnia-japanese: hand-writing recognition support')
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/mozcdic-ut2-${_utdicver}.tar.bz2
  https://osdn.net/projects/ponsfoot-aur/storage/mozc/edict2-${_utdicver}.gz
  https://osdn.net/projects/ponsfoot-aur/storage/mozc/ken_all-${_zipcoderel}.zip
  https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcoderel}.zip
  EDICT_license.html
  mod-generate-dictionary.sh
  http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-${_fcitxver}.patch
  http://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz
  'fix_failing_build_with_gcc8.patch::https://fars.ee/2is4'
)
sha1sums=('SKIP'
          '9f88c5f12b3d9b1190c8ec046c6693483af3ba3f'
          'e085ab894d415ce318cf91de64f017d505f1d14e'
          '5bd6e07178cd42a35082c81e939a817b2180cff8'
          '6187d52063d5ddf8cb7ed060cfff03cf91ed45cf'
          'e0ba18e67c1be8e3cfb8ecb30760597b215da255'
          '6a6f5b0dce10fe6327d32256f53c28731cb83d2f'
          '63a2b10e7d209c6216e2d912b2629efc44c637ea'
          '883f4fc489a9ed1c07d2d2ec37ca72509f04ea5d'
          '2bad0705a0a09d8d5a79c874b59c485052da2b38')


mozcver() {
  . "${srcdir}/mozc/src/data/version/mozc_version_template.bzl"
  printf "%s.%s.%s.%s" $MAJOR $MINOR $BUILD $REVISION
}


pkgver() {
  printf "%s.%s" $_mozcver "${_utdicver}"
}


prepare() {
  cd "$srcdir"
  ln -sf `which python2` ./python
  PATH="${srcdir}:${PATH}"

  cd "${srcdir}/mozc/"

  git submodule update --init --recursive

  cd "${srcdir}/mozcdic-ut2-${_utdicver}"

  _mozcver=`mozcver`
  "${srcdir}/mod-generate-dictionary.sh"
  msg "Generating UT dictionary seed..."
  MOZCVER="$_mozcver" DICVER="$_utdicver" NICODIC="$_NICODIC" \
    ./generate-dictionary.sh
  msg "Done."

  cd "${srcdir}/${_pkgbase}-`pkgver`/src"

  # Apply fcitx patch
  rm unix/fcitx -rf
  patch -Np2 -i "$srcdir/fcitx-mozc-${_fcitxver}.patch"
  rm -rf unix/fcitx5

  # Apply fix failing build with gcc8
  patch -Np2 -i "$srcdir/fix_failing_build_with_gcc8.patch"

}


build() {
  msg2 '====================================================='
  msg2 '               *** Build Info ***'
  msg2 ' The following package files will be generated:'
  for _p in ${pkgname[@]}
  do
    msg2 "  * ${_p}-${pkgver}-${pkgrel}-${CARCH}${PKGEXT}"
  done
  msg2 '====================================================='

  msg "Starting make..."

  cd "${srcdir}/${_pkgbase}-${pkgver}/src"

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc"

  GYP_DEFINES="document_dir=/usr/share/licenses/${_pkgbase}" \
    python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype $_targets

}

package(){
  cd "${srcdir}/mozc-ut2-${pkgver}/src"
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 ${srcdir}/${_pkgbase}-${pkgver}/LICENSE ${srcdir}/${_pkgbase}-${pkgver}/docs-ut/README.md ${srcdir}/${_pkgbase}-${pkgver}/src/data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -m 644 ${srcdir}/EDICT_license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  cd "${srcdir}/${_pkgbase}-${pkgver}/src"
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
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_full.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-alpha_half.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-direct.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-direct.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-hiragana.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-hiragana.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_full.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_full.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_half.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-katakana_half.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-dictionary.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-dictionary.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-properties.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-properties.png"
  install -m 644 "$srcdir/fcitx-mozc-icons/mozc-tool.png" "${pkgdir}/usr/share/fcitx/mozc/icon/mozc-tool.png"
}
