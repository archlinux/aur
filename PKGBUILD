# Maintainer: Mazhar Hussain <realmazharhussain@gmail.com>

pkgname=gst-plugin-gtk4
pkgver=0.11.0
pkgrel=3
pkgdesc="Multimedia graph framework - GTK4 plugin"
arch=(x86_64)
url="https://crates.io/crates/$pkgname"
license=(MPL2)
depends=(gstreamer gtk4)
makedepends=(cargo cargo-c)
provides=(libgstgtk4.so)
conflicts=(gst-plugins-rs)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=(c3ee0132150ee059c35642b51c5d663eadb9fa4d21f83a56dd584b03c1c45ffd)

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
