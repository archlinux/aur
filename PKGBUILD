# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
_app_id=io.github.cosmic_utils.camera
pkgver=1.0.2
pkgrel=1
pkgdesc="Camera application for the COSMIC™ desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/camera"
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
source=("camera-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ef00ff76d3df7559215ab2be880618d6bfb9966d9bafe479331bc0fc0e644a5')

prepare() {
  cd "camera-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "camera-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "camera-$pkgver"
  just validate-metadata
}

package() {
  cd "camera-$pkgver"
  just rootdir="$pkgdir" install
}
