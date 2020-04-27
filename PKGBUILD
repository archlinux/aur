# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

# Thanks to github.com/ilya-fedin/lib_ui-1 (system-font branch)

pkgname=telegram-desktop-userfonts
pkgver=2.1.0
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libdbusmenu-qt5')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        userfonts.patch)
sha512sums=('46f5453c64d1dbd4cf8adde73fcc48e6b6f795972ab0f6516cb55112f47d5af990a049da356bedb81e6d3f7103c14a7be45369ff9a5a1812c07a1bfcda70646d'
            '591571d04820e61e7cf95ec556d7403d52c11ce32d46fe98f2c4678eef5bbb718a14839c4b093a2e83c2995040887b801209d60859ab796e22f53a42968e80de')

prepare() {
    cd tdesktop-$pkgver-full
    patch -p1 < ../userfonts.patch
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
