# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-userfonts
pkgver=4.9.5
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'libsigc++-3.0')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        https://download.gnome.org/sources/glibmm/2.77/glibmm-2.77.0.tar.xz)
sha512sums=('c0a33d07cfabf3b4360a9324cbee48c1e1dd91b5b2e7e0dc4852007c4e7149d9a474e3b448f937713dc3e4a42008ba3334a433674ec0c3ed6a0a4474f174f83c'
            '6650e822de2529582d93291025500afb6a182a0c5a564f656f164d79d8765bb4ca9c9d16227148431cc71c2677923b9364e81bbd4ca4f07f68e36bb380fb9574')

prepare() {
    cd tdesktop-$pkgver-full

    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Telegram currently needs unstable glibmm so we bundle it in as static libs.
    # This isn't great but what can you do.
    meson setup -D maintainer-mode=true --default-library static --prefix "$srcdir/glibmm" glibmm-2.77.0 glibmm-build
    meson compile -C glibmm-build
    meson install -C glibmm-build

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    export PKG_CONFIG_PATH="$srcdir"/glibmm/usr/local/lib/pkgconfig
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_PREFIX_PATH="$srcdir/glibmm" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
