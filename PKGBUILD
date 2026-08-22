# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-applet-minimon
_app_id=io.github.cosmic_utils.minimon-applet
pkgver=1.2.0
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
sha256sums=('4dc34519199390836abca08384fa2e8c7a3d5452e75d7617abea0623e4cf7c21')

prepare() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "minimon-applet-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
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
