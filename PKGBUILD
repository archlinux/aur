# $Id$
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=d4a26a6
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20221022

_pkgbase=mozc-ut
pkgbase=$_pkgbase-full
pkgname=(${pkgbase}-common ibus-${pkgbase} fcitx5-${pkgbase} emacs-${pkgbase})
pkgver=2.28.4960.102.20221022
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('pkg-config' 'python' 'curl' 'gtk2' 'mesa' 'ninja' 'git' 'clang' 'python-six' 'fcitx5' 'emacs' 'qt5-base' 'ibus' 'gyp')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip
        git+https://github.com/abseil/abseil-cpp.git
        git+https://chromium.googlesource.com/breakpad/breakpad
        git+https://github.com/google/googletest.git
        git+https://chromium.googlesource.com/external/gyp
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
        git+https://github.com/open-source-parsers/jsoncpp.git
        git+https://github.com/google/protobuf.git
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
            '08f8fe1757fd69c94d6d46a7f6cdd2398a6d946cb69531131697f5a35fdb970742fb26aa4285a2025ab14a6fe2992f4f1ec299d20b899db98cad1c53be9a0ca3')
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
  git -c protocol.file.allow=always submodule update --init --recursive

  cd src
  # Generate zip code seed
  msg "Generating zip code seed..."
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo "Done."

  # disable fcitx4 target
  rm unix/fcitx/fcitx.gyp

  # disable android-ndk requirement, even if we don't need it bazel will complain
  sed "/android_ndk_repository/d" -i WORKSPACE.bazel

  # adjust QT_BASE_PATH
  sed 's|path = QT_BASE_PATH|path = "/usr/include/qt"|' -i WORKSPACE.bazel

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

  _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"
  _options="-c opt --copt=-fPIC --config oss_linux"

  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  export QT_BASE_PATH=/usr/include/qt
  bazel build $_targets $_options

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

  ../scripts/install_server_bazel
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

  ../scripts/install_fcitx5_bazel
}

package_ibus-mozc-ut-full() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' ${pkgbase}-common)
  replaces=('ibus-mozc')
  conflicts=('ibus-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src"
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"


  cd bazel-bin/unix
  unzip -o icons.zip

  install -Dm644 mozc.png                                  "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  install -Dm644 alpha_full.svg                            "${pkgdir}/usr/share/ibus-mozc/alpha_full.svg"
  install -Dm644 alpha_half.svg                            "${pkgdir}/usr/share/ibus-mozc/alpha_half.svg"
  install -Dm644 direct.svg                                "${pkgdir}/usr/share/ibus-mozc/direct.svg"
  install -Dm644 hiragana.svg                              "${pkgdir}/usr/share/ibus-mozc/hiragana.svg"
  install -Dm644 katakana_full.svg                         "${pkgdir}/usr/share/ibus-mozc/katakana_full.svg"
  install -Dm644 katakana_half.svg                         "${pkgdir}/usr/share/ibus-mozc/katakana_half.svg"
  install -Dm644 outlined/dictionary.svg                   "${pkgdir}/usr/share/ibus-mozc/dictionary.svg"
  install -Dm644 outlined/properties.svg                   "${pkgdir}/usr/share/ibus-mozc/properties.svg"
  install -Dm644 outlined/tool.svg                         "${pkgdir}/usr/share/ibus-mozc/tool.svg"
}


package_emacs-mozc-ut-full() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  depends=('emacs' ${pkgbase}-common)
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src"
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}
