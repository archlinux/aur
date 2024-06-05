# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Masato TOYOSHIMA <phoepsolonix at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: BrLi <brli at chakralinux dot org>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## Mozc compile option
_bldtype=Release
_mozc_commit=673563f654abe25007c27ee76f7b3fdee8414fe2
_mozcdict_ext_commit=de931271344ebb2d1349a7ae0a8ec883457ed930
_branch=fcitx
# Sudachi Dictionary
_sudachidict_date=20240409

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.30.5448.102
pkgrel=14
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND LGPL-3.0-only AND MIT AND NAIST-2003')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'clang' 'ibus' 'rustup')
options=(!lto)
source=("git+$url.git#commit=${_mozc_commit}"
        https://github.com/fcitx/mozc/pull/61.patch
        git+https://github.com/phoepsilonix/mozcdict-ext.git#commit=${_mozcdict_ext_commit}
        #"https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        #"https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

sha512sums=('dde802343204f267064b064c0c115bf5c3b2385c27f85a0f3ca9fcdaaf3b9654f28bed5b296f1e7440186a01a29368bb09f786c7ba363e58c6e7ea28820dd442'
            '9f88e7926a8db772856049c3e8d8066ca5e663d46817f432b042d212aa4ab20ed660ab9da9fed181c80116f6900602f753f7c55e9894b69964b0a2fb7518b830'
            'fcde4a3c0200969ebb21fa927f1ff59581386a39d83ea7ec5c0092e1566c38638129b71b286434e11fb4c6b76b48d6b36eb64b053306c2bbb8a7900e2c641558'
            'a293c3c9b544acd49bec4809e0c7c8c6849afe5d09d19ffeb094983e10e5dddbc780aefa6bcae48b4ee586549a88a5c1fa9f244d1ce1f4e5effc2f8d6c806ce6'
            '68eff02c9349a3058b693fe5be4ef9f388f29a286c56ec050301ca2ecb89ed80f392a0b7b36b603dffc988de97b7150eb32b1e77d5b06fbf4d52be50e683b851'
            '299cd8fed5ab08eb2985e0a6f487b8dd99026950a926774c954c4daa369f82fad8117d70db549361f60e926aa2776d8e3202587f055abe5700038c704c820cbe'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git submodule update --init --recursive

  # pr
  patch -p1 -i ${srcdir}/61.patch

  cd src || exit

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix (llvm-nm -f posix)
  sed 's|nm \(.*\)\-f p |nm \1-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py

  # mozc date and version
  #_date=$(git log -1 --pretty=format:'%as' $_mozc_commit)
  #sed -i -e "/2.25.4150.102.1/d"  -e "s/2.26.4220.106.1/${pkgver}.${pkgrel}/" -e "s/2021-01-16/${_date}/" src/unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in
  rustup update stable

  cd "${srcdir}/mozcdict-ext/" || exit
  # すだちを優先
  msg '1. Build the rust program(mozcdict-ext), it may take some time...'
  cd sudachi || exit
  rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n) | grep musl && TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep musl|head -n1) || TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep -v musl|head -n1)
  unset RUSTC
  cargo +stable build --release --target $TARGET
  msg '2. Convert SudachiDict to Mozc System Dictionary format. It may take some time...'
  cat ${srcdir}/small_lex.csv ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv > all.csv
  cp ${srcdir}/mozc/src/data/dictionary_oss/id.def ./
  ./target/$TARGET/release/dict-to-mozc -s -i ./id.def -f all.csv > ../all-dict.txt
  cd ..

  msg '3. Duplicate data will be removed.'
  awk -f sudachi/dup.awk all-dict.txt > finish-dict.txt

  msg '4. Finally, add the SudachiDict dictionary to the Mozc source.'
  cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync
}

build() {
  cd "$srcdir/mozc/src" || exit

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  # ibus emacs_helper mozc_server fcitx5
  BAZEL_COPTS=""
  BAZEL_CXXOPTS=""
  for f in $CFLAGS;do ([[ ! $f =~ _FORTIFY_SOURCE ]]) && BAZEL_COPTS+=" --copt $f";done
  for f in $CXXFLAGS;do ([[ ! $f =~ _FORTIFY_SOURCE ]]) && BAZEL_CXXOPTS+=" --cxxopt $f";done
  #BAZEL_COPTS=$(echo $CFLAGS | xargs -n1 echo "--copt")
  #BAZEL_CXXOPTS=$(echo $CXXFLAGS | xargs -n1 echo "--cxxopt")
  #bazel clean
  if [[ $CC =~ gcc ]];then
    bazel build --config oss_linux --compilation_mode opt package unix/fcitx5:fcitx5-mozc.so --cxxopt=-Wno-uninitialized --host_cxxopt=-Wno-uninitialized
    #bazel build --config oss_linux --compilation_mode opt package unix/fcitx5:fcitx5-mozc.so --linkopt "$LDFLAGS" $BAZEL_COPTS $BAZEL_CXXOPTS
  else
    bazel build --config oss_linux --compilation_mode opt package unix/fcitx5:fcitx5-mozc.so --linkopt "$LDFLAGS" $BAZEL_COPTS $BAZEL_CXXOPTS
  fi
  bazel shutdown

  # mozc fcitx5 version
  #git fetch origin master:remotes/origin/master
  #source bazel-bin/base/mozc_version.txt && export pkgver="$(printf "%s.%s.%s.%s" "${MAJOR}" "${MINOR}" "${BUILD_OSS}" "${REVISION}")" && sed -e "/2.26.4220.106.1/d" -e "/2.25.4150.102.1/d"  -e "s/release version=\".*\"/release version=\"$pkgver.1\" date=\"$(git log -1 --pretty=format:'%as' -b origin/master)\"/" -i unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
  head -n 50 data/unicode/JIS0201.TXT > LICENSE.JIS0201
  head -n 73 data/unicode/JIS0208.TXT > LICENSE.JIS0208
  head -n 22 data/unicode/jisx0213-2004-std.txt > LICENSE.jisx0213-2004-std
}

install_mozc-with-jp-dict-common() {
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE LICENSE.* data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m 644 data/dictionary_oss/README.txt "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/LICENSE"
  install -D -m 644 third_party/abseil-cpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/abseil-cpp/LICENSE"
  install -D -m 644 third_party/breakpad/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/breakpad/LICENSE"
  install -D -m 644 third_party/gtest/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/gtest/LICENSE"
  install -D -m 644 third_party/gyp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/gyp/LICENSE"
  #install -D -m 644 third_party/ipa_font/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/ipa_font/LICENSE"
  install -D -m 644 third_party/japanese_usage_dictionary/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/japanese_usage_dictionary/LICENSE"
  install -D -m 644 third_party/protobuf/third_party/jsoncpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/jsoncpp/LICENSE"
  install -D -m 644 third_party/protobuf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/prptobuf/LICENSE"
  #for dict in "${_dict[@]}"; do
  #  install -D -m 644 "$srcdir/LICENSE-${dict}" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  #done
  install -D -m 644 "$srcdir/LICENSE-SudachiDict" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  ../scripts/install_server_bazel
}

package_fcitx5-mozc-with-jp-dict() {
  pkgdesc="Fcitx5 module for Mozc with UT dictionary"
  depends=('fcitx5' 'fcitx5-qt' 'hicolor-icon-theme' gcc-libs glibc qt6-base)
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc' "${pkgbase}-common")
  conflicts=('fcitx-mozc' 'fcitx5-mozc' "${pkgbase}-common" 'fcitx' 'fcitx-qt5' 'fcitx-qt6' 'ibus-mozc' 'ibus-mozc-with-jp-dict' 'fcitx-mozc-with-jp-dict')

  install_mozc-with-jp-dict-common
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd ${srcdir}/mozc/src || exit

  ../scripts/install_fcitx5_bazel
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' "qt6-base" 'libibus')
  replaces=('ibus-mozc' "${pkgbase}-common")
  conflicts=('ibus-mozc' "$pkgbase-common" 'fcitx' 'fcitx-configtool' 'fcitx-qt5' 'fcitx-qt6' 'fcitx-mozc' 'fcitx5' 'fcitx5-configtool' 'fcitx5-qt' 'fcitx5-mozc' fcitx5-mozc-with-jp-dict fcitx-mozc-with-jp-dict)

  install_mozc-with-jp-dict-common
  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  sed -i -e "s|0\.0\.0\.0|${pkgver}|g" bazel-bin/unix/ibus/mozc.xml
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"

  cd bazel-bin/unix || exit
  unzip -o icons.zip -d tmp
  cd tmp || exit
  install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
  find . -type f | xargs -I{} install -Dm644 "{}" "${pkgdir}/usr/share/ibus-mozc/{}"
}

package_emacs-mozc-with-jp-dict() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  license=('BSD-3-Clause')
  depends=(gcc-libs "emacs")
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}

