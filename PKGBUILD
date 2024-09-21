# Maintainer: Mark Wagie <mark dot wagie & proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=decoder
pkgver=0.6.0
pkgrel=1
pkgdesc="Scan and Generate QR Codes"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/Decoder"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugins-bad'
  'gst-plugins-base'
  'gstreamer'
  'libadwaita'
  'zbar'
)
makedepends=(
  'cargo'
  'meson'
)
source=("https://gitlab.gnome.org/World/decoder/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('167923f5f4c4d9a5ea463f66c58acb46c618264705e4b2036cfee1e8a805a761')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
