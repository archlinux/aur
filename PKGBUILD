# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=3.5.0
pkgrel=2
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "0001-kde-theme-injection-fix.patch"
        "0002-qt5-compilation-fix.patch")
sha512sums=('5a86f8e3dd1b7fca2a615a2de86f9640f14bbf27b7e73f735dad60629ddb99bd5c951d7311f99c044ab6178a49ff997aae5e8da0f8bb6753fa7eecfb12562cef'
            '1d1dc0f59430a7fb994d696d36eaa3ed618c55ff0d686748de93017c2360dd8a74f2e706c7b7d99ff162228abc1e5b322fc9bda9e4c7cf7ac205434f6858356c'
            'bf77777eac9066a1ab5d6172018ecf3245ef5f90c8351adf25c426028a7ab548c2ef8bdaf263fc6ad927d92f28b8fc5202309671d7635aa30be8ebf1893f7c2e')

prepare() {
    cd tdesktop-$pkgver-full
    patch -p1 < $startdir/0001-kde-theme-injection-fix.patch
    cd cmake
    patch -p1 < $startdir/0002-qt5-compilation-fix.patch
}

build() {
    cd tdesktop-$pkgver-full

    export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
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
    # Use Qt5 for the time being until mouse is not so broken (QTBUG-99331).
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR="$pkgdir" ninja -C build install
    # They botched the release and put a lot of stuff here.
    rm -rf "$pkgdir/build"
}
