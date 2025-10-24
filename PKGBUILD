# Maintainer: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype=Release
_mozc_commit=ca82d39

## follow the submodule commits in https://github.com/fcitx/mozc/tree/fcitx/src/third_party
_abseil_cpp_commit=0f3bb46
_breakpad_commit=216cea7
_gtest_commit=703bd9c
_gyp_commit=caa6002
_japanese_usage_dictionary_commit=e5b3425
_jsoncpp_commit=11086dd
_protobuf_commit=fde7cf7

## the latest release from https://osdn.net/projects/ponsfoot-aur/storage/mozc/
_zipcode_rel=202104

_pkgbase=mozc
pkgname=fcitx-mozc
pkgdesc="Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
pkgver=2.26.4360.102.gca82d39
pkgrel=3
arch=('x86_64')
url="https://github.com/google/mozc"
license=('custom')
depends=('qt5-base' 'fcitx')
makedepends=('pkg-config' 'python' 'curl' 'mesa' 'subversion' 'ninja' 'git' 'clang' 'python-six')
replaces=('mozc-fcitx')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx5-mozc')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        https://osdn.ip-connect.vn.ua/storage/g/p/po/ponsfoot-aur/mozc/jigyosyo-${_zipcode_rel}.zip
        https://osdn.ip-connect.vn.ua/storage/g/p/po/ponsfoot-aur/mozc/x-ken-all-${_zipcode_rel}.zip
        git+https://chromium.googlesource.com/breakpad/breakpad#commit=${_breakpad_commit}
        git+https://github.com/google/googletest.git#commit=${_gtest_commit}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_commit}
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}
        git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_commit}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_commit}
        git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}
	)
sha512sums=('SKIP'
            'cadb43138597371d13d21a2766ba38f0940a73bd961a1142f3713f700d1b8e75bdb6ccc0600ea57518ad5bf1931eed329cd11faeb87b191aa460e379ed1fed93'
            'b473bda282e12c448ec10522306035b10b566d7ebfb051602e287a7890405db9189ce60189ed47cc130d15a196cd8c7440c6cbb2aaacc7e8cd62b90e50bcb1d9'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9')  # Weng Xuetian

pkgver(){
  cd mozc
  # change pkgver is OK because we fixed commit
  # parse major.minor.buildid from version template, revision is fixed to 102 for Linux
  _bzr_ver=$(sed 's/ //g;$ a echo $MAJOR.$MINOR.$BUILD.102' src/data/version/mozc_version_template.bzl | source /dev/stdin)
  printf "%s.g%s" "${_bzr_ver}" "${_mozc_commit}"
}

prepare() {
  cd "$srcdir/mozc"
  git submodule init
  git config submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
  git config submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git config submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git -c protocol.file.allow=always submodule update

  cd src
  # Generate zip code seed
  echo "Generating zip code seed..."
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo "Done."

  # disable fcitx5 target
  rm unix/fcitx5/fcitx5.gyp
  
  ## use libstdc++ instead of libc++
  sed "/stdlib=libc++/d;/-lc++/d" -i gyp/common.gypi

  # Fix build with python 3.10
  cd third_party/gyp
  git cherry-pick -n bc83cdacf5428ab6ddcc92fd0b0fc494cc9a4d4f

  # Fix build with GCC 11
  cd ../abseil-cpp
  git checkout 5bf048b8425cc0a342e4647932de19e25ffd6ad7
  git cherry-pick -n 36a4b073f1e7e02ed7d1ac140767e36f82f09b7c
}

build() {
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"
  export _bldtype

  cd mozc/src

  _targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx/fcitx.gyp:fcitx-mozc"

  QTDIR=/usr GYP_DEFINES="document_dir=/usr/share/licenses/$pkgname use_libzinnia=1 enable_gtk_renderer=0" python build_mozc.py gyp
  python build_mozc.py build -c $_bldtype $_targets
  #../scripts/build

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

package() {
  cd mozc/src
  export PREFIX="${pkgdir}/usr"
  export _bldtype
  ../scripts/install_server

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -d "${PREFIX}/share/fcitx/addon"
  install -d "${PREFIX}/share/fcitx/inputmethod"
  install -d "${PREFIX}/lib/fcitx"
  ../scripts/install_fcitx
}
