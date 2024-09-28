# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=5.5.5
pkgrel=2
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
options=('!debug')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'openh264')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging'
             'glib2-devel')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "0001-kde-theme-injection-fix.patch"
        "telegram-desktop-5_5_5-fix_build_with_cppgir.patch")
sha512sums=('88cd526fb02b7b0459cb1bd1b0c57147b2261e57c392d2cb62964015ef6b26e202fba717b35d74201c41becf0a5d78ef4d9d593b5666b3f0a0db646e40bfd1fc'
            '6cfe49956da17cb7d7fa108cb922bab78865cddfe1863238c64b9ef22d2c138b24491de091f011d723babc4ed771a60d4e5a3a78dd9472ed3600b19aaf79ae65'
            'a65bca7d330519657fa647922df4c6d69f3d6af4008656084945a3c448aad62f228f91de8c5988cd9163856f376c0c136254eb68f6c9654ffdf9f5d3f52bc235')

prepare() {
    patch -Np1 -d tdesktop-$pkgver-full/cmake/external/glib/cppgir -i "${srcdir}/telegram-desktop-5_5_5-fix_build_with_cppgir.patch"
    cd tdesktop-$pkgver-full
    patch -Np1 -i "$srcdir"/0001-kde-theme-injection-fix.patch
}


build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

