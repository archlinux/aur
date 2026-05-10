# $Id$
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: Jiachen Yang <farseerfc@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: ponsfoot <cabezon dot hashimoto at gmail dot com>
# Contributor: UTUMI Hirosi <utuhiro78 at yahoo dot co dot jp>
# Contributor: Hiroyuki Komatsu: providing Japan Post zipcode snapshots

## Mozc compile option
_bldtype='Release'
_zipcode_rel=202110

# Ut Dictionary
_utdicdate=20260503
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
pkgver=3.33.6133.102.20260503
pkgrel=2
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
makedepends=('bazel' 'git' 'python' 'python-six' 'pkg-config' 'curl' 'mesa' 'subversion' 'qt6-base' 'clang' 'fcitx5' 'emacs' 'ibus')
source=(git+https://github.com/fcitx/mozc.git#commit=a897811b9865e084963dd7ca81e2186ddc7f6403
        #         2023-07-13: osdn.net is unstable due to Amazon
        "https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/ken_all.zip"
        "https://github.com/hiroyuki-komatsu/japanpost_zipcode/raw/refs/heads/main/jigyosyo.zip"
        #        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/x-ken-all-${_zipcode_rel}.zip"
        #        "https://gitlab.com/BrLi/brli-aur/-/raw/fcitx5-mozc-ut/jigyosyo-${_zipcode_rel}.zip"
        git+https://github.com/abseil/abseil-cpp.git
        git+https://chromium.googlesource.com/breakpad/breakpad
        git+https://github.com/google/googletest.git
        git+https://chromium.googlesource.com/external/gyp
        git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git
        git+https://github.com/open-source-parsers/jsoncpp.git
        git+https://github.com/google/protobuf.git
        git+https://github.com/utuhiro78/merge-ut-dictionaries.git
        jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2::https://dumps.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles-multistream-index.txt.bz2)
noextract=(jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2)
for dict in "${_dict[@]}"; do
    source+=("mozcdic-ut-${dict}-${_utdicdate}.txt.bz2"::"https://github.com/utuhiro78/mozcdic-ut-${dict}/raw/main/mozcdic-ut-${dict}.txt.bz2")
    noextract+=("mozcdic-ut-${dict}-${_utdicdate}.txt.bz2")
done
sha512sums=('312e94e71bc2445ab8593d96a4311adddedbbf4e9bcf3a36deb95fac93ed74853e2cbe210593cb2cc859c18885d8e52dcac4183703f91bb43b9250747413941b'
            'd893c137569f008202ec7f7d1871c35641b9c5d502cf35c588ea0a95950af9e2dff891181d5c76ed905201016da6aa855d74c99267d739bd4a966ccda10d6b53'
            'b99066b666e77babb34d09622261ce2df9ac92d030302487c9873babaf7d25d5519639484a619b87fef1db299ff3f288c63ad04e2b8ae34a81a30d68311c1da4'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '68fafd5ad35656b4a7819a3fe15d8c8bdd7d93be57feec7632d6ac3cbb2bbd44dbc57255c74c14f8a38f699bf73f57630e0874c4e317e73eade1353e8034c206'
            '258549a55dc6d6f8331c08940de7d5784430efe27d64efb66b0b07888d686b5ba72cad95fe8ff836d68a90a5a919493a4fd7c36bb682e8734fa2884369831da6'
            'd4570230fbec418e6c8dfe16e92d3582768ee6025f0c942a35b605445ed2a2b481c5db0b768feb152b04c5f7b63ec42b0ef01964b0cd4b433a760e344321afae'
            '4fd70121cdfa9bd3af9b478e953f89bbdea569df2b7c7650543589b71f88aa820e8c8d00a26885b45e3440b48b3bcd0986465203f15daa77cccd1b6911d4b3d1'
            '2c3317d00faa52980c0069f0655e83681606b6e259044129149bff2ba1b7f17dbfdeeaad832b6d0b2f4935c7fd40bfefec54bbfe04bf189c5868847cc63065f6'
            '9507bcce1739b97be8cb3164caeab8600f71e53a1b63e55f89815ab2e0cc79aff4b466509613e8bba6f6fae64a99e17f523d5fd75c395893d4b8cfe8bbdad7d2'
            'fc1a778174f6f2220769dd611fe1669d282f66a0365b6c1b766602554166fbaf61aa3d2b3f19c408984541fa703ad4accd04a85f1e02c101cc41aa805e0cd736'
            '4841eeee6c073f9d40cb0ca16798918b8a535491b166f3e024228261e7c2d597910c40f5c611205fd17e88034cedbe0298363778007a4c2c254762b40398ec3d'
            '39faea2085c88f91fd2efbed79bb235979319299dd028b41e5f2b9be613b273828a12af1416907f88cfa9feeb0a74ba46059ae03e4e9b6b1d6100195edf6b74a')

pkgver() {
    cd "${srcdir}/mozc" || exit
    source <(grep = src/version.bzl | tr -d ' ')
    printf "%s.%s.%s.%s.%s" "$MAJOR" "$MINOR" "$BUILD_OSS" "$((REVISION + 2))" "$_utdicdate"
}

prepare() {
    mv KEN_ALL.CSV x-ken-all.csv

    cd "$srcdir/mozc" || exit

    # comment out shell-incompatible code, revert at build()
    sed 's,DEFAULT_BUILD_LABEL_MACOS,#DEFAULT_BUILD_LABEL_MACOS,' -i src/version.bzl

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

    # fix mozc icon for kimpanel
    sed -i 's|PREFIX|/usr|' unix/fcitx5/mozc.conf

    # UT Dictionary steps, rewrite of `sh make.sh`
    cd "${srcdir}/merge-ut-dictionaries/src/merge" || exit
    # disable unsuitable_words filter
    echo '' >../common/unsuitable_words.txt
    # do things offline
    mv -v "$srcdir/jawiki-latest-pages-articles-multistream-index-${_utdicdate}.txt.bz2" jawiki-20260501-pages-articles-multistream-index.txt.bz2
    for dict in "${_dict[@]}"; do
        sed "/^\#${dict/-/_}/ s,\#${dict/-/_},${dict/-/_}," -i make.sh
        sed "s,git clone --depth 1 https://github.com/utuhiro78/mozcdic-ut-${dict}.git,install -Dm644 \"${srcdir}/mozcdic-ut-${dict}-${_utdicdate}.txt.bz2\" \"mozcdic-ut-${dict}/mozcdic-ut-${dict}.txt.bz2\",g" -i make.sh
    done
    sh make.sh
    # Add the UT dictionary to original Mozc dictionary tree
    cat mozcdic-ut.txt >>"$srcdir/mozc/src/data/dictionary_oss/dictionary00.txt"
}

build() {
    # revert prior inline replace in prepare()
    sed 's,#DEFAULT_BUILD_LABEL_MACOS,DEFAULT_BUILD_LABEL_MACOS,' -i mozc/src/version.bzl

    # Fix compatibility with google-glog 0.3.3 (symbol conflict)
    CFLAGS="${CFLAGS} -fvisibility=hidden"
    CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

    cd mozc/src || exit

    _targets="unix/fcitx5:fcitx5-mozc.so server:mozc_server gui/tool:mozc_tool renderer/qt:mozc_renderer unix/ibus:ibus_mozc unix/emacs:mozc_emacs_helper"

    unset ANDROID_NDK_HOME
    unset ANDROID_HOME
    export JAVA_HOME='/usr/lib/jvm/java-21-openjdk/'
    export QT_BASE_PATH=/usr/include/qt

    bazel build --compilation_mode opt --config stable_channel --config release_build --config oss_linux $_targets
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
