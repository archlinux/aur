# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-userfonts
pkgver=2.4.7
pkgrel=4
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libtg_owt')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz")
sha512sums=('712ab6896f89f7df0c7ac297039ee3b3532c159e17f66e4539b701a35d04d4709b558755d592d3cd91df541a2d2ca9f0485cf073c32f0b69a18848ab2ccd1993')

prepare() {
    cd tdesktop-$pkgver-full
    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp

    cd cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
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
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_SPECIAL_TARGET=""
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
