# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop9
pkgver=2.4.2
pkgrel=1
pkgdesc='Official Telegram Desktop client (personal build)'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libwebrtc')
optdepends=('ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "Use-tg_owt-webrtc-fork._patch::https://github.com/desktop-app/cmake_helpers/commit/4c8956027de8e8e8b984c5daa643aacb14a89123.patch"
        "Update-webrtc-packaged-build-for-tg_owt._patch::https://github.com/desktop-app/cmake_helpers/commit/d955882cb4d4c94f61a9b1df62b7f93d3c5bff7d.patch"

        "always_delete_for_everyone.patch"
        "always_pin_without_notify.patch"
        "always_send_as_photo_or_album.patch"
        "clicky_sticker_panel.patch"
        "dont_pulse_mentions.patch"
        "no_circles.patch")
sha512sums=('e626ac2f74b7ba9c8db847b26275d88d4c95beb3c2b8787d0ecdc7dc1b40548e825056acf45ece1e647e6a3d6da7215d16d908f443da311b9d99769639c19ad3'
            '3a7a20ace7dcea5be202e7b3008807ba0ae38ae8266709e3595f6b3c0aa2bf81299da4b5a7e7d66d2d9b3040cc6618e67e4d7b9572b2649db4c477056e649bcf'
            'b3c44e76a3907f7acc197746b471564577e912bf0561e9576dc8459211c88f400716437bcaa10967376461c69c8a98a56477d26d3feb9ca34747d9208bf5f6c6'
            'fdef3a430bdd60d88c9e9011ee878805e7803699204a2a7e22797d0f8729bf7dc0543851083ad700a4ece32bc768b6bfeb6f0135c8c039e035b22afb6df1171d'
            '91a0edab6408a223db77b75df5a913ffd36efa79340e8d78fa01ac2c3b6e09d5a5fc7fa214ccd40473093809f86b7aef199cebf56a1d5821c20083c4a3e5780b'
            'f934856707feec5c141ea2d03bf3fb5583c7a9065c46ce0bc3cbf7cbc853ad0c6ee64267eba66a94ce7b85caf9f61cb4c661295ca84f361ec049ee2de128d6dd'
            '010d0ea4e39170077e066858746411f1cc90bb6a9f343b29dbc82b1e963815e4ce220da2a1203661c57fe1810667a2bed34a4f02220fa75f2bc209c5e8472873'
            '673e2a28781d0d604549c621592b1017ad306ddaf6d1beedfe73f3f1357fbb6afd994a324dfa15029789bdf8a4d6e85ad12a3877519618f6585bbc1927c06900'
            '8ec6b1739a1391b75a2653fff704a7d22e830c526acffe138936bbd20047bd24831e42558fa22069d7e914e762bbcfa2e1b14a8fd3911fd8bbbd0662d8baac14')

prepare() {
    cd "$srcdir/tdesktop-$pkgver-full"

    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
    done

    cd cmake
    patch -R -Np1 -i ${srcdir}/Update-webrtc-packaged-build-for-tg_owt._patch
    patch -R -Np1 -i ${srcdir}/Use-tg_owt-webrtc-fork._patch
    sed 's|set(webrtc_build_loc ${webrtc_loc}/out/$<CONFIG>/obj)|set(webrtc_build_loc /usr/lib)|' -i external/webrtc/CMakeLists.txt
}

build() {
    cd tdesktop-$pkgver-full

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DDESKTOP_APP_WEBRTC_LOCATION=/usr/include/libwebrtc \
        -DDESKTOP_APP_DISABLE_SPELLCHECK=ON
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
