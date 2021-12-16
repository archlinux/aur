# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=3.3.0
pkgrel=1
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk' 'libtg_owt')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "0001-kde-theme-injection-fix.patch")
sha512sums=('ff0ac1abe264f19812c2e0b40d4861caddd6c01a3f863ccb68de9c5227282872b2bde878dcf751d7d04d36c6e0e77912619ac7863d54f25f739f3744e9bca53a'
            "7758b6b33e498e70361f0032b46062828058615521fa99bab6182d493a06569de14636ff0ab7ac6041dfcfa1ef2bbf3679c84532361a32f2021fd6b60a8a39e2")

prepare() {
    cd tdesktop-$pkgver-full
    patch -p1 < $startdir/0001-kde-theme-injection-fix.patch
}

build() {
    cd tdesktop-$pkgver-full

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake \
        -B build \
        -G Ninja \
        -DDESKTOP_APP_QT6=off \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    # Use Qt5 for the time being until kwayland has an easier way to work with Qt6.
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
