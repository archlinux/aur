# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=8d8ea39
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20231122
_dict=(alt-cannadic
       edict2
       jawiki
       neologd
       personal-names
       place-names
       skk-jisyo
       sudachidict)

pkgbase=mozc-ut-full
pkgname=("$pkgbase-common" "ibus-$pkgbase" "fcitx5-$pkgbase" "emacs-$pkgbase")
pkgver=2.29.5291.102.20231122
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus' 'ruby')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
#         2023-07-13: osdn.net is unstable due to Amazon
#         "https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip"
#         "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip"
        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/x-ken-all-${_zipcode_rel}.zip"
        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/jigyosyo-${_zipcode_rel}.zip"
        git+https://github.com/abseil/abseil-cpp.git
        git+https://chromium.googlesource.com/breakpad/breakpad
        git+https://github.com/google/googletest.git
        git+https://chromium.googlesource.com/external/gyp
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
        git+https://github.com/open-source-parsers/jsoncpp.git
        git+https://github.com/google/protobuf.git
        git+https://github.com/utuhiro78/merge-ut-dictionaries.git
        jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz)
noextract=(jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz)

for dict in "${_dict[@]}"; do
  source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.tar.bz2"::"https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.tar.bz2")
done
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
            'SKIP'
            '3840b68d921b54bf62558ec52bcb6b4f138918038bdf5e7c51403d98d76f1b19237da336966d4dc41e2dadaaf49368ca3da04c0802289cf249df4c8411a788bc'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            '2b86aecad9b75451ce9d99a63a26927a64f3215ef7387e04d649cac85d4c944570f2f8402ab18a594df9bb30a67d98148e53b4dd7ec41401d79f4ba2f91098fd'
            '5135204ab245daa939f3b9410af852ea4a4630e03a0dd29d4cbe739ee716416db02ba54c95a1b1e2f3d9d33a8aa73ac57d9e3baa47d50924eefc3da8a2c6b5de'
            '3d11bc71a870181e9554525ca81fe72bc6018ad5599938b1b3f8ffe59eb2833be72031cdd5d3d2652e43294950ed0b5ba4cd60eefe2a98c03d089593d772fef3'
            '7b5f6cdddb1feba65cd39d5d7e0eddb643e7614e1f9ed3f44066992989a488b8107e433051c3e8e936f4dd2053d180a5ece4d2729cf4deb7a7f5ecc27dca541a'
            '13d758583eeb9b49ce84540daa14e8ee37aeefc489c73353212e2c38dd4e891239569fa2798dd99a73e624b00e14074b27e0b984e71dcb911d4eed5baa43abb7'
            '0afd153746727edbba65523cad450928fb863185679c7eb241c4c2928006c196a43235245aee7e1e1c2294be71e6035e47585db1270773da894947ac19a4c0c6'
            '04cae106412de32b72dce2e30dd9d95d34ed5def78cdd7c7461dcc71a99750afbb8f3905100c0ea5cba7ff6298a9ee10fe65b04cff69252097ff88bcfb1addef')

pkgver() {
  cd "${srcdir}/mozc" || exit
  source <(grep = src/data/version/mozc_version_template.bzl| tr -d ' ')
  printf "%s.%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION+2))" "$_utdicdate"
}

prepare() {
  cd "$srcdir/mozc" || exit
  git config -f .gitmodules submodule.src/third_party/abseil-cpp.url "$srcdir/abseil-cpp"
  git config -f .gitmodules submodule.src/third_party/breakpad.url "$srcdir/breakpad"
  git config -f .gitmodules submodule.src/third_party/gtest.url "$srcdir/googletest"
  git config -f .gitmodules submodule.src/third_party/gyp.url "$srcdir/gyp"
  git config -f .gitmodules submodule.src/third_party/japanese_usage_dictionary.url "$srcdir/japanese-usage-dictionary"
  git config -f .gitmodules submodule.src/third_party/jsoncpp.url "$srcdir/jsoncpp"
  git config -f .gitmodules submodule.src/third_party/protobuf.url "$srcdir/protobuf"
  git -c protocol.file.allow=always submodule update --init

  cd src || exit
  echo 'Generating zip code seed...'
  PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
  echo 'Done.'

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

  # UT Dictionary steps, rewrite of `sh make.sh`
  msg 'UT Dictionary steps, rewrite of `sh make.sh`'
  cd "${srcdir}/merge-ut-dictionaries/src" || exit
  msg '1. Append dictionaries'
  for dict in "${_dict[@]}"; do
    cat "$srcdir/mozcdic-ut-${dict}.txt" >> mozcdic-ut.txt
  done

  msg '2. Patch ruby scripts to avoid downloading'
  sed '/^`wget*/d' -i count_word_hits.rb
  sed "s,https://raw.githubusercontent.com/google/mozc/master,$srcdir/mozc," -i remove_duplicate_ut_entries.rb
  mv -v "$srcdir/jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz" ./jawiki-latest-all-titles-in-ns0.gz
  msg '3. Run the ruby scripts as in original make.sh, it may take some time...'
  ruby remove_duplicate_ut_entries.rb mozcdic-ut.txt
  ruby count_word_hits.rb
  ruby apply_word_hits.rb mozcdic-ut.txt
  msg '4. Finally add UT dictionary to mozc source'
  cat mozcdic-ut.txt >> "$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
  # Fix compatibility with google-glog 0.3.3 (symbol conflict)
  CFLAGS="${CFLAGS} -fvisibility=hidden"
  CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

  cd mozc/src || exit

  _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

  export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
  export QT_BASE_PATH=/usr/include/qt
  bazel build --copt=-fPIC --compilation_mode opt --config oss_linux $_targets

  # Extract license part of mozc
  head -n 29 server/mozc_server.cc > LICENSE
}

package_mozc-ut-full-common() {
  pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
  optdepends=('qt6-base: Display GUI of mozc_tool')
  options=('!docs')
  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 LICENSE data/installer/*.html "$pkgdir/usr/share/licenses/$pkgname/"

  ../scripts/install_server_bazel
}

package_fcitx5-mozc-ut-full() {
  pkgdesc="Fcitx5 module for Mozc with UT dictionary"
  depends=('fcitx5' "$pkgbase-common")
  provides=('fcitx5-mozc')
  replaces=('fcitx5-mozc')
  conflicts=('fcitx-mozc' 'fcitx5-mozc')

  export PREFIX="$pkgdir/usr"
  export _bldtype
  cd mozc/src || exit

  ../scripts/install_fcitx5_bazel
}

package_ibus-mozc-ut-full() {
  pkgdesc="IBus engine module for Mozc with UT dictionary"
  depends=('ibus' "$pkgbase-common")
  conflicts=('ibus-mozc')
  replaces=('ibus-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -D -m 755 bazel-bin/unix/ibus/ibus_mozc         "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
  install -D -m 644 bazel-bin/unix/ibus/mozc.xml          "$pkgdir/usr/share/ibus/component/mozc.xml"
  install -D -m 755 bazel-bin/renderer/qt/mozc_renderer   "$pkgdir/usr/lib/mozc/mozc_renderer"


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

package_emacs-mozc-ut-full() {
  pkgdesc="Emacs engine module for Mozc with UT dictionary"
  depends=('emacs' "$pkgbase-common")
  replaces=('emacs-mozc')
  conflicts=('emacs-mozc')

  export _bldtype
  cd "${srcdir}/mozc/src" || exit
  install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
  install -Dm644 unix/emacs/mozc.el                     "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}
