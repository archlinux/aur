# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>

# Thanks Nicholas Guriev <guriev-ns@ya.ru> for the patches!
# https://github.com/mymedia2/tdesktop

pkgname=telegram-desktop-userfonts
pkgver=1.9.14
pkgrel=1
pkgdesc='Official Telegram Desktop client, with your fonts as set by fontconfig'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
depends=('enchant' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'xxhash' 'libappindicator-gtk3' 'libdbusmenu-qt5')
# for libappindicator-gtk3 see https://bugs.archlinux.org/task/65080

makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl')
optdepends=('ttf-opensans: default Open Sans font family')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        telegram-desktop.sh)
sha512sums=('56efa64048d23b280782b51319c0071c6cef833cb7e2584e52c6e45488577755beb85185ec9187029c425cc8d4c9c1887142687c744697e7731a15abe2846056'
            '3c21c871e28bac365400f7bc439a16ad1a9a8d87590ad764ce262f1db968c10387caed372d4e064cb50f43da726cebaa9b24bcbcc7c6d5489515620f44dbf56b')

prepare() {
    cd tdesktop-$pkgver-full
    mono=${TG_MONO:-$(fc-match monospace | sed -E 's/.*: "([^"]+).*"/\1/g')}
    echo -- Using $mono for monospace font
    echo -- To override, set TG_MONO and make from fresh sources
    sed -i "s/\"Consolas\"/\"${mono}\"/g" Telegram/lib_ui/ui/style/style_core.cpp
    for ttf in Telegram/lib_ui/fonts/*.ttf; do
        rm $ttf
        touch $ttf
    done
}

build() {
    cd tdesktop-$pkgver-full

    export CXXFLAGS="$CXXFLAGS -ffile-prefix-map=$srcdir/tdesktop-$pkgver-full="
    cmake -B build -G Ninja . \
        -Ddisable_autoupdate=1 \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_TEST=ON \
        -DDESKTOP_APP_USE_GLIBC_WRAPS=OFF \
        -DDESKTOP_APP_USE_PACKAGED=ON \
        -DDESKTOP_APP_USE_PACKAGED_FONTS=OFF \
        -DDESKTOP_APP_USE_PACKAGED_RLOTTIE=OFF \
        -DDESKTOP_APP_USE_PACKAGED_VARIANT=OFF \
        -DDESKTOP_APP_DISABLE_CRASH_REPORTS=ON \
        -DTDESKTOP_DISABLE_REGISTER_CUSTOM_SCHEME=ON \
        -DTDESKTOP_DISABLE_DESKTOP_FILE_GENERATION=ON \
        -DTDESKTOP_USE_PACKAGED_TGVOIP=OFF \
        -DDESKTOP_APP_SPECIAL_TARGET="" \
        -DTDESKTOP_LAUNCHER_BASENAME="telegramdesktop"
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    ninja -C build install

    mv "$pkgdir/usr/bin/telegram-desktop"{,-bin}
    install -dm755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/telegram-desktop.sh" "$pkgdir/usr/bin/telegram-desktop"
}
