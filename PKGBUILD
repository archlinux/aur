# Maintainer: KspLite <ksplite@outlook.com>
pkgname=64gram-desktop
_pkgname=64Gram
pkgver=2.8.11.2
pkgrel=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'gtk3' 'glibmm'
         'webkit2gtk' 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'libtg_owt' 'extra-cmake-modules')
optdepends=('ttf-opensans: default Open Sans font family')
provides=("64gram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz"
        "fix-webview-extern-C-linkage.patch")
sha512sums=('2a7c3bfc966e2dd200c031a10eb8f6d42e716d8087fb84c54f5b8f2aeeeedee69d70c05cec2fcd1ec3317de9d027aab3994c3c7878e1b97ad299541fdd6a9223'
            '4150c4718d455a6d089e2c0c9c06956d24fdddae476c5790b62ee6a407ff4fb343ea4a4deca813252ed418142cc3791fa041b0771a994221e3be72b45a7b77ed')

prepare() {
    cd $_pkgname-$pkgver-full/cmake
    # force webrtc link to libjpeg and X11 libs
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
    echo "find_package(X11 REQUIRED COMPONENTS Xcomposite Xdamage Xext Xfixes Xrender Xrandr Xtst)" | tee -a external/webrtc/CMakeLists.txt
    echo "target_link_libraries(external_webrtc INTERFACE Xcomposite Xdamage Xext Xfixes Xrandr Xrender Xtst)" | tee -a external/webrtc/CMakeLists.txt

    # fix webview extern "C" linkage error
    cd ..
    patch -b -d Telegram/lib_webview/ -Np1 -i ${srcdir}/fix-webview-extern-C-linkage.patch
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
