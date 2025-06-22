pkgname=atar
pkgver=0.1.18
pkgrel=1
pkgdesc="Ephemeral Terraform runner that applies a configuration on start, displays output variables, and automatically destroys all resources on exit or failure."
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/atar"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("0fcdb1c0d16875275778f3f788e68d30c9dbf1926d444611d65ae225071e80f3")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
} 
package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
