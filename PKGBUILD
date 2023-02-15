# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=4.6.2
pkgrel=1
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl-1.1' 'protobuf')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "0001-kde-theme-injection-fix.patch"
        "0002-fix-optional.patch")
sha512sums=('9a52cecb2ccde6e1381045b1c96730c63c5f19ca188a1be3bc905762f6e356906b7be141e8d373473390c21bc8b48ef7d5f4ee43bb09229a96b82c4fd974b531'
            'e78f6c769c026214efaf988dc3a2aac632909f553c348fd357fe8dc353646866238c5e30bbb0f420a4352be6b4efa32e582f3e3d8390772889f8933f54db491c'
            'ea7679437cad2deb25ae66252f877e9a93eaa8028e0d0684095f29414ddf3d3103c07197d1457528067acdc3110140230143b3ff0c077ffb207b0c24a30bb194')

prepare() {
    cd tdesktop-$pkgver-full
    rm -rf Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl
    patch -Np1 -i "$srcdir"/0001-kde-theme-injection-fix.patch
    patch -Np1 -i "$srcdir"/0002-fix-optional.patch
}

build() {
    cd tdesktop-$pkgver-full

    #Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake \
        -B build \
        -G Ninja \
        -DQT_VERSION_MAJOR=5 \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    # Use Qt5 for the time being until mouse is not so broken (QTBUG-98720).
    ninja -C build
}

package() {
    cd tdesktop-$pkgver-full
    DESTDIR="$pkgdir" ninja -C build install
    # They botched the release and put a lot of stuff here.
    rm -rf "$pkgdir/build"
}
