pkgname=atar
pkgver=0.1.25
pkgrel=1
pkgdesc="Ephemeral Terraform runner: applies on start, auto-destroys on exit or failure."
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/atar"
license=('MIT')
depends=('glibc')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("11ba4548a1a9bee7f36afbc9a8ed1ab869d30186a5e5a9d0e02c04e57ff3d641")

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
