# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Andy Kluger <https://t.me/andykluger>
# Contributor: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>

# Upstream PKGBUILD (telegram-desktop in community repo):
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: hexchain <i@hexchain.org>

pkgname=telegram-desktop-altscroll-kdefix
pkgver=5.8.2
pkgrel=1
conflicts=('telegram-desktop')
provides=('telegram-desktop')
pkgdesc='Modified Telegram Desktop client, changes: disable built-in unread indicator (so KDE unread counter can be used), alt scroll mechanism in media view.'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL-3.0-or-later')
options=('!debug')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'libxcomposite' 'libxdamage' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'kcoreaddons' 'openh264')
makedepends=('patch' 'cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging'
             'glib2-devel')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "kde-theme-injection-fix.patch"
        "mediaview-altscroll.patch") # https://github.com/telegramdesktop/tdesktop/pull/27245
sha512sums=('686d5eae922f3be1198931add00aa9716161a360242cb812a9078a771c40a64d3a396ddf1f922f0e76eaf7b1f7c909ce55aac9ad50ebf3db19d80c9cea00b6d8'
            '7b3dd58276cbe2145887e3c127519a461be83485d9874c08d98d21e97bfb194a4355d0766746157b20d15027db8c265600b5d279cc07456153b2a2736832bae6'
            '38ff8627090ac9766a8d409fa26cbd4381640e08abcb677f4524a5305d011aa0f6ce81d69313a01f0db5c1a3794805bff2a059095258f5e8d9bd1133550cca2e')

prepare() {
    cd tdesktop-$pkgver-full

    # patching
    for patch in "${source[@]}"; do
        if [[ $patch == *.patch ]]; then
        msg2 "Applying $patch"
        patch --no-backup-if-mismatch -Np1 -i "$srcdir/$patch"
        fi
    done
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_CXX_FLAGS=-g0 \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "tdesktop-$pkgver-full/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
