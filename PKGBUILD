# Maintainer: Rui Jiang <https://github.com/ruiiiijiiiiang>
pkgname=rs-top
pkgver=0.1.1
pkgrel=1
pkgdesc="A lightweight, agentless, and read-only remote system monitor with a TUI dashboard"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/rs-top"
license=('MIT')
depends=('gcc-libs' 'openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('626f910851fde0a58079675065a93f3f281a1012fdd41c0532fd7ce07b767688')

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

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
