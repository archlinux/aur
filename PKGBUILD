# Maintainer: Masaki Haruka <yek@reasonset.net>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype=Release
#_mozc_commit=2edd09333c097a7dec05798c1b0b9310ee68b18f
_mozc_commit=2edd0933

## follow the submodule commits in https://github.com/fcitx/mozc/tree/fcitx/src/third_party
_abseil_cpp_commit=8c0b94e793a66495e0b1f34a5eb26bd7dc672db0
_breakpad_commit=216cea7bca53fa441a3ee0d0f5fd339a3a894224
_gtest_commit=58d77fa8070e8cec2dc1ed015d66b454c8d78850
_gyp_commit=9ecf45e37677743503342ee4c6a76eaee80e4a7f
_japanese_usage_dictionary_commit=e5b3425575734c323e1d947009dd74709437b684
_jsoncpp_commit=11086dd6a7eba04289944367ca82cea71299ed70
_protobuf_commit=cc7b1b53234cd7a8f50d90ac3933b240dcf4cd97
_dictext_commit=27f9d25a84bc2b7c130a6b98e55ae51ef286a91a

## the latest release from https://osdn.net/projects/ponsfoot-aur/storage/mozc/
_zipcode_rel=202110


## the latest release from https://osdn.net/projects/ponsfoot-aur/storage/mozc/
_zipcode_rel=202110

_pkgbase=mozc
pkgname=fcitx5-mozc-ext-neologd-git
pkgdesc="Fcitx5 Module of Mozc (Google Japanese Input OSS) with external generated dictionaries (NEologd and Sudachi.)"
pkgver=2.28.5029.102.g2edd0933
pkgrel=2
arch=('x86_64')
url="https://github.com/google/mozc"
license=('custom')
depends=('qt5-base' 'fcitx5' 'hicolor-icon-theme')
makedepends=('pkg-config' 'python' 'curl' 'gtk2' 'mesa' 'subversion' 'bazel' 'git' 'clang' 'python-six' 'zsh' 'ruby' 'xz')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx-mozc' 
            'fcitx5-mozc-ut' 'fcitx-mozc-neologd-ut' 'fcitx-mozc-ut-unified' 'fcitx-mozc-ut-unified-full' 'fcitx5-mozc' 'fcitx5-mozc-ext-neologd')
source=(git+https://github.com/fcitx/mozc.git#commit=${_mozc_commit}
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip
        https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip
        git+https://chromium.googlesource.com/breakpad/breakpad#commit=${_breakpad_commit}
        git+https://github.com/google/googletest.git#commit=${_gtest_commit}
        git+https://chromium.googlesource.com/external/gyp#commit=${_gyp_commit}
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${_japanese_usage_dictionary_commit}
        git+https://github.com/open-source-parsers/jsoncpp.git#commit=${_jsoncpp_commit}
        git+https://github.com/google/protobuf.git#commit=${_protobuf_commit}
        git+https://github.com/abseil/abseil-cpp.git#commit=${_abseil_cpp_commit}
        git+https://github.com/phoepsilonix/mozcdict-ext.git#commit=${_dictext_commit}
	)
sha512sums=('SKIP'
            '606f45d48a9dad0e80a566cab0001910de3c6b2f634ec52c6ef6f44745b55ae8e181b3e3cdf90525a08be1f180eb35900672c90c6ab4f43679a178e863378bbc'
            'dec6479b42ddc1355cd882d17824cd874d8f103ad7767bac3f490f04551059d65b2806fa9e3f39a50ced2ecfdd37b75c9ed4536d9ad3bcef9e8c5ae1ec10e302'
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

  # Include NEologd
  sudo choom -n -1000 -p $$
  cd "$srcdir/mozcdict-ext"
  echo "Generating extra dictionaries..."
  (
    cd neologd
    MOZC_ID_FILE="$srcdir/mozc/src/data/dictionary_oss/id.def" zsh mkdict.zsh
    cd ../sudachi
    MOZC_ID_FILE="$srcdir/mozc/src/data/dictionary_oss/id.def" zsh mkdict.zsh
  ) | ruby .dev.utils/uniqword.rb 2> /dev/null >> "$srcdir/mozc/src/data/dictionary_oss/dictionary09.txt"

  cd "$srcdir/mozc"
  cd src

  # disable fcitx4 target
  rm unix/fcitx/fcitx.gyp
  
  # disable android-ndk requirement, even if we don't need it bazel will complain
  sed "/android_ndk_repository/d" -i WORKSPACE.bazel

  # adjust QT_BASE_PATH
  sed 's|path = QT_BASE_PATH|path = "/usr/include/qt"|' -i WORKSPACE.bazel

  # Fix @bazel_tools//platforms to @platforms//os
#  sed 's$@bazel_tools//platforms:(linux|osx|windows|android|freebsd|ios|os)$@platforms//os:\1$' -E -i tools/cc_target_os/BUILD.bazel third_party/gtest/BUILD.bazel
}


build() {
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  sudo choom -n -1000 -p $$
  cd mozc/src

  QT_BASE_PATH=/usr/include/qt ../scripts/build_fcitx5_bazel

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
