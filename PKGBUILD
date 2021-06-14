# Maintainer: Andy Kluger <https://t.me/andykluger>
# Upstream PKGBUILD (community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
pkgname=telegram-desktop-userfonts
pkgver=2.7.4
pkgrel=2
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm' 'webkit2gtk')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libtg_owt')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        https://github.com/telegramdesktop/tdesktop/commit/71deaa48afab2bcf9df67b9b347b1f44aad3a9ce.patch
        https://github.com/telegramdesktop/tdesktop/commit/a8807bc915f2439acc7c84f06d931d96d6ca602a.patch
        "fix-webview-includes.patch")
sha512sums=('0a796d7a8c5e5982bc60f19c41da53996a609bf794fad224e7beea5fc3816b5cf35f16b0ec2cc7279085c69996063a44085f48e1596dfe746d260a2e8f1b2d14'
            'cabdadddc7a6873c7c6fc8128ceddf2712c0c73d3316520482162e5c67937bda2a627ddb2f078558a52e812c2a876351196488a5a75381d84a43815b873bac5b'
            '72ef9bddef1f40e09b9c4334153f1ab8aaddf63d95d9f25dc1b0a0826b7f2ae24f7c5fc4cb5ce90aae2c3144a5d52c4cb870d643f447d654190c4a2c78079354'
            '5492c73f0b984da1e2d1f21c3a36c11c4b9ad511522dccd4d6440681f68d6ebc9e672806a534b1e551f736f080d3ef307c8ddd012e4646bd84d09c5e8fa85a40')

prepare() {
    cd tdesktop-$pkgver-full
    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp
    cd ..

    cd tdesktop-$pkgver-full/cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    cd ../Telegram/lib_webview
    patch -Np1 -i "$srcdir"/fix-webview-includes.patch

    cd ..
    patch -Np2 -i "$srcdir"/71deaa48afab2bcf9df67b9b347b1f44aad3a9ce.patch
    patch -Np2 -i "$srcdir"/a8807bc915f2439acc7c84f06d931d96d6ca602a.patch
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
