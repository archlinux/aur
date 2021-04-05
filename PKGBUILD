# Maintainer: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop
_pkgname=64Gram
pkgver=2.7.1.2
pkgrel=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'libtg_owt')
optdepends=('ttf-opensans: default Open Sans font family')
provides=("64gram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz"
        "fix-tgcalls-gcc10.patch")
sha512sums=('b9f4e540d2d5e6b80a2934dbd2857743a28ca12135ca1a5d5acc9e365f35b2debff0f13e18d261eeda866082a7843776da31c874961909a5399ed66d23b30012'
            '05e3dcc3d090087525287bb9254a4440b44faa7443fa0f9f942e94c5e5ea3bad41b1df2e6f10594e173a1d41188a75e918118228f5715e537f3c3ac65346cb80')

prepare() {
    cd $_pkgname-$pkgver-full/cmake
    # force webrtc link to libjpeg
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    
    cd ../Telegram/ThirdParty/tgcalls
    patch -Np1 -i "$srcdir"/fix-tgcalls-gcc10.patch
}

build() {
    cd $_pkgname-$pkgver-full

    # Official API ID&Hash by default
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
    cd $_pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
