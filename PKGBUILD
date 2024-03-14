# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=impression
pkgver=3.1.0
pkgrel=1
pkgdesc="A straight-forward modern application to create bootable drives."
arch=('x86_64')
url="https://apps.gnome.org/Impression"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'udisks2')
makedepends=('blueprint-compiler' 'cargo' 'meson')
checkdepends=('appstream')
source=("https://gitlab.com/adhami3310/Impression/-/archive/v$pkgver/Impression-v$pkgver.tar.gz")
sha256sums=('d5f61e8a2d3eab07ac9aa7ae827da8a5d6b9d39f678fa357775a11e99b2f7cbd')

prepare() {
  cd "Impression-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Impression-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
