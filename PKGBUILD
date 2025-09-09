# Maintainer: Masaki Haruka <yek@reasonset.net>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype=Release
_mozc_commit=d3f511d1

_abseil_cpp_commit=26c9126
_breakpad_commit=9ee62f8
_gtest_commit=7917641
_gyp_commit=1615ec3
_japanese_usage_dictionary_commit=38d3462
_jsoncpp_commit=ca98c98
_protobuf_commit=4fbd1111
_dictext_commit=574160e
_neologd_commit=abc61e3

_pkgbase=mozc
pkgname=fcitx5-mozc-ext-neologd
pkgdesc="Fcitx5 Module of Mozc (Google Japanese Input OSS) with external generated dictionaries (NEologd and Sudachi.)"
pkgver=2.31.5851.102.gd3f511d1
pkgrel=1
arch=('x86_64')
url="https://github.com/google/mozc"
license=('custom')
depends=('qt6-base' 'fcitx5')
makedepends=('pkg-config' 'python' 'curl' 'gtk2' 'mesa' 'subversion' 'bazel' 'git' 'clang' 'python-six' 'zsh' 'ruby' 'xz')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx-mozc' 'fcitx5-mozc-ut' 'fcitx5-mozc-ut-full' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-ut-unified' 'fcitx-mozc-ut-unified-full' 'fcitx5-mozc')
provides=('fcitx5-mozc=2.30.5490.102')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip
        https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip
        git+https://chromium.googlesource.com/breakpad/breakpad#commit=${_breakpad_commit}
        git+https://github.com/google/googletest.git#commit=${_gtest_commit}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_commit}
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}
        git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_commit}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_commit}
        git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}
        git+https://github.com/reasonset/mozcdict-ext.git#commit=${_dictext_commit}
        git+https://github.com/neologd/mecab-ipadic-neologd.git#commit=${_neologd_commit}
	)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
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
  _bzr_ver=$(sed 's/ //g;$ a echo $MAJOR.$MINOR.$BUILD_OSS.102' src/data/version/mozc_version_template.bzl | source /dev/stdin)
  printf "%s.g%s" "${_bzr_ver}" "${_mozc_commit}"
}

prepare() {
  cd "$srcdir/mozc"
  git config protocol.file.allow always
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
  
  # Reset dictionary09
  git checkout data/dictionary_oss/dictionary09.txt
  
  # Generate zip code seed
  echo "Generating zip code seed..."
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/KEN_ALL.CSV" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo "Done."

  # Include NEologd
  cd "$srcdir/mozcdict-ext"

  git submodule init
  git config submodule.neologd/upstream.url "$srcdir/mecab-ipadic-neologd"
  git -c protocol.file.allow=always submodule update

  echo "Generating extra dictionaries..."
  (
    (
      cd neologd
      MOZC_ID_FILE="$srcdir/mozc/src/data/dictionary_oss/id.def" zsh mkdict.zsh
    )
    (
      cd sudachi
      MOZC_ID_FILE="$srcdir/mozc/src/data/dictionary_oss/id.def" zsh mkdict.zsh
    )
    (
      cd byhand
      MOZC_ID_FILE="$srcdir/mozc/src/data/dictionary_oss/id.def" zsh mkdict.zsh
    )
  ) | ruby .dev.utils/uniqword.rb 2> /dev/null >> "$srcdir/mozc/src/data/dictionary_oss/dictionary09.txt"
  echo "Done."

  cd "$srcdir/mozc"
  cd src

  # disable fcitx4 target
  rm unix/fcitx/fcitx.gyp
  
  # Fix @bazel_tools//platforms to @platforms//os
  sed 's$@bazel_tools//platforms:(linux|osx|windows|android|freebsd|ios|os)$@platforms//os:\1$' -E -i third_party/gtest/BUILD.bazel
}


build() {
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd mozc/src

  QT_BASE_PATH="$(pkg-config --variable=prefix Qt6Core)/include/qt6" ../scripts/build_fcitx5_bazel

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

package() {
  cd mozc/src
  export PREFIX="${pkgdir}/usr"
  export _bldtype
  ../scripts/install_server_bazel

  install -d "${pkgdir}/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -d "${PREFIX}/share/fcitx5/addon"
  install -d "${PREFIX}/share/fcitx5/inputmethod"
  install -d "${PREFIX}/lib/fcitx5"
  ../scripts/install_fcitx5_bazel
}
