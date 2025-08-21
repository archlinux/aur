# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>

## Mozc compile option
_bldtype='Release'
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20250816
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
pkgver=2.31.5851.102.20250816
pkgrel=1
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus')
source=(git+https://github.com/fcitx/mozc.git#commit=9dc82478fb74ffbb5ea4ddde84350db68ee89754
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
        jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream-index.txt.bz2
        0001-remove-download.patch)
noextract=(jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2)
for dict in "${_dict[@]}"; do
    source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.bz2"::"https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.bz2")
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
            'SKIP'
            '19ccbab5f66c1473627f12770b9afddc09d4d3f29b66e23b5d9d11d5ae2180e8b92633f5245be2e43f05fcc742df2544e63cd9fcccd61bb0df0e4495ab84beec'
            '09b86b7527d45423090645a6763bb5d2d2bfe105a1db3736a2b7d48edf73dd2a6a4da4ae8ceb62bf26da210d07a6e6f7260dea7e01539e7746731d898793a07b'
            'a28e2d4b888a3df58b95bc171ba722477e74a2c0384e977873387a6c507a5c3497a7baf2504ce66b890976dd63a2dc1a60c5158d3bdd5a2e5383b5936023c45d'
            '1376030304101b45a85f08ba74a366f4ed2f5b80b5abc18ee4f776919acccca0dca652659a6772d38b016341102a6f8530de21cf721de614eb77155996da34db'
            '2c3317d00faa52980c0069f0655e83681606b6e259044129149bff2ba1b7f17dbfdeeaad832b6d0b2f4935c7fd40bfefec54bbfe04bf189c5868847cc63065f6'
            'eb240551d9a491c85afc2f1f361118b673572ea995336dad4185835d9e006451ef403a9515254fd9db1863d1ea67907051765f375a288f9c8195fac8ac3efcc4'
            '99b2a4d8777c693fd9f16ed041b22ef8b96184abcccc25bfa514d96edb0812e448e9b0af146924a3f81a3fe0bccf9dc91c336512cbc2302d7ce0ff921d93d90b'
            '4841eeee6c073f9d40cb0ca16798918b8a535491b166f3e024228261e7c2d597910c40f5c611205fd17e88034cedbe0298363778007a4c2c254762b40398ec3d'
            '743848cdf45a90d040c61c0d1d33915b0b3fc46deb702638668d3b2006b7e822a0729edb63a3bf67ded546f6c6bde2560580eb7eac7c0a3c0b4caaa6df4704a3')

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

    # fix mozc icon for kimpanel
    sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

    # use libstdc++ instead of libc++
    sed '/stdlib=libc++/d;/-lc++/d' -i gyp/common.gypi

    # UT Dictionary steps, rewrite of `sh make.sh`
    msg 'UT Dictionary steps, rewrite of `sh make.sh`'
    cd "${srcdir}/merge-ut-dictionaries/src/merge" || exit
    msg '1. Append dictionaries'
    for dict in "${_dict[@]}"; do
        cat "$srcdir/mozcdic-ut-${dict}-${_utdicdate}.txt" >>mozcdic-ut.txt
    done
    msg '2. Patch python scripts to avoid downloading'
    patch -Np1 -i "${srcdir}/0001-remove-download.patch"
    mv -v "$srcdir/jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2" jawiki-latest-pages-articles-multistream-index.txt.bz2
    msg '3. Run the python scripts as in original make.sh, it may take some time...'
    python merge_dictionaries.py mozcdic-ut.txt
    msg '4. Finally add UT dictionary to mozc source'
    cat mozcdic-ut.txt >>"$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
    # Fix compatibility with google-glog 0.3.3 (symbol conflict)
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

    cd mozc/src || exit

    _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'
    export QT_BASE_PATH=/usr/include/qt

    # Temp fix for GCC 14
    sed -i -e '/Werror/d' third_party/protobuf/build_defs/cpp_opts.bzl

    bazel build --copt=-fPIC --compilation_mode opt --config oss_linux $_targets --copt='-Wno-maybe-uninitialized' --host_copt='-Wno-maybe-uninitialized'

}

package_mozc-ut-full-common() {
    pkgdesc="A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
    optdepends=('qt6-base: Display GUI of mozc_tool')
    options=('!docs')
    export PREFIX="$pkgdir/usr"
    export _bldtype
    cd mozc/src || exit

    # BSD-3-Clause
    sed -n 1,29p unix/fcitx5/fcitx_key_translator.h >Fcitx5
    sed -i -e 's|^\/\/[ ]\?||g' Fcitx5
    install -Dm644 Fcitx5 "${pkgdir}"/usr/share/licenses/${pkgname}/Fcitx5
    # BSD-3-Clause
    sed -n 67,94p data/installer/credits_en.html >Mozc
    install -Dm644 Mozc "${pkgdir}"/usr/share/licenses/${pkgname}/Mozc
    # BSD-3-Clause
    sed -n 317,344p data/installer/credits_en.html >Breakpad
    install -Dm644 Breakpad "${pkgdir}"/usr/share/licenses/${pkgname}/Breakpad
    # NAIST-2003
    sed -n 355,424p data/installer/credits_en.html >IPAdic
    install -Dm644 IPAdic "${pkgdir}"/usr/share/licenses/${pkgname}/IPAdic
    # BSD-2-Clause
    sed -n 435,457p data/installer/credits_en.html >Japanese-Usage-Dictionary
    install -Dm644 Japanese-Usage-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Japanese-Usage-Dictionary
    # Public Domain Data
    sed -n 468,470p data/installer/credits_en.html >Okinawa-Dictionary
    install -Dm644 Okinawa-Dictionary "${pkgdir}"/usr/share/licenses/${pkgname}/Okinawa-Dictionary
    # BSD-3-Clause
    sed -n 481,513p data/installer/credits_en.html >Protocol-Buffers
    install -Dm644 Protocol-Buffers "${pkgdir}"/usr/share/licenses/${pkgname}/Protocol-Buffers
    # MIT
    sed -n 698,704p data/installer/credits_en.html >Tamachi-Phonetic-Kanji-Alphabet
    install -Dm644 Tamachi-Phonetic-Kanji-Alphabet "${pkgdir}"/usr/share/licenses/${pkgname}/Tamachi-Phonetic-Kanji-Alphabet
    # MIT
    sed -n 762,782p data/installer/credits_en.html >Windows-Implementation-Library
    sed -i -e 's|^[ \t]*||g' Windows-Implementation-Library
    install -Dm644 Windows-Implementation-Library "${pkgdir}"/usr/share/licenses/${pkgname}/Windows-Implementation-Library

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
