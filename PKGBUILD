# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=canoe
pkgver=0.3.1
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
            'e5d39d55f62644afafe3555b7b33884347ddb1f8a34195a3e5596a257a1bff3c')

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

