# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=4.12.1
pkgrel=1
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL3')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt5-imageformats' 'qt5-svg' 'qt5-wayland' 'libdbusmenu-qt5' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'libsigc++-3.0')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
source=("https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
        "0001-kde-theme-injection-fix.patch"
        "0002-qt5-wayland-desktop-entry-fix.patch"
        "0003-qt5-lib-base-wayland-desktop-entry-fix.patch"
        "0004-qt5-disable-webview-linux-compositor.patch"
        "0005-qt5-lib-base-include-variant.patch")
sha512sums=('914baaac3bef91418b6da852291543ce83a680a4ec8d75882b184ffb0d06b41332faf71869bfad7ee5f34a3c6de0c50f14448769c83b71d7a3550df7f42f5e2d'
            'e78f6c769c026214efaf988dc3a2aac632909f553c348fd357fe8dc353646866238c5e30bbb0f420a4352be6b4efa32e582f3e3d8390772889f8933f54db491c'
            '13eb112ea6adb4d73cbc2b8f91c751e4e64ab87b686867f1d0edaff43d92633d383f20171bb4f279fa7cbbb16a92e1c4d87657116791950122bd88df61097e48'
            '2a5d2bf1b18f00c886e59df189df532648d899c2bb9a6cca7a801269aa3f4528c41e4a6a1a7219880ed68815ea821b8de64ce0ad4de90baa07d5b4a9b92006a2'
            '42cd4602adc58d968039d7046e957d3e16e5bd8f7d889d6438f8c684136367d104f40d0427d5c321d9f275584610d1d3ddec787f604bc949e317e6740c458bb9'
            '0857a8d2666d1e239a49c59214ce5e7e1f28401fff7207182eab297659cb62aaa222c1104512a49bb48770b693f0f3241388615814af7801d71e19e421182b0a')

prepare() {
    cd tdesktop-$pkgver-full
    patch -Np1 -i "$srcdir"/0001-kde-theme-injection-fix.patch
    patch -Np1 -i "$srcdir"/0002-qt5-wayland-desktop-entry-fix.patch
    cd Telegram/lib_base
    patch -Np1 -i "$srcdir"/0003-qt5-lib-base-wayland-desktop-entry-fix.patch
    patch -Np1 -i "$srcdir"/0005-qt5-lib-base-include-variant.patch
    cd ../../Telegram/lib_webview
    patch -RNp1 -i "$srcdir"/0004-qt5-disable-webview-linux-compositor.patch
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
    # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
    # Thanks @primeos!
    cmake -B build -S tdesktop-$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DQT_VERSION_MAJOR=5 \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    # Use Qt5 for the time being until mouse is not so broken (QTBUG-98720).
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
