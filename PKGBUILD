# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=1.9.8
pkgrel=2
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    'enchant' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
    'qt5-imageformats' 'xxhash' 'libappindicator-gtk3'
)
makedepends=('cmake' 'git' 'ninja' 'python' 'quilt' 'range-v3')
optdepends=('ttf-opensans: default Open Sans font family')
provides=('telegram-desktop')
conflicts=('telegram-desktop')

source=(
    "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
    # Files from the official package
    telegram-desktop.sh
    # Custom patches
    "always_delete_for_everyone.patch"
    "always_clear_history_for_everyone.patch"
    "always_pin_without_notify.patch"
    "always_send_as_photo_or_album.patch"
)
sha512sums=(
    '5562eb99812a8faec74fe073323d6e04e36311c1e4ce984035212ecfed8bd5d12df92cd0f0022401201136315fb5556971b267b4bf47edf4eeddc9926c7969dc'
    # Official package files
    '3c21c871e28bac365400f7bc439a16ad1a9a8d87590ad764ce262f1db968c10387caed372d4e064cb50f43da726cebaa9b24bcbcc7c6d5489515620f44dbf56b'
    # Custom patches
    'e88fa96024efc6176c818d0a46684e0ee1fb3a7bdadb323ad3b29f736209c80b6c31b135cf84389e7e2bbd614e57b241e4437c94b6fd114e73cfc418bf130015'
    '4a7e9de924bbf32fb4cd24ffa2764bcf49e0540bba649829b180da20a62810d4a21ebf11529d4eca22c9ceaa93b434ca3fbfd0b636795f8109ea4e1eddbff8f3'
    'b4eeeb4b2801f3edcc7423f28403b1dfabd3f3869425e4f102a2a4554bde93e63bd73d2d4dbf3e5748ce831b570e441d3917f532fc5cceac1ee5e8fd0832cb30'
    '650a2a2568cacd2775979614c06c90a4c505207246eb229bbf4fccd8e9fc2540093eaa5bd748e3801c1e1b43beb89b19674c27c5f400d451475b0ee068b04ca2'
)

prepare() {
    cd tdesktop-$pkgver-full

    # custom patches
    patch -Np1 -i "$srcdir/always_delete_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_clear_history_for_everyone.patch"
    patch -Np1 -i "$srcdir/always_pin_without_notify.patch"
    patch -Np1 -i "$srcdir/always_send_as_photo_or_album.patch"
}

build() {
    cd tdesktop-$pkgver-full

    export GYP_DEFINES="TDESKTOP_DISABLE_CRASH_REPORTS,TDESKTOP_DISABLE_AUTOUPDATE,TDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME,TDESKTOP_DISABLE_DESKTOP_FILE_GENERATION,TDESKTOP_FORCE_GTK_FILE_DIALOG"

    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    cmake -B build -G Ninja . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_PACKAGED=ON \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DTDESKTOP_FORCE_GTK_FILE_DIALOG=ON
    ninja -C build
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -m755 telegram-desktop.sh "$pkgdir/usr/bin/telegram-desktop"

    cd tdesktop-$pkgver-full
    install -m755 build/bin/telegram-desktop "$pkgdir/usr/bin/telegram-desktop-bin"

    install -d "$pkgdir/usr/share/applications"
    install -m644 lib/xdg/telegramdesktop.desktop "$pkgdir/usr/share/applications/telegramdesktop.desktop"

    install -d "$pkgdir/usr/share/kservices5"
    install -m644 lib/xdg/tg.protocol "$pkgdir/usr/share/kservices5/tg.protocol"

    install -d "$pkgdir/usr/share/metainfo/"
    install -m644 lib/xdg/telegramdesktop.appdata.xml "$pkgdir/usr/share/metainfo/telegramdesktop.appdata.xml"

    local icon_size icon_dir
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"

        install -d "$icon_dir"
        install -m644 "Telegram/Resources/art/icon${icon_size}.png" "$icon_dir/telegram.png"
    done
}