# Maintainer: Den Ivanov <securityxiii@gmail.com>

pkgname=telegram-desktop-wide
pkgver=3.0.0
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with wide message bubbles'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=(
    desktop-file-utils
    glib2
    hicolor-icon-theme
    libdbus
    libx11
    ffmpeg
    minizip
    qt5-imageformats
    rnnoise
)
makedepends=('chrpath' 'cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'kwayland' 'libtg_owt' 'microsoft-gsl' 'extra-cmake-modules')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        wide-messages.patch
        fix-qt-build.patch)
sha512sums=('2439de9e11fa6150f4306a0da79a20b1552e4432cf669764669e4bf2eca7311b031e8b22c23cde1efe640e1ef2ac71916fd7151d31b475cbaabc78d79ee50415'
            'd350450a1e3b950a6df34a24caa340c848c83e0aa93acf95d80b1e5a5c39fe7e2ab122025a718861751541a0d8bfee35482cc13f261ea0fbce874e214213ddae'
            '850421cd5700df1c33af7b7f8aaf57b60a51e9694250068149c3221e750214f860665987e0f6aadd077c13e9c04c2f0662f0a58dce9d3085d96d7fdcd42ca81b')

prepare() {
    cd tdesktop-$pkgver-full
    patch -p0 < ../wide-messages.patch
#    patch -p0 < ../fix-qt-build.patch
    cd cmake
    echo "target_link_libraries(external_webrtc INTERFACE jpeg)" | tee -a external/webrtc/CMakeLists.txt
}

build() {
    cd tdesktop-$pkgver-full

    # export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    cmake -B build -G Ninja . \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF \
        -DDESKTOP_APP_USE_PACKAGED_GSL=OFF \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop" \
	-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
