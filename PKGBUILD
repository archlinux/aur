# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

##
## Build configuration 
##
## You can choose the input method framework to use either ibus and/or uim.
## If you will not be using ibus, comment out below.
_ibus_mozc="yes"
## If you will be using uim, uncomment below.
#_uim_mozc="yes"

## If you will be using mozc.el on Emacs, uncomment below.
#_emacs_mozc="yes"

## If you want to use 'kill-line' feature of uim, uncomment below.
#_kill_line="yes"
## NOTE: This option affects only for uim users.
##       Bcause this applies a patch to original mozc source,
##       there is a possibility to fail depends on the mozc version.

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

_mozcrev=afb03ddfe72dde4cf2409863a3bfea160f7a66d8
_mozcver=2.23.2815.102
_utdicver=20171008
_zipcoderel=201809
_uimmozcrev=c979f127acaeb7b35d3344e8b1e40848e1a68d54

pkgbase=mozc-ut2
pkgname=mozc-ut2
true && pkgname=('mozc-ut2')
pkgver="${_mozcver}.${_utdicver}"
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.geocities.jp/ep3797/mozc-ut2.html"
license=('BSD' 'GPL' 'CC-BY-SA' 'custom')
makedepends=('python2' 'ruby' 'git' 'ninja' 'clang' 'qt5-base')
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/mozcdic-ut2-${_utdicver}.tar.bz2
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/edict2-${_utdicver}.gz
  EDICT_license.html
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/ken_all-${_zipcoderel}.zip
  http://downloads.sourceforge.net/project/pnsft-aur/mozc/jigyosyo-${_zipcoderel}.zip
  mod-generate-dictionary.sh
  https://gist.githubusercontent.com/MightyPork/6b93f56b404e526268ac133f1a783afd/raw/40b3b9569d4b0741d78c511b247b26d2b1e7a2ae/mozc.patch
)
sha1sums=('SKIP'
          '9f88c5f12b3d9b1190c8ec046c6693483af3ba3f'
          'e085ab894d415ce318cf91de64f017d505f1d14e'
          'e0ba18e67c1be8e3cfb8ecb30760597b215da255'
          'da6f64c636426cac0ff20fd67c19a9ae510edd43'
          'e1b1710738ff161809ad3bc0c6bb432a0c577e8a'
          'd4f21a1684244387904b152f969a5e631f825af4'
          'a366077418ae6f235aecf374256354a40dc5b37a')


if [[ "$_ibus_mozc" == "yes" ]]; then
  true && pkgname+=('ibus-mozc-ut2')
  makedepends+=('ibus>=1.4.1')
fi
if [[ "$_uim_mozc" == "yes" ]]; then
  true && pkgname+=('uim-mozc-ut2')
  makedepends+=('uim')
  source+=(uim-mozc::git+https://github.com/e-kato/macuim.git#commit=${_uimmozcrev})
  sha1sums+=('SKIP')

fi

if [[ "$_emacs_mozc" == "yes" ]]; then
  true && pkgname+=('emacs-mozc-ut2')
fi


prepare() {
  ln -sf `which python2` "${srcdir}/python"

  cd "${srcdir}/mozc/"
  git submodule update --init --recursive

  patch -Np1 -i "${srcdir}/mozc.patch"

  cd "${srcdir}/mozcdic-ut2-${_utdicver}"

  "${srcdir}/mod-generate-dictionary.sh"
  msg "Generating UT dictionary seed..."
  MOZCVER="$_mozcver" DICVER="$_utdicver" NICODIC="$_NICODIC" \
    ./generate-dictionary.sh
  msg "Done."

  cd "${srcdir}/${pkgbase}-${pkgver}/src"

  # uim-mozc
  if [[ "$_uim_mozc" == "yes" ]]; then
    cp -rf "${srcdir}/uim-mozc/Mozc/uim" unix/
    # kill-line patch
    if [[ "$_kill_line" == "yes" ]]; then
      patch -p0 -i "${srcdir}/uim-mozc/Mozc/mozc-kill-line.diff"
    fi
    # Extract license part of uim-mozc
    head -n 32 unix/uim/mozc.cc > unix/uim/LICENSE

  fi

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

  PATH="${srcdir}:${PATH}"
 
  cd "${srcdir}/${pkgbase}-${pkgver}/src"

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool "
  [[ "$_emacs_mozc" == "yes" ]] && _targets+="unix/emacs/emacs.gyp:mozc_emacs_helper "
  [[ "$_ibus_mozc"  == "yes" ]] && _targets+="unix/ibus/ibus.gyp:ibus_mozc renderer/renderer.gyp:mozc_renderer "
  [[ "$_uim_mozc"   == "yes" ]] && _targets+="unix/uim/uim.gyp:uim-mozc "

  unset CC CC_host CC_target CXX CXX_host CXX_target LINK AR AR_host AR_target \
        NM NM_host NM_target READELF READELF_host READELF_target
  GYP_DEFINES="document_dir=/usr/share/licenses/${pkgbase}" \
    python2 build_mozc.py gyp
  python2 build_mozc.py build -c $_bldtype $_targets

  if [[ "$_ibus_mozc" == "yes" ]]; then
      sed -i 's|/usr/libexec/|/usr/lib/ibus-mozc/|g' \
          out_linux/${_bldtype}/gen/unix/ibus/mozc.xml
  fi

}

package_mozc-ut2() {
  pkgdesc="Mozc the Japanese Input Method with Mozc UT2 Dictionary"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=('qt5-base' 'zinnia')
  install=mozc-ut.install
  provides=("mozc=${_mozcver}")
  replaces=('mozc-server-ut' 'mozc-utils-gui-ut' 'mozc-ut')
  conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-ut')
  optdepends=('tegaki-models-zinnia-japanese: hand-writing recognition support')

  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  install -D -m 755 out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/lib/mozc/documents/"
  install    -m 644 data/installer/*.html "${pkgdir}/usr/lib/mozc/documents/"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  _licpath="${pkgdir}/usr/share/licenses/${pkgbase}"
  install -D -m 644 LICENSE "${_licpath}/LICENSE_MOZC"
  install    -m 644 docs-ut/README.md "${_licpath}/README_MOZC-UT.md"
  install    -m 644 src/data/installer/*.html "$_licpath"

  cp -rf docs-ut/ "${_licpath}/"
  chmod 644 -R "${_licpath}/docs-ut/"
}

package_emacs-mozc-ut2() {
  pkgdesc="Mozc for Emacs"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'emacs')
  install=emacs-mozc.install
  replaces=('emacs-mozc-bin' 'emacs-mozc-ut')
  provides=('emacs-mozc')
  conflicts=('emacs-mozc' 'emacs-mozc-bin' 'emacs-mozc-ut')

  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  install -D -m 755 out_linux/${_bldtype}/mozc_emacs_helper "${pkgdir}/usr/bin/mozc_emacs_helper"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc/"
  install -m 644 unix/emacs/mozc.el "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc"
}

package_ibus-mozc-ut2() {
  pkgdesc="IBus engine module for Mozc"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'ibus>=1.4.1')
  replaces=('ibus-mozc-ut')
  provides=('ibus-mozc')
  conflicts=('ibus-mozc' 'ibus-mozc-ut')

  cd "${srcdir}/${pkgbase}-${pkgver}/src"
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

package_uim-mozc-ut2() {
  pkgdesc="uim plugin module for Mozc"
  arch=('i686' 'x86_64')
  groups=('mozc-im')
  depends=("mozc=${_mozcver}" 'uim')
  install=uim-mozc.install
  replaces=('uim-mozc-ut')
  provides=('uim-mozc')
  conflicts=('uim-mozc' 'uim-mozc-ut')

  cd "${srcdir}/${pkgbase}-${pkgver}/src"
  install -D -m 755 out_linux/${_bldtype}/libuim-mozc.so  "${pkgdir}/usr/lib/uim/plugin/libuim-mozc.so"
  install -d "${pkgdir}/usr/share/uim"
  install    -m 644 ${srcdir}/uim-mozc/Mozc/scm/*.scm       "${pkgdir}/usr/share/uim/"
  install -D -m 644 data/images/unix/ime_product_icon_opensource-32.png "${pkgdir}/usr/share/uim/pixmaps/mozc.png"
  install    -m 644 data/images/unix/ui-tool.png       "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_selector.png"
  install    -m 644 data/images/unix/ui-properties.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_config_dialog.png"
  install    -m 644 data/images/unix/ui-dictionary.png "${pkgdir}/usr/share/uim/pixmaps/mozc_tool_dictionary_tool.png"

  install -D -m 644 unix/uim/LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}/uim-mozc/LICENSE"
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="Mozc the Japanese Input Method with Mozc UT2 Dictionary (additional dictionary) and uim-mozc (optional)"
depends=('qt5-base' 'zinnia')
