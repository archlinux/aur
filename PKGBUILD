# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-camera
pkgver=1.3.1
pkgrel=1
pkgdesc="Camera application for the COSMIC™ desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ext-camera"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-icon-theme'
  'gst-plugin-pipewire'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'libcamera'
  'libinput'
  'libxkbcommon'
  'seatd'
  'systemd-libs'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'just'
  'nasm'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=(
  'cosmic-camera'
  'klikka'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8484de7eed0213bf70c458618f11ca3f9c2eb1ba6905f53b9968c66a7e7cda32')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  just validate-metadata
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
