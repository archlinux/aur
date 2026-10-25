# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-ext-applet-minimon
_app_id=io.github.cosmic_utils.minimon-applet
pkgver=1.3.0
pkgrel=2
pkgdesc="A COSMIC applet for displaying CPU/Memory/Network/Disk/GPU usage in the Panel or Dock."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ext-applet-minimon"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa5352f500a69ea475c04433a9908206c817ef41ae9e6478427772c2a657b77f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "res/${_app_id}.metainfo.xml"
  desktop-file-validate "res/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
