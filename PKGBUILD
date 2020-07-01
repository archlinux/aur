# Maintainer: Karol Fuksiewicz <kfuks2@gmail.com>

pkgname=telegram-desktop-wide
pkgver=2.1.16
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with wide message bubbles'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        wide-messages.patch)
sha512sums=('7bcd608030e0b48cf3350cecdffbcdafa7ff254b7b8c931a24b3c02813a60d5bbd523012febbd0d4aa80e0b991c3b09163419b7b5eaa76f2016cc56daed35045'
            'd350450a1e3b950a6df34a24caa340c848c83e0aa93acf95d80b1e5a5c39fe7e2ab122025a718861751541a0d8bfee35482cc13f261ea0fbce874e214213ddae')

prepare() {
    cd tdesktop-$pkgver-full
    patch -p0 < ../wide-messages.patch
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
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop"
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
