# Maintainer: KspLite <ksplite@outlook.com>
pkgname=tdesktop-x64
pkgver=2.7.1.1
pkgrel=1
pkgdesc='Third party Telegram Desktop client with various enhancements'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libtg_owt')
optdepends=('ttf-opensans: default Open Sans font family')
provides=("tdesktop-x64")
conflicts=("telegram-desktop")
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${pkgname}-${pkgver}-full.tar.gz"
        "fix-tgcalls-gcc10.patch")
sha512sums=('10c0ebe868a69dca5e3880bd5256113237a05169a4ca2e26e530b74b6a111b65d2431c5cdc0e94309a8daddbab61dcc55ee42b909259c66f29c27224d2d43f36'
            '05e3dcc3d090087525287bb9254a4440b44faa7443fa0f9f942e94c5e5ea3bad41b1df2e6f10594e173a1d41188a75e918118228f5715e537f3c3ac65346cb80')

prepare() {
    cd $pkgname-$pkgver-full/cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    
    cd ../Telegram/ThirdParty/tgcalls
    patch -Np1 -i "$srcdir"/fix-tgcalls-gcc10.patch
}

build() {
    cd $pkgname-$pkgver-full

    # Upstream is using the same API ID&Hash as the official one
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    ninja -C build
}

package() {
    cd $pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
