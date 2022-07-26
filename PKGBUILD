# $Id$
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=0ee47ed
_abseil_cpp_commit=2151058
_breakpad_commit=216cea7
_gtest_commit=703bd9c
_gyp_commit=9ecf45e
_japanese_usage_dictionary_commit=e5b3425
_jsoncpp_commit=11086dd
_protobuf_commit=cc7b1b5
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20220723

_pkgbase=mozc-ut
pkgbase=$_pkgbase-full
pkgname=(${pkgbase}-common ibus-${pkgbase} fcitx5-${pkgbase} emacs-${pkgbase})
pkgver=2.28.4800.102.20220723
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('pkg-config' 'python' 'curl' 'gtk2' 'mesa' 'ninja' 'git' 'clang' 'python-six' 'fcitx5' 'emacs' 'qt5-base' 'ibus' 'gyp')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip
        git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}
        git+https://chromium.googlesource.com/breakpad/breakpad#commit=${_breakpad_commit}
        git+https://github.com/google/googletest.git#commit=${_gtest_commit}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_commit}
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}
        git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_commit}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_commit}
        https://osdn.net/users/utuhiro/pf/utuhiro/dl/mozcdic-ut-${_utdicdate}.tar.bz2)
sha512sums=('SKIP'
            'dec6479b42ddc1355cd882d17824cd874d8f103ad7767bac3f490f04551059d65b2806fa9e3f39a50ced2ecfdd37b75c9ed4536d9ad3bcef9e8c5ae1ec10e302'
            '606f45d48a9dad0e80a566cab0001910de3c6b2f634ec52c6ef6f44745b55ae8e181b3e3cdf90525a08be1f180eb35900672c90c6ab4f43679a178e863378bbc'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6fa5a6c9f97d97216d7fb4711299d3322667252a2dd74db08257edafaa3affc6db837cd9daa2c81cd4235d1c8418a10c10b22a3a6ef32aff33e69d7ec21daa5e')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

pkgver() {
  cd "${srcdir}/mozc"
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s.%s" $MAJOR $MINOR $BUILD_OSS $((REVISION+2)) $_utdicdate
}

prepare() {
  # Enabling all dictionaries
  sed -i '/^#.*="true"/ s/^#//' "${srcdir}/mozcdic-ut-${_utdicdate}/src/make-dictionaries.sh"

  cd "$srcdir/mozc"
  git submodule init
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
  git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git submodule update

  cd src
  # Generate zip code seed
  msg "Generating zip code seed..."
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo "Done."

  # disable fcitx4 target
  rm unix/fcitx/fcitx.gyp

  # fix mozc icon for kimpanel
  sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # Add UT dictionary
  cat "${srcdir}/mozcdic-ut-${_utdicdate}/"mozcdic*-ut-*.txt >> data/dictionary_oss/dictionary00.txt
}

build() {
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd mozc/src

  # TODO: use bazel

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx5/fcitx5.gyp:fcitx5-mozc unix/emacs/emacs.gyp:mozc_emacs_helper unix/ibus/ibus.gyp:ibus_mozc renderer/renderer.gyp:mozc_renderer"

  QTDIR=/usr GYP_DEFINES="document_dir=/usr/share/licenses/${pkgbase} use_libzinnia=1" \
    python build_mozc.py gyp --gypdir=/usr/bin --target_platform=Linux
  python build_mozc.py build -c $_bldtype $_targets --use_gyp_for_ibus_build

  sed 's|/usr/libexec/|/usr/lib/ibus-mozc/|g' -i "out_linux/${_bldtype}/gen/unix/ibus/mozc.xml"

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

package_mozc-ut-full-common() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  options=('!docs')
  export PREFIX="${pkgdir}/usr"
  export _bldtype
  cd mozc/src

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m 644 LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"

  ../scripts/install_server
}

package_fcitx5-mozc-ut-full() {
  pkgdesc="Fcitx5 module for Mozc with UT dictionary"
  depends=('qt5-base' 'fcitx5' ${pkgbase}-common)
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc')
  conflicts=('fcitx-mozc' 'fcitx5-mozc')

  export PREFIX="${pkgdir}/usr"
  export _bldtype
  cd mozc/src

  ../scripts/install_fcitx5
}

package_ibus-mozc-ut-full() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' ${pkgbase}-common)
  replaces=('ibus-mozc')
  conflicts=('ibus-mozc')

  export _bldtype
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


package_emacs-mozc-ut-full() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  depends=('emacs' ${pkgbase}-common)
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src"
  install -D -m 755 out_linux/${_bldtype}/mozc_emacs_helper "${pkgdir}/usr/bin/mozc_emacs_helper"
  install -d "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc/"
  install -m 644 unix/emacs/mozc.el "${pkgdir}/usr/share/emacs/site-lisp/emacs-mozc"
}
