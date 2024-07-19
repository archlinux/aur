# Maintainer: Axel Kappel <aur@kappel.dev>
pkgname='quickshot'
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple xdg-desktop-portal based screenshot tool"
arch=('x86_64')
url="https://github.com/Kl4rry/quickshot"
license=('BSD-3-Clause')
depends=('xdg-desktop-portal')
makedepends=('cargo' 'mold' 'gzip')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
md5sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  RUSTFLAGS="-C link-arg=-fuse-ld=mold"
  cargo build --frozen --release
  target/release/$pkgname --generate-man > $pkgname.1
  gzip $pkgname.1
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -T $pkgname.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}