# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=canoe
pkgver=0.4.0
pkgrel=1
pkgdesc="Stacking window manager for River with a classic look and feel written in Rust"
arch=('x86_64')
url="https://github.com/roblillack/canoe"
license=('MIT')
depends=('wayland' 'river')
makedepends=('cargo-nightly')
install=canoe.install
source=(
  #This project does not include the license inside its repository
  #as a file so we need to use our own
  LICENSE
  https://github.com/roblillack/canoe/archive/refs/tags/v"$pkgver".tar.gz
)
sha256sums=('6033278424fe66af6e6397b4e1a2dfdd621693586a32a5320640a17dc459993d'
            '5fb414f73e1d8b83772e90ed6fd453e1429ebe2bceb78369228145a5a51af8f5')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --all-features
}
check(){
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}
package() {
  install -Dm0744 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

# vim:set ts=2 sw=2 et:

