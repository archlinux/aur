# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Masato TOYOSHIMA <phoepsolonix at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: BrLi <brli at chakralinux dot org>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>

## The UT dictionary's project page: http://linuxplayers.g1.xrea.com/mozc-ut.html

## Mozc compile option
_bldtype=Release
_mozc_commit=4b1510bddfcb572ef72c5ac21a51a4881a5859b3
_branch=fcitx
# Ut Dictionary
_utdicdate=20230115
_dict=(
#       place-names
#       alt-cannadic
#       edict2
#       jawiki
#       neologd
#       personal-names
#       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20240109

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5346.102
pkgrel=2
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('qt6-base' 'fcitx5' 'fcitx5-qt' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'clang' 'ibus' 'rustup')
options=(!lto)
source=("git+$url.git#commit=${_mozc_commit}"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        #"https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        #"https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        #"https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "https://github.com/neologd/mecab-ipadic-neologd/raw/master/seed/mecab-user-dict-seed.20200910.csv.xz"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        "LICENSE-ipadic-neologd::https://github.com/neologd/mecab-ipadic-neologd/raw/master/COPYING"
        "0001-Zombie-Process-Prevention.patch"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

#for dict in "${_dict[@]}"; do
#  source+=( "https://github.com/phoepsilonix/mozcdic-ut-${dict}/releases/download/latest/mozcdic-ut-${dict}.txt.tar.bz2")
#  source+=( "LICENSE-${dict}::https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/LICENSE" )
#done
sha512sums=('SKIP'
            'SKIP'
            'cb7d135af2eb7f759126071c042dda89f094710ed7228f129e0b2350d11903768c4f5c4b2c0ca7748fb6e2c9e442c3cc353687c1c6dbe98ee21056ef83751d3f'
            '8b51b783c60987d74d896ba4668987b69a4f83b7b294f2630b25a0adf2ca665b89ebf4e000ce5de9a343aa9929d0b120478f7820a31ab1718d1fcafd58460286'
            '8efaeeb103cfd14abbc8e27ca4c6313d68e800421f452701ff1771b09f32944cd14bfc4bd2fe75ebb3b851b4baba15ebd70b7b2cceae68a621eadbaa9d351bf5'
            '391bf23f4163f5d40abef49ac7ee3e856a0f06f83adde13c5709e86480be93d4087ca72d244dd57a8bf45e881958a96f59b55c695671aa59a3eb15532ecb9ce1'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '77a8c1d76a53627f8680f761f9c996b04e6b609bdb813cb5aedc7f8214d9b5f13aea53788814029f6f1e263c50ecb58feb5999e95d51fe7e4707b6a913d4bbe4'
            '4dc9fc2d95e23729381bfe12fe6544ec3ea5729114e6d0539af93f5cd1e5a0a4d3196bfcf07c67aec0b19a25b92bf3c65c5e3805415bf81b5d13f537fa4f2c0d')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git submodule update --init --recursive

  cd src || exit

  # disable fcitx4 target
  #rm unix/fcitx/fcitx.gyp

  # disable emace gyp target
  #rm unix/emacs/emacs.gyp
  #rm gyp/tests.gyp

  # fix mozc icon for kimpanel
  #sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix (llvm-nm -f posix)
  sed 's|nm \(.*\)\-f p |nm \1-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py

  # zombie process prevention for mozc_tool
  cd "$srcdir/mozc" || exit
  patch -p1 -i ${srcdir}/0001-Zombie-Process-Prevention.patch

  # mozc date and version
  #_date=$(git log -1 --pretty=format:'%as' $_mozc_commit)
  #sed -i -e "/2.25.4150.102.1/d"  -e "s/2.26.4220.106.1/${pkgver}.${pkgrel}/" -e "s/2021-01-16/${_date}/" src/unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in
  rustup update stable
}

build() {
  cd "$srcdir/mozc/src" || exit

  # no need. zip code is included with bazel build.
  #echo 'Generating zip code seed...'
  #PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/KEN_ALL.CSV" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  #echo 'Done.'
  # UT Dictionary steps, rewrite of "sh make.sh"
  # UT辞書を結合
  #msg '1. Append dictionaries'
  #for dict in "${_dict[@]}"; do
  #  cat "$srcdir/mozcdic-ut-${dict}.txt" >> ${srcdir}/mozcdict-ext/mozcdic-ut.txt
  #done

  # gem parallel
  #[[ "$GEM_HOME"=="" ]] && GEM_HOME="/usr/lib/ruby/gems/3.0.0/"

  cd "${srcdir}/mozcdict-ext/" || exit
  # すだちを優先
  msg '1. Build the rust program(mozcdict-ext), it may take some time...'
  cd sudachi || exit
  rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n) | grep musl && TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep musl|head -n1) || TARGET=$(rustup target list --installed | grep $(rustc -vV | sed -e 's|host: ||' -e 's|-gnu||p' -n)|grep -v musl|head -n1)
  cargo build --release --target $TARGET
  msg '2. Run the rust program(mozcdict-ext): SudachiDict , it may take some time...'
  cat ${srcdir}/small_lex.csv ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv > all.csv
  cp ${srcdir}/mozc/src/data/dictionary_oss/id.def ./
  ./target/$TARGET/release/dict-to-mozc -s -i ./id.def -f all.csv > ../all-dict.txt
  #ruby sudachi.rb -E -f ${srcdir}/small_lex.csv -f ${srcdir}/core_lex.csv -f ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > ../all-dict2.txt
  cd ..

  # added dicts.txt
  #cat ${srcdir}/dicts.txt >> all-dict.txt
  #cd neologd || exit
  #msg '3. Run the ruby scripts as in original neologd.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  #xz -k -d -c ${srcdir}/mecab-ipadit-neologd/upstream/seed/mecab-*.xz > user-dict-seed.csv
  #ruby neologd.rb -E -f user-dict-seed.csv >> ../all-dict.txt
  #cd ..

  # ut-dictionarys
  msg '3. Run the rust program(mozcdict-ext): mecab-ipadic-neologd , it may take some time...'
  cd sudachi || exit
  ./target/$TARGET/release/dict-to-mozc -n -i ./id.def -f ../../mecab-user-dict-seed.20200910.csv >> ../all-dict.txt
  cd ..
  #ruby utdict/utdict.rb -E -f mozcdic-ut.txt -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict2.txt

  msg '5. Run the awk scripts in dup.awk, it may take some time...'
  awk -f sudachi/dup.awk all-dict.txt > finish-dict.txt
  #ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt  2> duplicated.txt
  #cat ut-dict.txt >> finish-dict.txt

  msg '6. Finally add UT dictionary to mozc source'
  cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  #export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  #export QT_BASE_PATH=/usr/include/qt

  # fcitx5
#  GYP_DEFINES="use_fcitx=0 use_libibus=0" ../scripts/configure
#  TARGETS="gui/gui.gyp:mozc_tool unix/fcitx5/fcitx5.gyp:fcitx5-mozc"
#  python build_mozc.py build ${TARGETS} -c ${_bldtype}

  # ibus emacs_helper mozc_server fcitx5
  a=0;for f in $CFLAGS;do ([[ ($f =~ _FORTIFY_SOURCE) && $a != 1 ]] || [[ ! $f =~ _FORTIFY_SOURCE ]]) && BAZEL_COPTS+="--copt $f "; [[ $f =~ _FORTIFY_SOURCE ]] && a=1  ;done
  a=0;for f in $CXXFLAGS;do ([[ ($f =~ _FORTIFY_SOURCE) && $a != 1 ]] || [[ ! $f =~ _FORTIFY_SOURCE ]]) && BAZEL_CXXOPTS+="--cxxopt $f "; [[ $f =~ _FORTIFY_SOURCE ]] && a=1  ;done
  #BAZEL_COPTS=$(echo $CFLAGS | xargs -n1 echo "--copt")
  #BAZEL_CXXOPTS=$(echo $CXXFLAGS | xargs -n1 echo "--cxxopt")
  bazel build --config oss_linux --compilation_mode opt package unix/fcitx5:fcitx5-mozc.so --linkopt "$LDFLAGS" $BAZEL_COPTS $BAZEL_CXXOPTS
  bazel shutdown

  # mozc fcitx5 version
  git fetch origin master:remotes/origin/master
  source bazel-bin/base/mozc_version.txt && export pkgver="$(printf "%s.%s.%s.%s" "${MAJOR}" "${MINOR}" "${BUILD_OSS}" "${REVISION}")" && sed -e "/2.26.4220.106.1/d" -e "/2.25.4150.102.1/d"  -e "s/release version=\".*\"/release version=\"$pkgver.1\" date=\"$(git log -1 --pretty=format:'%as' -b origin/master)\"/" -i unix/fcitx5/org.fcitx.Fcitx5.Addon.Mozc.metainfo.xml.in

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
  install -D -m 644 third_party/wtl/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/wtl/LICENSE"
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
  #../scripts/install_fcitx5
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

