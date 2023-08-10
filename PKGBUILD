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
_mozc_commit=b5f0a529cd05e72e53d7b1901652a186476f9ce3

# Ut Dictionary
_utdicdate=20230115
_dict=(alt-cannadic
       edict2
       jawiki
#       neologd
       personal-names
       place-names
       skk-jisyo
#       sudachidict
       )
_sudachidict_date=20230110

pkgbase=mozc-with-jp-dict
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5185.102
pkgrel=3
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('fcitx5' 'bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'gtk2' 'mesa' 'subversion' 'clang' 'emacs' 'ibus' 'ruby' 'ruby-parallel')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
        "https://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
        "https://www.post.japanpost.jp/zipcode/dl/jigyosyo/zip/jigyosyo.zip"
        git+https://github.com/phoepsilonix/mozcdict-ext.git
        #"https://osdn.net/projects/naist-jdic/downloads/53500/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
        "https://github.com/phoepsilonix/mecab-naist-jdic/raw/main/mecab-naist-jdic-0.6.3b-20111013.tar.gz"
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
            'fa7f9e210d8afaf11b0ea72e1d05b3649b299a1342903b595928f2bb373c7d3f078f002487669b004d4b3105e7ad9b13099ca10d18ef3a5f7d837cf2e9a94a4f'
            'b1fc978c332957cbd4be873809d8c7c08d48922a05f60d90893e534d5626f357069300c163010346ef7e93aecd8a206b272b33a12ac76fe94d4c201acf491b0d'
            'SKIP'
            '03d04505d3d8d097d1389af987e87aca43d56ef36b0def9eb85e19ee15ffe3598d3acb1c78c6dde3b31519419acb87c595aaad594dd116b98ac5cabb82a2e61c'
            '46de5c238cdfe39e28d29cff317bdab1ad26a1f6999141efbcc443cb8269d714cbebf8ef9582d53b2ee722c2511d9d0735a67bdce345ad5a15d63ef42d2f5745'
            '53f319879a7bdd8b6d6a527901e8a25079a023799aa06b786aee67745739b7f81d157b2f065b4a4738ca9ec01519ab9f11be81565f1837de5df8010b3f345821'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            'e84170a832be2de47e9816654adea08e2f39599bf929822b8a0abb51dd4d3c2893cd62bdb2e6f985b7e024d8f410ce73fb115786b9a419a15c68fd12bf1a3b3d'
            'a5807452a7d6c64bed803f3e9fc56cd89bea54ea97f49448690430b2b6e1c8237d79233b9b762d7330c40a0029d10a22bfbaac081fca24c04fc0e79735e67ed7'
            '79f5300a08b7e73857e6a0edee3212c903fc4231fea22abdc2840d21ef5e6367de40cc155690b943b0b516250e638d474bd04a169f4671b2864cbd5e1fa4768f'
            '787fe4f099b3a192c45f6a6b0287a0542927dcfccff03fe10b5fd132a96c3dcd4cba5d1f43c8730fc1f907f616a897266ec6576608b535494e424c262f3ccede'
            '0afd153746727edbba65523cad450928fb863185679c7eb241c4c2928006c196a43235245aee7e1e1c2294be71e6035e47585db1270773da894947ac19a4c0c6')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git submodule update --init --recursive
#  git config -f .gitmodules submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
#  git config -f .gitmodules submodule.src/third_party/breakpad.url "$srcdir/breakpad"
#  git config -f .gitmodules submodule.src/third_party/gtest.url "$srcdir/googletest"
#  git config -f .gitmodules submodule.src/third_party/gyp.url "$srcdir/gyp"
#  git config -f .gitmodules submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
#  git config -f .gitmodules submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
#  git config -f .gitmodules submodule.src/third_party/protobuf.url "$srcdir/protobuf"
#  git config -f .gitmodules submodule.src/third_party/wil.url "$srcdir/wil"
#  git -c protocol.file.allow=always submodule update --init

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

  msg '3. Run the ruby scripts as in original mecab-naist-jdic.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby mecab-naist-jdic/mecab-naist-jdic.rb -e euc-jp -f ${srcdir}//mecab-naist-jdic-0.6.3b-20111013/naist-jdic.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt
  
  msg '4. Run the ruby scripts as in original sudachi.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  cd sudachi || exit
  ruby sudachi.rb -f ${srcdir}/core_lex.csv ${srcdir}/notcore_lex.csv -i ${srcdir}/mozc/src/data/dictionary_oss/id.def >> all-dict.txt
  cd ..

  msg '5. Run the ruby scripts as uniqword.rb based on neologd.rb(mozcdict-ext) , it may take some time...'
  ruby .dev.utils/uniqword.rb all-dict.txt > finish-dict.txt

  msg '6. Finally add UT dictionary to mozc source'
  cat finish-dict.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
  sync

  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd ${srcdir}/mozc/src || exit

  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  export QT_BASE_PATH=/usr/include/qt

  # fcitx5
  GYP_DEFINES="use_fcitx=0 use_libibus=0" ../scripts/configure
  TARGETS="gui/gui.gyp:mozc_tool unix/fcitx5/fcitx5.gyp:fcitx5-mozc"
  python build_mozc.py build ${TARGETS} -c ${_bldtype}

  # others(ibus emacs_helper mozc_server)
  bazel build --config oss_linux package

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

  ../scripts/install_fcitx5
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
