# Maintainer: Funami
pkgname=cargo-clone
pkgver=1.0.1
pkgrel=2
pkgdesc="A cargo subcommand to fetch the source code of a Rust crate"
arch=('x86_64')
url="https://github.com/JanLikar/cargo-clone"
license=('APACHE' 'MIT')
depends=('libgit2' 'curl')
makedepends=('cargo' 'libssh2')
source=("https://github.com/JanLikar/cargo-clone/archive/v$pkgver.tar.gz")
sha256sums=('7cc5cc00124b92efa8c914d0b088c8314783f1a7450de49e3dfba9cc7c1f5330')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
