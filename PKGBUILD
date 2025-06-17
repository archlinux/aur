# Maintainer: Dmitry Valter <`echo ZHZhbHRlciA8YXQ+IHByb3Rvbm1haWwgPGRvdD4gY29tCg== | base64 -d`>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: hexchain <i@hexchain.org>
# Based on official PKGBUILD from Arch Linux with an annoying bug reverted
pkgname=telegram-desktop-kdefix
pkgver=5.15.4
pkgrel=1
pkgdesc='Telegram Desktop client with KDE unread counter bug reverted'
arch=('x86_64')
url="https://desktop.telegram.org/"
license=('GPL-3.0-or-later WITH OpenSSL-exception')
options=('!debug')
conflicts=('telegram-desktop')
provides=('telegram-desktop')
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
  'glib2'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libdispatch'
  'libheif'
  'libjxl'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'pipewire'
  'protobuf'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'xxhash'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
)
optdepends=(
  'geoclue: geoinformation support'
  'geocode-glib-2: geocoding support'
  'geocode-glib: geocoding support'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkit2gtk: embedded browser features provided by webkit2gtk'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)
install=telegram-desktop.install
_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9
source=(
  "https://github.com/telegramdesktop/tdesktop/releases/download/v${pkgver}/tdesktop-${pkgver}-full.tar.gz"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  "0001-kde-theme-injection-fix.patch"
)
sha512sums=('c7d549fad45342fc6218cf862ececad9b1a58a2f771757bf49c1092e6bd67a93e3128b24373b65a2646944f9acf6afe10f226da2b40b2d41bcb3c08096962bdc'
            'd622b8f3580ee49415546d025c4ba45f5b2de50b315fc379dc57c0427c5f815c7cc3820cca937c12182ee461641bb61f87ebc99b6c74a1a666cea9a08f0f41a0'
            '6544086fd4946384509c053edd447a59e9ae405af65f9a7fa632ae5734099ef57b7211b7dbebf7a0c38665e05dd7c4d2414fa5d2cb5c6ee718cc5e824f5f509a')

prepare() {
  cd tdesktop-$pkgver-full
  patch -Np1 -i "$srcdir"/0001-kde-theme-injection-fix.patch
}


build() {
  CXXFLAGS+=' -ffat-lto-objects'

  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build
  cmake --install td/build

  # Turns out we're allowed to use the official API key that telegram uses for
  # their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  cmake -B build -S tdesktop-$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
