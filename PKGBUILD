# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=3e2d1c8
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20240331
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
pkgver=2.30.5432.102.20240331
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
            'e22702e043533b4862cf14ab8da54c049ec59fb3f8cae7ab0d68e3a0bc4359cee70c05792b406290a8c0a5caf1743ba51a31613fd0aa4ce7843711e8ca254428'
            '30019a9ce73456046f67edd6fe8f4661bd9a8e9ca201f3bdf22d2fa70dad9544bd595a8820fbed402a0709809d02cabbdea9dc79ee1f5bf30f8ef722ba4a2c17'
            '082db1659d6ae19891f15c219040571dd30c8e91527b5f8ca8b7ff05d9ac6f0b25e514741a23103dd39a7d57070c6e007b4536a1a57f0802a78a9abf0ef58fc4'
            '740cee5d06aa78506a43a996e6ce2a03f421f3503180fb7151278d2d130756505c0565b0d6c91552d1af3cca2e5f53b8830e1114b5089119fafe9e7104d80996'
            '3d11bc71a870181e9554525ca81fe72bc6018ad5599938b1b3f8ffe59eb2833be72031cdd5d3d2652e43294950ed0b5ba4cd60eefe2a98c03d089593d772fef3'
            '71ec01cbaf64328ca15edc84e7e9c4428df579fb867aac69a1e1e8232efa8ad26b2d6ceae3cce670cbc54e1dcb8afec32b88a5554bfc6b6684b4ef6ae380f60c'
            'ad37818cb5645dd90fd572962811c586775dd87b339e68e558e87dc1f61230504a6a7605219eb32f07164e1638eac9ac406d2c520f834d0fb4a1bc8ba3c97319'
            '0afd153746727edbba65523cad450928fb863185679c7eb241c4c2928006c196a43235245aee7e1e1c2294be71e6035e47585db1270773da894947ac19a4c0c6'
            'dbad77feb147f88a42ced0eae86da82de014519ec5d3c6c00a5fc3fc5473e9f848645046d8fa44ce056ba4defeee995142760e43e1895446e09b4a205b7e91fb')

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
