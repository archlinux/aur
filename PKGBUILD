# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Original Author: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=5.12.3
pkgrel=1
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
        "0001-kde-theme-injection-fix.patch")
sha512sums=('cd366f6cecfc72396ae2b8453d015e85f1f579c60212f0b77f84057ba6caf6aa97d7ed08fde2ab8bf2f29017fdd7c0b617392ec74537be4f8445ef81ea135e5c'
            '6544086fd4946384509c053edd447a59e9ae405af65f9a7fa632ae5734099ef57b7211b7dbebf7a0c38665e05dd7c4d2414fa5d2cb5c6ee718cc5e824f5f509a')

prepare() {
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

