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
_mozc_commit=54fbea34c12cf4b6c859c9b361be02ec96a07de9

# Ut Dictionary
_utdicdate=20230115
_dict=(alt-cannadic
       edict2
       jawiki
       neologd
       personal-names
       place-names
       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20230711

pkgbase=mozc-with-jp-dict
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5185.102
pkgrel=5
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('fcitx5' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'gtk2' 'mesa' 'subversion' 'clang' 'emacs' 'ibus' 'ruby' 'ruby-parallel')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        "https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        "https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        #"https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        # https://github.com/WorksApplications/SudachiDict
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/core_lex.zip"
        "http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/${_sudachidict_date}/notcore_lex.zip"
        )
#        https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
#noextract=(jawiki-latest-all-titles-in-ns0.gz)

for dict in "${_dict[@]}"; do
  source+=( "https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.tar.bz2" )
done

sha512sums=('SKIP'
            'SKIP'
            'fa7f9e210d8afaf11b0ea72e1d05b3649b299a1342903b595928f2bb373c7d3f078f002487669b004d4b3105e7ad9b13099ca10d18ef3a5f7d837cf2e9a94a4f'
            'b1fc978c332957cbd4be873809d8c7c08d48922a05f60d90893e534d5626f357069300c163010346ef7e93aecd8a206b272b33a12ac76fe94d4c201acf491b0d'
            'd27e65cd76f0047875e11eb7c2e270ce8c27ccd4b66b4546c684a74f22fdbaf76aa26033dacdb0547dde4f292dd618c8d5377e4185ab3548b5d7609383d86f96'
            '63fc0c2508ada87949a7f77e7974dbdd0c371d8b64ac9002be872b0524d5f866448ee22304bbc1980e7ae207903933f6e047ca5a7d409992cb9fbc77ba9e1a3c'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            'cc3765b502882bb0ea8209d61a2577f1ac629abdc9e19f3a34a4202ae8d74cc5fcb3d9a1809a7ad81541c0f9baecf812647d2e3b3312898e6cf021bd15cc5795'
            '250f7f27ed5d3b9a02b9df51e04d5e2abbd838eac527052ff32f78f3ebb3af1ad637d1ee4ce505e39ef0eb7f964b012108ccb08e6c6f65f40293f70378eecc92'
            '3d11bc71a870181e9554525ca81fe72bc6018ad5599938b1b3f8ffe59eb2833be72031cdd5d3d2652e43294950ed0b5ba4cd60eefe2a98c03d089593d772fef3'
            'fa34975379329d53d5d02b4b137d86c273159d97d5e82026299c6f8bc018b7879156358cb1dbc320f894ed1d5497c6d482efd61f2e835de30b80eb0aef54e507'
            'a46dfc1bd1dc051ca3c9fb3a9929d2219715166dc93b3196920e672da245a7fa1aa4656d45d7201e04a6baceda2654c17cdc586dce5db21e3f2b6e22fe6ae9b3'
            '0afd153746727edbba65523cad450928fb863185679c7eb241c4c2928006c196a43235245aee7e1e1c2294be71e6035e47585db1270773da894947ac19a4c0c6')

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
  rm unix/fcitx/fcitx.gyp

  # disable emace gyp target
  rm unix/emacs/emacs.gyp
  rm gyp/tests.gyp

  # disable android-ndk requirement, even if we don't need it bazel will complain
  sed "/android_ndk_repository/d" -i WORKSPACE.bazel

  # adjust QT_BASE_PATH
  sed 's|path = QT_BASE_PATH|path = "/usr/include/qt"|' -i WORKSPACE.bazel

  # fix mozc icon for kimpanel
  sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

  # use libstdc++ instead of libc++
  sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

  # nm -f posix
  sed 's|\-f p |-f posix |' -i third_party/gyp/pylib/gyp/generator/ninja.py
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

  cd "${srcdir}/mozcdict-ext/" || exit

  # gem parallel
  [[ "$GEM_HOME"=="" ]] && GEM_HOME="/usr/lib/ruby/gems/3.0.0/"

  msg '2. Run the ruby scripts as in original utdict.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby utdict/utdict.rb -f mozcdic-ut.txt -i ${srcdir}/mozc/src/data/dictionary_oss/id.def > all-dict.txt

  #msg '3. Run the ruby scripts as in original mecab-naist-jdic.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  #ruby mecab-naist-jdic/mecab-naist-jdic.rb -e euc-jp -f ${srcdir}//mecab-naist-jdic-0.6.3b-20111013/naist-jdic.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt
  
  msg '3. Run the ruby scripts as in original sudachi.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  cd sudachi || exit
  ruby sudachi.rb -f ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt
  cd ..

  msg '4. Run the ruby scripts as uniqword.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt

  msg '5. Finally add UT dictionary to mozc source'
  cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  export QT_BASE_PATH=/usr/include/qt

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

package_mozc-with-jp-dict-common() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  options=('!docs')
  depends=('qt5-base')
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
  ../scripts/install_server_bazel
}

package_fcitx5-mozc-with-jp-dict() {
  pkgdesc="Fcitx5 module for Mozc with UT dictionary"
  depends=('fcitx5' 'hicolor-icon-theme' "$pkgbase-common")
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc')
  conflicts=('fcitx-mozc' 'fcitx5-mozc')

  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  #../scripts/install_fcitx5
  ../scripts/install_fcitx5_bazel
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}

package_ibus-mozc-with-jp-dict() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus>=1.4.1' "qt5-base" "$pkgbase-common")
  replaces=('ibus-mozc')
  conflicts=('ibus-mozc')

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
  depends=(gcc-libs "$pkgbase-common")
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"
}
