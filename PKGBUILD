# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-userfonts-altscroll
pkgver=4.14.15
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig and alt scroll mechanism in media view'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
options=('!debug')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'patch')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz" 'mediaview-altscroll.patch')
sha512sums=('12812fa1fd067fca03b2e5cb04502ef05e98368b91a4ed5458a61a0bea8b3d6daf6c32b7632c170fe0904acb63eb422f6fa6364e4af18f73e49659e2d50f531b'
            '38ff8627090ac9766a8d409fa26cbd4381640e08abcb677f4524a5305d011aa0f6ce81d69313a01f0db5c1a3794805bff2a059095258f5e8d9bd1133550cca2e')

prepare() {
    cd tdesktop-$pkgver-full

    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm "$ttf"
        touch "$ttf"
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp

    # https://github.com/telegramdesktop/tdesktop/pull/27245
    patch -Np1 < '../mediaview-altscroll.patch'
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
