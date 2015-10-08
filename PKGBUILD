# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

##
## Build configuration 
##
## You can choose the input method framework to use either ibus and/or uim.
## If you will not be using ibus, comment out below.
_ibus_mozc="yes"
## If you will be using uim, uncomment below.
#_uim_mozc="yes"
## If applying patch for uim-mozc fails, try to uncomment below.
_kill_kill_line="yes"
## This will disable the 'kill-line' feature of uim-mozc.

## If you will be using mozc.el on Emacs, uncomment below.
#_emacs_mozc="yes"

## ニコニコ大百科IME辞書 (NICONICOPEDIA IME dictionary, see below)
#_NICODIC="true"


#***********************************************************************
# License information:
#
# Mozc:     3-clause BSD
# uim-mozc: 3-clause BSD
#
# Mozc-UT dictionary
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
# You should not redistribute the binary of mozc-ut including edict
# (and niconico which unknown license) at least.
#
#***********************************************************************
# Upstreams:
#
# mozc
# http://code.google.com/p/mozc/
#
# Japanese zip code data by Japan Post
# http://www.post.japanpost.jp/zipcode/download.html
#
# Modified zip code data by Ibs
# http://zipcloud.ibsnet.co.jp/
#
# Mozc UT dictionary
# http://www.geocities.jp/ep3797/mozc_01.html
#
# uim-mozc by macuim
# http://code.google.com/p/macuim/
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

_mozcrev=e398317a086a78c0cf0004505eb8f56586e925b2
_utdicver=20151002
_zipcoderel=201509
_uimmozcrev=318.0562676

pkgbase=mozc-ut
pkgname=mozc-ut
true && pkgname=('mozc-ut')
pkgver=2.17.2123.102.20151002
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc_01.html"
license=('BSD' 'GPL' 'CC-BY-SA' 'custom')
makedepends=('python2' 'ruby' 'git' 'ninja' 'clang')
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/mozcdic-ut-${_utdicver}.tar.bz2
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/edict-${_utdicver}.gz
  EDICT_license.html
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/x-ken-all-${_zipcoderel}.zip
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/jigyosyo-${_zipcoderel}.zip
  mod-generate-mozc-ut.sh
)
sha1sums=('SKIP'
          'ec38640b36ab662cb1c5097d22557a85a1ea0f8e'
          'cc1b87e31cde48de716851d0125018226368f908'
          'e0ba18e67c1be8e3cfb8ecb30760597b215da255'
          '134bd80b14d87386eec38710e999dc56fc34efc3'
          'c3cd5e91ac4878e60c875076d7b3b37f087964d1'
          '6ac2f10ad9160b25d2d6e41a3f9fd112126ab1f7')


if [[ "$_ibus_mozc" == "yes" ]]; then
  true && pkgname+=('ibus-mozc-ut')
  makedepends+=('ibus>=1.4.1')
fi
if [[ "$_uim_mozc" == "yes" ]]; then
  true && pkgname+=('uim-mozc-ut')
  makedepends+=('uim')
  source+=(http://downloads.sourceforge.net/project/pnsft-aur/mozc/uim-mozc-${_uimmozcrev}.tar.xz)
  sha1sums+=('5cd298aaac5afd7ff8882453e3e8fa698c2c5aa1')

fi

if [[ "$_emacs_mozc" == "yes" ]]; then
  true && pkgname+=('emacs-mozc-ut')
fi


mozcver() {
  . "${srcdir}/mozc/src/mozc_version_template.txt"
  printf "%s.%s.%s.%s" $MAJOR $MINOR $BUILD $REVISION
}


pkgver() {
  printf "%s.%s" `mozcver` "${_utdicver}"
}


prepare() {
  cd "$srcdir"
  ln -sf `which python2` ./python
  PATH="${srcdir}:${PATH}"

  cd "${srcdir}/mozc/"

  git submodule update --init --recursive

  cd "${srcdir}/mozcdic-ut-${_utdicver}"

  _mozcver=`mozcver`
  "${srcdir}/mod-generate-mozc-ut.sh"
  msg "Generating UT dictionary seed..."
  MOZCVER="$_mozcver" DICVER="$_utdicver" NICODIC="$_NICODIC" \
    ./generate-mozc-ut.sh
  msg "Done."

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # uim-mozc
  if [[ "$_uim_mozc" == "yes" ]]; then
    cp -rf "${srcdir}/uim-mozc-${_uimmozcrev}/uim" unix/
    # kill-line patch
    if [[ "$_kill_kill_line" != "yes" ]]; then
      patch -p0 -i "${srcdir}/uim-mozc-${_uimmozcrev}/mozc-kill-line.diff"
    fi
    # Extract license part of uim-mozc
    head -n 32 unix/uim/mozc.cc > unix/uim/LICENSE

  fi

  # Generate zip code seed
  msg "Generating zip code seed..."
  python2 dictionary/gen_zip_code_seed.py \
    --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" \
    >> data/dictionary_oss/dictionary09.txt
  msg "Done."

  # Extract liccense part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
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

  # Use Qt4
  _rcc_loc=`pkg-config QtCore --variable=rcc_location`
  _qt4dir=${_rcc_loc%%/bin/rcc}
  _qt4i=`pkg-config --cflags-only-I QtGui`
  CFLAGS+=" $_qt4i"
  CXXFLAGS+=" $_qt4i"

  msg "Starting make..."

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Get make -j option from $MAKEFLAGS
  _jobs=`sed -n -e "s/.*--jobs=\([0-9]\+\).*/\1/p" -e "s/.*-j *\([0-9]\+\).*/\1/p" <<< "$MAKEFLAGS"`
  _jobs=${_jobs:-1}

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool "
  [[ "$_emacs_mozc" == "yes" ]] && _targets+="unix/emacs/emacs.gyp:mozc_emacs_helper "
  [[ "$_ibus_mozc"  == "yes" ]] && _targets+="unix/ibus/ibus.gyp:ibus_mozc renderer/renderer.gyp:mozc_renderer "
  [[ "$_uim_mozc"   == "yes" ]] && _targets+="unix/uim/uim.gyp:uim-mozc "

  unset CC CC_host CC_target CXX CXX_host CXX_target LINK AR AR_host AR_target \
        NM NM_host NM_target READELF READELF_host READELF_target
  QTDIR=$_qt4dir GYP_DEFINES="document_dir=/usr/share/licenses/${pkgbase}" \
    python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype -j $_jobs $_targets

  [[ "$_ibus_mozc" == "yes" ]] && \
    sed -i 's|/usr/libexec/|/usr/lib/ibus-mozc/|g' \
           out_linux/${_bldtype}/gen/unix/ibus/mozc.xml

}

package_mozc-ut() {
  pkgdesc="Mozc the Japanese Input Method with Mozc UT Dictionary"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=('qt4' 'zinnia')
  install=mozc-ut.install
  provides=("mozc=${_mozcver}")
  replaces=('mozc-server-ut' 'mozc-utils-gui-ut')
  conflicts=('mozc' 'mozc-server' 'mozc-utils-gui')
  optdepends=('tegaki-models-zinnia-japanese: hand-writing recognition support')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/lib/mozc/documents/"
  install    -m 644 data/installer/*.html "${pkgdir}/usr/lib/mozc/documents/"

  _licpath="${pkgdir}/usr/share/licenses/${pkgbase}"
  install -D -m 644 LICENSE       "${_licpath}/LICENSE_MOZC"
  install    -m 644 doc-ut/README "${_licpath}/README_MOZC-UT"
  install    -m 644 data/installer/*.html "$_licpath"

  cd doc-ut/dictionary
  for d in *
  do
    install -d "${_licpath}/dictionary/${d}"
    install -m 644 "${d}"/* "${_licpath}/dictionary/${d}"
  done
  install -m 644 "${srcdir}/EDICT_license.html" "${_licpath}/dictionary/edict/license.html"
}

package_emacs-mozc-ut() {
  pkgdesc="Mozc for Emacs"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'emacs')
  install=emacs-mozc.install
  replaces=('emacs-mozc-bin')
  provides=('emacs-mozc')
  conflicts=('emacs-mozc' 'emacs-mozc-bin')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m 755 out_linux/${_bldtype}/mozc_emacs_helper "${pkgdir}/usr/bin/mozc_emacs_helper"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc/"
  install -m 644 unix/emacs/mozc.el "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc"
}

package_ibus-mozc-ut() {
  pkgdesc="IBus engine module for Mozc"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'ibus>=1.4.1')
  provides=('ibus-mozc')
  conflicts=('ibus-mozc')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m 755 out_linux/${_bldtype}/ibus_mozc       "${pkgdir}/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 out_linux/${_bldtype}/gen/unix/ibus/mozc.xml "${pkgdir}/usr/share/ibus/component/mozc.xml"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  install    -m 644 data/images/unix/ui-tool.png          "${pkgdir}/usr/share/ibus-mozc/tool.png"
  install    -m 644 data/images/unix/ui-properties.png    "${pkgdir}/usr/share/ibus-mozc/properties.png"
  install    -m 644 data/images/unix/ui-dictionary.png    "${pkgdir}/usr/share/ibus-mozc/dictionary.png"
  install    -m 644 data/images/unix/ui-direct.png        "${pkgdir}/usr/share/ibus-mozc/direct.png"
  install    -m 644 data/images/unix/ui-hiragana.png      "${pkgdir}/usr/share/ibus-mozc/hiragana.png"
  install    -m 644 data/images/unix/ui-katakana_half.png "${pkgdir}/usr/share/ibus-mozc/katakana_half.png"
  install    -m 644 data/images/unix/ui-katakana_full.png "${pkgdir}/usr/share/ibus-mozc/katakana_full.png"
  install    -m 644 data/images/unix/ui-alpha_half.png    "${pkgdir}/usr/share/ibus-mozc/alpha_half.png"
  install    -m 644 data/images/unix/ui-alpha_full.png    "${pkgdir}/usr/share/ibus-mozc/alpha_full.png"

  install -D -m 755 out_linux/${_bldtype}/mozc_renderer "${pkgdir}/usr/lib/mozc/mozc_renderer"
}

package_uim-mozc-ut() {
  pkgdesc="uim plugin module for Mozc"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'uim')
  install=uim-mozc.install
  provides=('uim-mozc')
  conflicts=('uim-mozc')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -D -m 755 out_linux/${_bldtype}/libuim-mozc.so  "${pkgdir}/usr/lib/uim/plugin/libuim-mozc.so"
  install -d "${pkgdir}/usr/share/uim"
  install    -m 644 ${srcdir}/uim-mozc-${_uimmozcrev}/scm/*.scm       "${pkgdir}/usr/share/uim/"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/uim/pixmaps/mozc.png"
  install    -m 644 data/images/unix/ui-tool.png       "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_selector.png"
  install    -m 644 data/images/unix/ui-properties.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_config_dialog.png"
  install    -m 644 data/images/unix/ui-dictionary.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_dictionary_tool.png"

  install -D -m 644 unix/uim/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/uim-mozc/LICENSE"
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="Mozc the Japanese Input Method with Mozc UT Dictionary (additional dictionary) and uim-mozc (optional)"
depends=('qt4' 'zinnia')
