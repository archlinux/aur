# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>

pkgname=gst-plugin-gtk4
pkgver=0.11.2
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
sha256sums=(33970273495544e54d5f486d761b09d402f0cf8760990e1ea508bd5141f8ebeb)

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
