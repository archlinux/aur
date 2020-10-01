# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

pkgname=telegram-desktop-userfonts
pkgver=2.4.0
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'qt5-wayland' 'gtk3')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libwebrtc')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
"Use-tg_owt-webrtc-fork.patch"
"Update-webrtc-packaged-build-for-tg_owt.patch::https://github.com/desktop-app/cmake_helpers/commit/d955882cb4d4c94f61a9b1df62b7f93d3c5bff7d.patch"
)
sha512sums=('8b62caadc97aacfc4d5313f3420dd258162d8ffd77acfbf27b7561b3dd7274248d90e37d304160d5bc0f5fedf7dbaa5b51e3b2b3cb8213c2ea4bb4c9b43ef6b1'
            '071591c6bb71435f8186dcaf570703718051f00366dbbe3f13c4df3706d3de1f168bff4bfa707ad1d6f09f5505c925f0b01d76fd65efe904f3ba7db693d63f43'
            'b3c44e76a3907f7acc197746b471564577e912bf0561e9576dc8459211c88f400716437bcaa10967376461c69c8a98a56477d26d3feb9ca34747d9208bf5f6c6')

prepare() {
    cd tdesktop-$pkgver-full
    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
    sed -i 's/DemiBold/Bold/g' Telegram/lib_ui/ui/style/style_core_font.cpp

    cd cmake
    patch -R -Np1 -i ${srcdir}/Update-webrtc-packaged-build-for-tg_owt.patch
    patch -R -Np1 -i ${srcdir}/Use-tg_owt-webrtc-fork.patch
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
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DDESKTOP_APP_WEBRTC_LOCATION=/usr/include/libwebrtc
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
