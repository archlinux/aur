# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=289b1bf
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20231008
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
pkgver=2.29.5250.102.20231008
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
        "jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-all-titles-in-ns0.gz")
noextract=("jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz")

for dict in "${_dict[@]}"; do
  source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.tar.bz2::https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.tar.bz2")
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
            '36a284bc0c21f7a394188c2fdfb303c02026261b2684e201689b0c38768f4315262682bc36241f1aee6b3418e9114196875a545d4e602515b38658f68973e0f9'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            'dcd016c66709b361c538732325e16b2f280ca88481e87d17d19a9c35205a7b9af249b1190ef2d52e50cc42056579096b5a331006e853f15c5220a8b138754b96'
            '8429646c25c33fd083d6399ea6101e0a9c92e78fcdf1d9310a374df8fbfcbde01f30f10445211af309fae1fc68a3a486fc0eb1e525f633af18d72a5ed19aa018'
            '3d11bc71a870181e9554525ca81fe72bc6018ad5599938b1b3f8ffe59eb2833be72031cdd5d3d2652e43294950ed0b5ba4cd60eefe2a98c03d089593d772fef3'
            '554f7ec63ec14759663f77975fa67b8b19ce54ea1563264c156ef048a7878f2e47b028e63444ba49d5049903db9d251fddebe6be8e759fbfaae0f76835f641e5'
            'e31a91257af818da76e531f151e99992aa9100d5c2d678e8c150e96481104a5aed143b994b0b5f013aad73e553ad4713d5da13e7e669f5a3494b74976a35b292'
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
