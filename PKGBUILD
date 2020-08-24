# Maintainer: Dan Elkouby <streetwalkermc@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop9
pkgver=2.3.2
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

        "always_delete_for_everyone.patch"
        "always_pin_without_notify.patch"
        "always_send_as_photo_or_album.patch"
        "clicky_sticker_panel.patch"
        "dont_pulse_mentions.patch"
        "no_circles.patch")
sha512sums=('757e57389ce24656c1d6676d6f0808e3d444785394e916b9f5fb47511662f01b6742c88c2a27274c4d9bb58263ae281218579c78cce7db119e2c863c1eaacc90'
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

    sed \
        -e 's|set(webrtc_build_loc ${libs_loc}/tg_owt/out/$<CONFIG>)|set(webrtc_build_loc /usr/lib)|' \
        -e 's|${webrtc_lib_prefix}tg_owt|${webrtc_lib_prefix}webrtc|' \
        -i cmake/external/webrtc/CMakeLists.txt
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
