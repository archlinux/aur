# Maintainer: silverhikari <kerrickethan at gmail dot com>
# Contributor: OrangeJuicelol <tep789 at gmail dot com>
# Contributor: Rylie <chiefdoraemon at gmail dot com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## If you will be using mozc.el on Emacs, uncomment below.
#_emacs_mozc="yes"

## If you will be using ibus, uncomment below.
_ibus_mozc="yes"

## Mozc compile option
_bldtype=Release
#_bldtype=Debug

#*************************************************************
# Upstreams:
#
# mozc
# https://code.google.com/p/mozc/
#
# Mozc UT dictionary
# https://osdn.net/users/utuhiro/pf/utuhiro/files/
#*************************************************************

_mozcver=2.28.4960.102
_utdicdate=20230107
_utdicver=1

pkgbase=mozc-ut-united
pkgname=mozc-ut-united
true && pkgname=('mozc-ut-united')
pkgver=2.28.4960.102_20230107_2.28.4880.102.r161.g7ec82c93
pkgrel=1
arch=('i686' 'x86_64')
url="https://code.google.com/p/mozc/"
url="https://osdn.net/users/utuhiro/pf/utuhiro/files/"
license=('BSD' 'GPL' 'custom')
makedepends=('ruby' 'git' 'ninja' 'clang' 'zinnia' 'bazel' 'python-six')
source=("mozc::git+https://github.com/google/mozc.git" "https://osdn.net/downloads/users/40/40080/mozcdic-ut-${_utdicdate}.tar.bz2" "git+https://chromium.googlesource.com/breakpad/breakpad" "git+https://github.com/google/googletest.git" "git+https://chromium.googlesource.com/external/gyp" "git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git" "git+https://github.com/open-source-parsers/jsoncpp.git" "git+https://github.com/protocolbuffers/protobuf" "git+https://github.com/abseil/abseil-cpp.git")
sha1sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')


if [[ "$_emacs_mozc" == "yes" ]]; then
  true && pkgname+=('emacs-mozc-ut-united')
  makedepends+=('emacs')
fi

if [[ "$_ibus_mozc" == "yes" ]]; then
  true && pkgname+=('ibus-mozc-ut-united')
fi

pkgver() {
  cd "${srcdir}/mozc/"

  printf "%s_%s_%s" "${_mozcver}" "${_utdicdate}" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  # Enabling all dictionaries
  sed -i '/^#.*="true"/ s/^#//' ${srcdir}/mozcdic-ut-${_utdicdate}/src/make-dictionaries.sh
  
  mkdir -p mozc/src/third_party
  cd "${srcdir}/mozc/"

  git submodule init
  git config submodule.breakpad.url "$srcdir/breakpad"
  git config submodule.gtest.url "$srcdir/googletest"
  git config submodule.gyp.url "$srcdir/gyp"
  git config submodule.japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.jsoncpp.url "$srcdir/jsoncpp"
  git config submodule.protobuf.url "$srcdir/protobuf"
  git config submodule.abseil-cpp.url "$srcdir/abseil-cpp"
  git -c protocol.file.allow=always submodule update

  # Add UT dictionary
  cat ${srcdir}/mozcdic-ut-${_utdicdate}/mozcdic*-ut-*.txt >> src/data/dictionary_oss/dictionary00.txt
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

  bazel --output_user_root="$srcdir/bazel-cache" build package --config oss_linux -c opt --verbose_failures

  if [[ "$_ibus_mozc" == "yes" ]]; then
      sed -i 's|/usr/libexec/|/usr/lib/ibus-mozc/|g' \
          "${srcdir}/mozc/src/bazel-out/k8-opt/bin/unix/ibus/mozc.xml"
  fi
}

package_mozc-ut-united() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  arch=('i686' 'x86_64')
  depends=('qt5-base' 'zinnia')
  provides=("mozc=${_mozcver}")
  conflicts=('mozc' 'mozc-ut-unified' 'mozc-neologd-ut' 'mozc-ut2' 'mozc-neologd-ut+ut2' 'mozc-server' 'mozc-utils-gui')
  optdepends=('tegaki-models-zinnia-japanese: hand-writing recognition support')

  _output="${srcdir}/mozc/src/bazel-out/k8-opt/bin"

  install -D -m 755 "${_output}/server/mozc_server" "${pkgdir}/usr/lib/mozc/mozc_server"
  install    -m 755 "${_output}/gui/tool/mozc_tool"   "${pkgdir}/usr/lib/mozc/mozc_tool"

  install -d "${pkgdir}/usr/lib/mozc/documents/"
  install    -m 644 "${srcdir}/mozc/src/data/installer/credits_en.html" "${pkgdir}/usr/lib/mozc/documents/"
  
  _licpath="${pkgdir}/usr/share/licenses/${pkgbase}"
  install -D -m 644 "${srcdir}/mozc/LICENSE" "${_licpath}/LICENSE_MOZC"
  install    -m 644 "${srcdir}/mozc/src/data/installer/credits_en.html" "${_licpath}"
  
  cd "${srcdir}/mozcdic-ut-${_utdicdate}"
  install    -m 644 "README.md" "${_licpath}/README_MOZC-UT.md"
  
  cd "${srcdir}/mozc"
  cp -rf "docs/" "${_licpath}/"
  chmod 644 -R "${_licpath}/docs/"
}

package_ibus-mozc-ut-united() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  arch=('i686' 'x86_64')
  depends=('ibus>=1.4.1')
  provides=('ibus-mozc')
  conflicts=('ibus-mozc' 'ibus-mozc-ut2')

  cd "${srcdir}/mozc/src"

  _output="${srcdir}/mozc/src/bazel-out/k8-opt/bin"

  install -D -m 644 "${_output}/unix/ibus/mozc.xml" "${pkgdir}/usr/share/ibus/component/mozc.xml"
  install -D -m 755 "${_output}/unix/ibus/ibus_mozc"       "${pkgdir}/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 "data/images/unix/ime_product_icon_opensource-32.png" "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  install    -m 644 data/images/unix/ui-tool.png          "${pkgdir}/usr/share/ibus-mozc/tool.png"
  install    -m 644 data/images/unix/ui-properties.png    "${pkgdir}/usr/share/ibus-mozc/properties.png"
  install    -m 644 data/images/unix/ui-dictionary.png    "${pkgdir}/usr/share/ibus-mozc/dictionary.png"
  install    -m 644 data/images/unix/ui-direct.png        "${pkgdir}/usr/share/ibus-mozc/direct.png"
  install    -m 644 data/images/unix/ui-hiragana.png      "${pkgdir}/usr/share/ibus-mozc/hiragana.png"
  install    -m 644 data/images/unix/ui-katakana_half.png "${pkgdir}/usr/share/ibus-mozc/katakana_half.png"
  install    -m 644 data/images/unix/ui-katakana_full.png "${pkgdir}/usr/share/ibus-mozc/katakana_full.png"
  install    -m 644 data/images/unix/ui-alpha_half.png    "${pkgdir}/usr/share/ibus-mozc/alpha_half.png"
  install    -m 644 data/images/unix/ui-alpha_full.png    "${pkgdir}/usr/share/ibus-mozc/alpha_full.png"

  install -D -m 755 "${_output}/renderer/mozc_renderer" "${pkgdir}/usr/lib/mozc/mozc_renderer"
}

package_emacs-mozc-ut-united() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  arch=('i686' 'x86_64')
  depends=('emacs')
  provides=('emacs-mozc')
  conflicts=('emacs-mozc' 'emacs-mozc-bin' 'emacs-mozc-ut2')
  install=

  cd "${srcdir}/mozc/src"

  _output="${srcdir}/mozc/src/bazel-out/k8-opt/bin"

  install -D -m 755 "${_output}/unix/emacs/mozc_emacs_helper" "${pkgdir}/usr/bin/mozc_emacs_helper"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc/"
  install -m 644 "${srcdir}/mozc/src/unix/emacs/mozc.el" "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc"
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
depends=('qt5-base' 'zinnia')
