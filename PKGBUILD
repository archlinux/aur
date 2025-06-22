pkgname=atar
pkgver=0.1.23
pkgrel=1
pkgdesc="Ephemeral Terraform runner: applies on start, auto-destroys on exit or failure."
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/atar"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("d28d7cba8d90a672bf2be4d2a69b54a50872e334465006c5ed70939ba9c2dd13")

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
