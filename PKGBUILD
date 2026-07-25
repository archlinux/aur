# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=musicfetch
_app_id="net.fhannenheim.$pkgname"
pkgver=1.5.1
pkgrel=2
pkgdesc="Download and tag music from YouTube"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Frieder_Hannenheim/musicfetch-ng"
license=('GPL-3.0-or-later')
depends=(
  'cosmic-icon-theme'
  'deno'
  'libxkbcommon'
  'openssl'
  'vulkan-icd-loader'
  'wayland'
  'xdg-user-dirs'
  'yt-dlp'
  'yt-dlp-ejs'
)
makedepends=(
  'cargo'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('f6bb6b063623b7237d7f8ffc6c2131a0e9ee224584a741ad1a0013c5607304df')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar xf "$pkgname-$pkgver.tar.gz" --strip-components 1 -C "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
