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
_mozc_commit=4b2a3ece51a37e67bafa93bdfe7a64fee43163ee

# Ut Dictionary
_utdicdate=20230115
_dict=(
#       place-names
#       alt-cannadic
#       edict2
#       jawiki
       neologd
#       personal-names
#       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20230711

pkgbase=mozc-with-jp-dict
pkgname=("ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5220.102
pkgrel=2
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('qt6-base' 'fcitx5' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'gtk2' 'mesa' 'subversion' 'clang' 'ibus' 'ruby' 'ruby-parallel')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        "https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        "https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        #"https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/small_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        "LICENSE-SudachiDict::https://github.com/WorksApplications/SudachiDict/raw/develop/LEGAL"
        "LICENSE-ipadic-neologd::https://github.com/neologd/mecab-ipadic-neologd/raw/master/COPYING"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

for dict in "${_dict[@]}"; do
  source+=( "https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.tar.bz2" )
  source+=( "LICENSE-${dict}::https://github.com/phoepsilonix/mozcdic-ut-${dict}/raw/main/LICENSE" )
done
sha512sums=('SKIP'
            'SKIP'
            'fa7f9e210d8afaf11b0ea72e1d05b3649b299a1342903b595928f2bb373c7d3f078f002487669b004d4b3105e7ad9b13099ca10d18ef3a5f7d837cf2e9a94a4f'
            'b1fc978c332957cbd4be873809d8c7c08d48922a05f60d90893e534d5626f357069300c163010346ef7e93aecd8a206b272b33a12ac76fe94d4c201acf491b0d'
            'e55cbac056c14f9c3e62e250860b5372d5d78deebf29da2024187f517b544085a0bb454ebc5bfce19a43385d350932867f8b084c433aa0224e01e2c02efd5a08'
            'd27e65cd76f0047875e11eb7c2e270ce8c27ccd4b66b4546c684a74f22fdbaf76aa26033dacdb0547dde4f292dd618c8d5377e4185ab3548b5d7609383d86f96'
            '63fc0c2508ada87949a7f77e7974dbdd0c371d8b64ac9002be872b0524d5f866448ee22304bbc1980e7ae207903933f6e047ca5a7d409992cb9fbc77ba9e1a3c'
            '1a5b62c83a08781b44bd73f978a4024d93667df47b1a3f4c179096cbc32f28e803c50dca6b5b7ad20fb788d46797551c36ec1efb7782f4361b695e2e0a6060ca'
            '77a8c1d76a53627f8680f761f9c996b04e6b609bdb813cb5aedc7f8214d9b5f13aea53788814029f6f1e263c50ecb58feb5999e95d51fe7e4707b6a913d4bbe4'
            '8e32c97b62257d953bbc1e7cd15821df8a7c13eb97f0b9cdf569d9f474a58f9870c159bdd8fece581d0e9c57c399436604b493eb78b35f0edeff9dcc90c5be69'
            'ef2dd0a27b09ca3a68aa7a3ad45b3720d57efd0505e631fa643e7aea98455c1114760f9aa5e91701bb5c118ae3074719709eeed55010b305d861464ad1b51c3a')

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

  # nm -f posix
  sed 's|nm \-f p |nm -f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py
}

build() {
  cd "$srcdir/mozc/src" || exit
  echo 'Generating zip code seed...'
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/KEN_ALL.CSV" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo 'Done.'

  # UT Dictionary steps, rewrite of `sh make.sh`
  # UT辞書を結合
  msg '1. Append dictionaries'
  for dict in "${_dict[@]}"; do
    cat "$srcdir/mozcdic-ut-${dict}.txt" >> ${srcdir}/mozcdict-ext/mozcdic-ut.txt
  done

  # gem parallel
  [[ "$GEM_HOME"=="" ]] && GEM_HOME="/usr/lib/ruby/gems/3.0.0/"

  cd "${srcdir}/mozcdict-ext/" || exit
  # すだちを優先
  msg '2. Run the ruby scripts as in original sudachi.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  cd sudachi || exit
  ruby sudachi.rb -E -f ${srcdir}/small_lex.csv -f ${srcdir}/core_lex.csv -f ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > ../all-dict.txt
  cd ..

  #cd neologd || exit
  #msg '3. Run the ruby scripts as in original neologd.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  #xz -k -d -c ${srcdir}/mecab-ipadit-neologd/upstream/seed/mecab-*.xz > user-dict-seed.csv
  #ruby neologd.rb -E -f user-dict-seed.csv >> ../all-dict.txt
  #cd ..

  # ut-dictionarys
  msg '3. Run the ruby scripts as in original utdict.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby utdict/utdict.rb -E -f mozcdic-ut.txt -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt

  msg '4. Run the ruby scripts as uniqword.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt  2> duplicated.txt
  #cat ut-dict.txt >> finish-dict.txt

  msg '5. Finally add UT dictionary to mozc source'
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
  bazel build -c opt --copt=-fPIC  --config oss_linux package unix/fcitx5:fcitx5-mozc.so
  bazel shutdown

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
  install -D -m 644 third_party/ipa_font/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/ipa_font/LICENSE"
  install -D -m 644 third_party/japanese_usage_dictionary/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/japanese_usage_dictionary/LICENSE"
  install -D -m 644 third_party/protobuf/third_party/jsoncpp/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/jsoncpp/LICENSE"
  install -D -m 644 third_party/protobuf/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/prptobuf/LICENSE"
  install -D -m 644 third_party/wtl/LICENSE "$pkgdir/usr/share/licenses/$pkgname/third_party/wtl/LICENSE"
  for dict in "${_dict[@]}"; do
    install -D -m 644 "$srcdir/LICENSE-${dict}" "$pkgdir/usr/share/licenses/$pkgname/data/dictionary_oss/"
  done
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
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' "qt6-base")
  replaces=('ibus-mozc' "${pkgbase}-common")
  conflicts=('ibus-mozc' "$pkgbase-common" 'fcitx' 'fcitx-configtool' 'fcitx-qt5' 'fcitx-qt6' 'fcitx-mozc' 'fcitx5' 'fcitx5-configtool' 'fcitx5-qt' 'fcitx5-mozc' fcitx5-mozc-with-jp-dict fcitx-mozc-with-jp-dict)

  install_mozc-with-jp-dict-common
  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer      "${pkgdir}/usr/lib/mozc/mozc_renderer"
  
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"

  cd bazel-bin/unix || exit
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

