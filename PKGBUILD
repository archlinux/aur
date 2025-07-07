pkgname=fyrox-template
pkgver=0.36.2
pkgrel=1
pkgdesc="Command line interface for project template generator for Fyrox engine"
arch=('x86_64')
url="fyrox.rs"
license=('MIT')
depends=('gcc-libs'
         'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('426922b219e96f07dbb2a128bf85ef97150024d302ef2fa0016dd8ce3dc1843512940686968571b56d2704c11924d81d67288b0e73b7afef410b6daf7adf0755')

prepare() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
