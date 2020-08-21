# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=2.3.0
pkgrel=1
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    'hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
    'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3'
)
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libwebrtc')
optdepends=('ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')

source=(
    "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
    "set_webrtc_location.patch::https://github.com/desktop-app/cmake_helpers/commit/7dc5da757124cb2d644e289a37d8957823a7f6c9.patch"
    # Custom patches
    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
    "force_gtk_integration.patch"
)
sha512sums=(
    '65fa7641ed9ba2fcd4181e3f6bbc036dcf2ddcb12eb10a15a601e0fce79c0f99741b55741bb3c18b9de5d3cdb07190761ea0f8fbe111563f784e0ad3faea2ede'
    '5405ec01bd19350141588aad40eec63e47cd601d4945ed28ba2aaf077b398f4b746c3299e047bf0fb534f073ac1b9d4a515c5cc3eca9cdc754ccf87d2ce7176e'
    # Custom patches
    'e88fa96024efc6176c818d0a46684e0ee1fb3a7bdadb323ad3b29f736209c80b6c31b135cf84389e7e2bbd614e57b241e4437c94b6fd114e73cfc418bf130015'
    '4a7e9de924bbf32fb4cd24ffa2764bcf49e0540bba649829b180da20a62810d4a21ebf11529d4eca22c9ceaa93b434ca3fbfd0b636795f8109ea4e1eddbff8f3'
    'b4eeeb4b2801f3edcc7423f28403b1dfabd3f3869425e4f102a2a4554bde93e63bd73d2d4dbf3e5748ce831b570e441d3917f532fc5cceac1ee5e8fd0832cb30'
    'e4781ea7dabb6deb96d4ef26af21ce7925270ba1ea8e91ba365165a023423907a727bdc9bc948f935ed919130632f260d0a7b5e79cac56a942ef24c3cc600b89'
    '17faeff3ee56edd63be658c3730dbbed26437cb9bf0a9890d16cae26fd500aaab738b66de57b573903a5bd727dafe65105e151b08d7a6d8c426c148e754a7114'
)

prepare() {
    cd tdesktop-$pkgver-full/cmake
    patch -Np1 -i ../../set_webrtc_location.patch
    sed 's|set(webrtc_build_loc ${webrtc_loc}/out/$<CONFIG>/obj)|set(webrtc_build_loc /usr/lib)|' -i external/webrtc/CMakeLists.txt

    cd ..
    # custom patches
    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"
    patch -Np1 -i "$srcdir/force_gtk_integration.patch"
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
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DDESKTOP_APP_WEBRTC_LOCATION=/usr/include/libwebrtc
        # -DTDESKTOP_USE_GTK_FILE_DIALOG=ON
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
