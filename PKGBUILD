# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-camera
_app_id=io.github.cosmic_utils.camera
pkgver=0.3.4
pkgrel=1
pkgdesc="Camera application for the COSMIC™ desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/camera"
license=('GPL-3.0-or-later')
depends=(
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
optdepends=('networkmanager: D-Bus access for WiFi connection from QR codes')
source=("camera-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9710f1a14adb44f35d596b8d3fa6eb52c64ff82469001857d44fc79d6978298d')

prepare() {
  cd "camera-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  export RUSTUP_TOOLCHAIN=stable
  just test --frozen

  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd "camera-$pkgver"
  just rootdir="$pkgdir" install
}
