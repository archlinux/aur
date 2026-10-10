# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-applet-minimon
_app_id=io.github.cosmic_utils.minimon-applet
pkgver=1.3.0
pkgrel=1
pkgdesc="A COSMIC applet for displaying CPU/Memory/Network/Disk/GPU usage in the Panel or Dock."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/minimon-applet"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-applets'
  'cosmic-monitor'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('minimon-applet-for-cosmic')
source=("minimon-applet-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1aa1c88f3d1da05aec11a682283be73cbe14e5008216a3502a28fe236c65b4d4')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "minimon-applet-$pkgver"
  appstreamcli validate --no-net "res/${_app_id}.metainfo.xml"
  desktop-file-validate "res/${_app_id}.desktop"
}

package() {
  cd "minimon-applet-$pkgver"
  just rootdir="$pkgdir" install
}
