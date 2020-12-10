# Maintainer: OrangeJuicelol <tep789 at gmail dot com>
# Contributor: Rylie <chiefdoraemon at gmail dot com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## If you will be using mozc.el on Emacs, uncomment below.
#_emacs_mozc="yes"

## If you will not be using ibus, comment out below.
_ibus_mozc="yes"

## Mozc compile option
_bldtype=Release
#_bldtype=Debug

#*************************************************************
# Upstreams:
#
# mozc
# http://code.google.com/p/mozc/
#
# Mozc UT dictionary
# https://osdn.net/users/utuhiro/pf/utuhiro/files/
#*************************************************************

_mozcrev=afb03ddfe72dde4cf2409863a3bfea160f7a66d8
_mozcver=2.23.2815.102
_utdicdate=20201129
_utdicver=1

pkgbase=mozc-ut-united
pkgname=mozc-ut-united
true && pkgname=('mozc-ut-united')
pkgver=${_mozcver}.${_utdicdate}
pkgrel=1
arch=('i686' 'x86_64')
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('BSD' 'GPL' 'custom')
makedepends=('python' 'ruby' 'git' 'ninja' 'clang' 'gyp')
#source=("${_svndir}/${_svnmod}::svn+${_svntrunk}"
source=(
  mozc::git+https://github.com/google/mozc.git#commit=${_mozcrev}
  https://raw.githubusercontent.com/OrangeJuicelol/mozc-ut-united/master/mozc.patch
  https://raw.githubusercontent.com/OrangeJuicelol/mozc-ut-united/master/Add_support_new_Japanese_era.patch
  https://raw.githubusercontent.com/OrangeJuicelol/mozc-ut-united/master/Change-from-python2-code-to-python3.patch
  https://osdn.net/downloads/users/26/26959/mozcdic-ut-${_utdicdate}.${_utdicver}.tar.bz2
)
sha1sums=('SKIP'
          'a366077418ae6f235aecf374256354a40dc5b37a'
          '3aa3077cb28352f9aafde71f8d864b333424338f'
          'f363373e892ac53b972cb092a3627b3a4fbc5b6a'
          'eb6fc52789044238b81596479107239e491c4f25')


if [[ "$_emacs_mozc" == "yes" ]]; then
  true && pkgname+=('emacs-mozc-ut-united')
  makedepends+=('emacs')
fi

if [[ "$_ibus_mozc" == "yes" ]]; then
  true && pkgname+=('ibus-mozc-ut-united')
fi


pkgver() {
  printf "%s.%s" $_mozcver $_utdicdate
}


prepare() {
  # Enabling all dictionaries
  sed -i '/^#.*="true"/ s/^#//' ${srcdir}/mozcdic-ut-${_utdicdate}.${_utdicver}/src/make-dictionaries.sh
  
  mkdir -p mozc/src/third_party
  cd "${srcdir}/mozc/"
  git submodule update --init --recursive
  patch -Np1 -i ${srcdir}/mozc.patch
  patch -Np1 -i ${srcdir}/Change-from-python2-code-to-python3.patch
  patch -Np1 -i ${srcdir}/Add_support_new_Japanese_era.patch
  
  # Add UT dictionary
  cat ${srcdir}/mozcdic-ut-${_utdicdate}.${_utdicver}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
}


build() {
  echo '====================================================='
  echo '               *** Build Info ***'
  echo ' The following package files will be generated:'
  for _p in ${pkgname[@]}
  do
    echo "  * ${_p}-${pkgver}-${pkgrel}-${CARCH}${PKGEXT}"
  done
  echo '====================================================='

  PATH="${srcdir}:${PATH}"

  cd "${srcdir}/mozc/src"

  echo "Starting make..."

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool "
  [[ "$_emacs_mozc" == "yes" ]] && _targets+="unix/emacs/emacs.gyp:mozc_emacs_helper "
  [[ "$_ibus_mozc" == "yes" ]] && _targets+="unix/ibus/ibus.gyp:ibus_mozc renderer/renderer.gyp:mozc_renderer "

  GYP_DEFINES="use_libzinnia=1 document_dir=/usr/share/licenses/${pkgbase}" \
    python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets

  if [[ "$_ibus_mozc" == "yes" ]]; then
      sed -i 's|/usr/libexec/|/usr/lib/ibus-mozc/|g' \
          out_linux/${_bldtype}/gen/unix/ibus/mozc.xml
  fi
}

package_mozc-ut-united() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  provides=("mozc=${_mozcver}")
  conflicts=('mozc' 'mozc-ut-unified' 'mozc-neologd-ut' 'mozc-ut2' 'mozc-neologd-ut+ut2' 'mozc-server' 'mozc-utils-gui')
  optdepends=('tegaki-models-zinnia-japanese: hand-writing recognition support')

  cd "${srcdir}/mozc"
  install -D -m 755 src/out_linux/${_bldtype}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 src/out_linux/${_bldtype}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/lib/mozc/documents/"
  install    -m 644 src/data/installer/*.html "${pkgdir}/usr/lib/mozc/documents/"
  
  _licpath="${pkgdir}/usr/share/licenses/${pkgbase}"
  install -D -m 644 LICENSE "${_licpath}/LICENSE_MOZC"
  install    -m 644 src/data/installer/*.html "${_licpath}"
  
  cd "${srcdir}/mozcdic-ut-${_utdicdate}.${_utdicver}"
  install    -m 644 README.md "${_licpath}/README_MOZC-UT.md"
  
  cd "${srcdir}/mozc"
  cp -rf docs/ "${_licpath}/"
  chmod 644 -R "${_licpath}/docs/"
}

package_ibus-mozc-ut-united() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  arch=('i686' 'x86_64')
  depends=('ibus>=1.4.1')
  provides=('ibus-mozc')
  conflicts=('ibus-mozc' 'ibus-mozc-ut2')

  cd "${srcdir}/mozc/src"
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

package_emacs-mozc-ut-united() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  arch=('i686' 'x86_64')
  depends=('emacs')
  provides=('emacs-mozc')
  conflicts=('emacs-mozc' 'emacs-mozc-bin' 'emacs-mozc-ut2')
  install=emacs-mozc.install

  cd "${srcdir}/mozc/src"
  install -D -m 755 out_linux/${_bldtype}/mozc_emacs_helper "${pkgdir}/usr/bin/mozc_emacs_helper"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc/"
  install -m 644 unix/emacs/mozc.el "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc"
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
depends=('qt5-base' 'zinnia')
