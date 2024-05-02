# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>

pkgname=gst-plugin-gtk4
pkgver=0.12.5
pkgrel=1
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(x86_64)
url="https://crates.io/crates/$pkgname"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(cargo cargo-c)
provides=(libgstgtk4.so)
conflicts=(gst-plugins-rs)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=(56e483cb1452f056ae94ccd5f63bdec697e04c87b30d89eb30c3f934042e1022)

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

_cargo_opts=(--all-features
             --frozen
             --release
             --prefix=/usr
             --library-type=cdylib)

build(){
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo cbuild "${_cargo_opts[@]}"
}

package() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo cinstall "${_cargo_opts[@]}" --destdir="$pkgdir"
}
