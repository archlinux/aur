# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_mozc_commit=ad5c2d3
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20240927
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
pkgver=2.30.5595.102.20240927
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus')
source=(git+https://github.com/fcitx/mozc.git#commit="${_mozc_commit}"
        # 2023-07-13: osdn.net is unstable due to Amazon
        # "https://osdn.net/projects/ponsfoot-aur/storage/mozc/x-ken-all-${_zipcode_rel}.zip"
        # "https://osdn.net/projects/ponsfoot-aur/storage/mozc/jigyosyo-${_zipcode_rel}.zip"
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
sha512sums=('9c60bdf04455ebe1b08455f6eac18d1036322cd17c15cf32e14b73945f2e39d900de799f2da6d3c1c53347fde585cbb92c2a1857b0d318fe1db751b0e41bd0fe'
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
            '61ed6c9654b7f4f58323c8220f857dd0fef143a1c0ae8d7349263379eb0a9391f475ffc570ef95769ae90c804e7ba2d91d47ffd68a0ed4937bdfef2753bf40d5'
            'd69c479c34f70839eb9a78f920b6a6aee1d39aff6ab181bfaa2fd47554697d6e4d92abb9d5bfc45247f0749a128557d1b8a12fa764865a5845d2c59e0f74660e'
            'd4fb61a5ff34164c3a0d75aef37b7e422388795a017677585c1a1e7df0924345be87caf4e6f58ee2085159122a5524275fb915b875932d2ed53a016bc6137274'
            '868769ee8c53450f5dfac4c7681edbdb61d5b9d5f478181ae7cc80a4170b77b640d3a058f1a7adfb8c0bf92cc94584a55b676d49c9ba8a85c2d860380be10e84'
            'c661b168a89fa9f726f62076ed1a51c72ebf8303688f3cff77247bfd34a0fee53a1b5bc35ee2ba05994b53e1f0397cb4a816e5a57eccbd210b0c1f8cc4fa50ab'
            'b2042fcc88175322dc477a747acc3ff2236fb279107bd882e944eb2e4a6f86b56788992ca3e52dcf7d6a68790de0e9bceaf00b0dea671530af91d5bcb15bf581'
            '377b3db6be9b1415e1507239e4108bb694201fb52d700d8099343ffecbad2f68bcf4e8bf2a61be031dd57e8fab2bbd7b16ae25a700d3ea72ec0d223fbc13804b'
            '0a238ee7f64af1ef1428aa1c1164aa13663e0e5d657478326606ec203c99932a8548e1fc4468a40124bc46ad2fdb4bd6aaedde6a7cf108a4c549503476a930d4'
            'f8ccc231e0f247d14c5e523db4b90ca2c5fc216a96a767c1ad0c99b66636cbd020884ff1884af59f19665021f95df9da44ced2a9ea3de9865f1fad79c7194c12')

pkgver() {
    cd "${srcdir}/mozc" || exit
    source <(grep = src/data/version/mozc_version_template.bzl | tr -d ' ')
    printf "%s.%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION + 2))" "$_utdicdate"
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
    PYTHONPATH="$PWD:$PYTHONPATH" python dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >>data/dictionary_oss/dictionary09.txt
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
      cat "$srcdir/mozcdic-ut-${dict}.txt" >>mozcdic-ut.txt
    done

    msg '2. Patch python scripts to avoid downloading'
    sed '/^subprocess*/d' -i count_word_hits.py
    sed "s,https://raw.githubusercontent.com/google/mozc/master,file://$srcdir/mozc," -i remove_duplicate_ut_entries.py
    mv -v "$srcdir/jawiki-latest-all-titles-in-ns0-${_utdicdate}.gz" ./jawiki-latest-all-titles-in-ns0.gz
    msg '3. Run the python scripts as in original make.sh, it may take some time...'
    python remove_duplicate_ut_entries.py mozcdic-ut.txt
    python count_word_hits.py
    python apply_word_hits.py mozcdic-ut.txt
    msg '4. Finally add UT dictionary to mozc source'
    cat mozcdic-ut.txt >>"$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
    # Fix compatibility with google-glog 0.3.3 (symbol conflict)
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

    cd mozc/src || exit

    _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

    export JAVA_HOME='/usr/lib/jvm/java-11-openjdk/'
    export QT_BASE_PATH=/usr/include/qt

    # Temp fix for GCC 14
    sed -i -e '/Werror/d' third_party/protobuf/build_defs/cpp_opts.bzl

    bazel build --copt=-fPIC --compilation_mode opt --config oss_linux $_targets

    # Extract license part of mozc
    head -n 29 server/mozc_server.cc >LICENSE
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
    install -D -m 755 bazel-bin/unix/ibus/ibus_mozc "$pkgdir/usr/lib/ibus-mozc/ibus-engine-mozc"
    install -D -m 644 bazel-bin/unix/ibus/mozc.xml "$pkgdir/usr/share/ibus/component/mozc.xml"
    install -D -m 755 bazel-bin/renderer/qt/mozc_renderer "$pkgdir/usr/lib/mozc/mozc_renderer"

    cd bazel-bin/unix || exit
    unzip -o icons.zip

    install -Dm644 mozc.png "${pkgdir}/usr/share/ibus-mozc/product_icon.png"
    install -Dm644 alpha_full.svg "${pkgdir}/usr/share/ibus-mozc/alpha_full.svg"
    install -Dm644 alpha_half.svg "${pkgdir}/usr/share/ibus-mozc/alpha_half.svg"
    install -Dm644 direct.svg "${pkgdir}/usr/share/ibus-mozc/direct.svg"
    install -Dm644 hiragana.svg "${pkgdir}/usr/share/ibus-mozc/hiragana.svg"
    install -Dm644 katakana_full.svg "${pkgdir}/usr/share/ibus-mozc/katakana_full.svg"
    install -Dm644 katakana_half.svg "${pkgdir}/usr/share/ibus-mozc/katakana_half.svg"
    install -Dm644 outlined/dictionary.svg "${pkgdir}/usr/share/ibus-mozc/dictionary.svg"
    install -Dm644 outlined/properties.svg "${pkgdir}/usr/share/ibus-mozc/properties.svg"
    install -Dm644 outlined/tool.svg "${pkgdir}/usr/share/ibus-mozc/tool.svg"
}

package_emacs-mozc-ut-full() {
    pkgdesc="Emacs engine module for Mozc with UT dictionary"
    depends=('emacs' "$pkgbase-common")
    replaces=('emacs-mozc')
    conflicts=('emacs-mozc')

    export _bldtype
    cd "${srcdir}/mozc/src" || exit
    install -Dm755 bazel-bin/unix/emacs/mozc_emacs_helper "$pkgdir/usr/bin/mozc_emacs_helper"
    install -Dm644 unix/emacs/mozc.el "$pkgdir/usr/share/emacs/site-lisp/emacs-mozc/mozc.el"
}
