# Maintainer: Sameer Hoosen <tabhooked@gmail.com>
# Official package maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Based on telegram-desktop-dev by: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: hexchain <i@hexchain.org>

# Thanks to Dan Elkouby <streetwalrus@codewalr.us> for some of the custom patch ideas!
# https://github.com/Streetwalrus/dotfiles/blob/master/scripts/telegram-desktop

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-udf-patched
pkgver=1.9.9
pkgrel=1
pkgdesc='Telegram Desktop client with several personal patches'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    'enchant' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
    'qt5-imageformats' 'xxhash' 'libappindicator-gtk3'
)
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3')
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
    'ba6400e6f5eec5bda6e8a54b43846e695b2cce731cb6b39f17407cc39e3e9b8078d977253d29962671f30e33dbe012f8e40f340f781fd8ca73487e5f2d42e3de'
    # Official package files
    '3c21c871e28bac365400f7bc439a16ad1a9a8d87590ad764ce262f1db968c10387caed372d4e064cb50f43da726cebaa9b24bcbcc7c6d5489515620f44dbf56b'
    # Custom patches
    'e88fa96024efc6176c818d0a46684e0ee1fb3a7bdadb323ad3b29f736209c80b6c31b135cf84389e7e2bbd614e57b241e4437c94b6fd114e73cfc418bf130015'
    '4a7e9de924bbf32fb4cd24ffa2764bcf49e0540bba649829b180da20a62810d4a21ebf11529d4eca22c9ceaa93b434ca3fbfd0b636795f8109ea4e1eddbff8f3'
    'b4eeeb4b2801f3edcc7423f28403b1dfabd3f3869425e4f102a2a4554bde93e63bd73d2d4dbf3e5748ce831b570e441d3917f532fc5cceac1ee5e8fd0832cb30'
    '1fb1e4d9dcf0d54f98b2cf47a3a0cc6e6eed649617efab0e5631d9760b42eb85c7c421ba659656405f0f1d1087a80090baebb9f5f1154f4d0da9493dfa4a13c3'
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

    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    cmake -B build -G Ninja . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
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
    cd tdesktop-$pkgver-full
    ninja -C build install

    mv "$pkgdir/usr/bin/telegram-desktop"{,-bin}
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/telegram-desktop.sh" "$pkgdir/usr/bin/telegram-desktop"
}
