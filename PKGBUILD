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
_mozc_commit=0cbb8f18e8df5eb4e110bab850cebc1f57811f16
_bcr_commit=78837d290757ac27b73013147c515623ff9196c4
_dict_to_mozc_commit=a78381248ae539db22f62ca0af6c10b9035e5dab
_branch=fcitx
# Sudachi Dictionary
_sudachidict_date=20240716

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.30.5618.102
pkgrel=2
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND LGPL-3.0-only AND MIT AND NAIST-2003')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'clang' 'ibus' 'rustup')
options=(!lto)
source=("git+$url.git#commit=${_mozc_commit}"
        "bcr::git+https://github.com/bazelbuild/bazel-central-registry.git#commit=${_bcr_commit}"
        https://github.com/fcitx/mozc/pull/61.patch
        git+https://github.com/phoepsilonix/dict-to-mozc.git#commit=${_dict_to_mozc_commit}
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        )

sha512sums=('20335ac48f9719143e9c647613a3a8da4e5110bf367d9333f9389f1a456c7340e179a790eec2dadc63f7b428fdd7d52778bd522b809ddd77da49b4d8c0360b55'
            'cbff7e417918d9827ac7399bdf8389bc9eb862db52785fd35a4e4dea210c13925b6ca0b3b5a9079fd14bb0f9e0342f6c097c6934fbf7f1d71a3d044aa6a88ff0'
            'a0aeb2856d62c71d0c137a687d901098eaa3371b896dbe39e54c36951cbd7d3cfba666ee96d055dba7e8c8384ed17e13597a697707cd960fac320e11f9b7b76c'
            'dd015c0e578bccc715d19e1a6346dd115b430874e410b5357c7754a277942f58f627228f86c55209402898524a6b8722cbecab92e98469b975be1e59b6be3122'
            '9428d55d2d9603c8bfcd12cc0184415f23af1d09a2d0ebdf0cce694a09638e7cfe0c1241bf1c943427b2fccfea619ca8b2e22db3452d837b416eb31aa224e766'
            'f0a3544dcc99bf8c4cea8ebfd31af827e209f0678997ab55f6eda54f34cad5e148d1bd156417a621665c2068e7371801dc9cf1baa34f2270a99da7055f46d95d'
            '5551cbf4da52bc2eb73841013f98634ac8fcb56e5f6e163c9e640d5b9eaa4eafc2fa72cc20660db012ebdb438f835c2098b77c02c483d3244df901748e3d30fa'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git submodule update --init --recursive

  # PR(pull request)
  patch -p1 -i ${srcdir}/61.patch

  cd src || exit

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix (llvm-nm -f posix)
  sed 's|nm \(.*\)\-f p |nm \1-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py

  # disable warning of ANDROID_NDK_HOME.
  sed -e '/register_toolchains("@androidndk\/\/:all")/d' -i MODULE.bazel

  rustup update stable
  cd "${srcdir}/dict-to-mozc/" || exit
  # すだちを優先
  msg '1. Build the rust program(mozcdict-ext), it may take some time...'
  rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n) | grep -v musl && TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep -v musl|head -n1) || TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep musl|head -n1)
  unset RUSTC
  cargo build --release --target $TARGET
  msg '2. Convert SudachiDict to Mozc System Dictionary format. It may take some time...'
  cat ${srcdir}/small_lex.csv ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv > all.csv
  cp ${srcdir}/mozc/src/data/dictionary_oss/id.def ./
  ./target/$TARGET/release/dict-to-mozc -s -i ./id.def -f all.csv > all-dict.txt

  msg '3. Finally, add the SudachiDict dictionary to the Mozc source.'
  cat all-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
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
  BAZEL_LDOPTS=$(echo $LDFLAGS | xargs -n1 echo "--linkopt")
  BAZEL_COPTS=$(echo $CFLAGS | xargs -n1 echo "--copt")
  BAZEL_CXXOPTS=$(echo $CXXFLAGS | xargs -n1 echo "--cxxopt")
  
  # The bazel rules have changed, so the cache will be deleted.
  #bazel clean --expunge

  if [[ $CC =~ gcc ]];then
    bazel build --registry=file://$srcdir/bcr --config oss_linux --config release_build package unix/fcitx5:fcitx5-mozc.so --cxxopt=-Wno-uninitialized --host_cxxopt=-Wno-uninitialized
  else
    bazel build --registry=file://$srcdir/bcr --config oss_linux --config release_build package unix/fcitx5:fcitx5-mozc.so $BAZEL_LDOPTS $BAZEL_COPTS $BAZEL_CXXOPTS
  fi
  bazel shutdown
}

install_mozc-with-jp-dict-common() {
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

# Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
  head -n 50 data/unicode/JIS0201.TXT > LICENSE.JIS0201
  head -n 73 data/unicode/JIS0208.TXT > LICENSE.JIS0208
  head -n 22 data/unicode/jisx0213-2004-std.txt > LICENSE.jisx0213-2004-std

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
  install -D -m 644 third_party/protobuf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/protobuf/LICENSE"
  install -D -m 644 "$srcdir/LICENSE-SudachiDict" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  ../scripts/install_server_bazel
}

package_fcitx5-mozc-with-jp-dict() {
  pkgdesc="Fcitx5 module for Mozc with SudachiDict dictionary"
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
  pkgdesc="IBus engine module for Mozc with SudachiDict dictionary"
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
  pkgdesc="Emacs engine module for Mozc with SudachiDict dictionary"
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

