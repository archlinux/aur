# Maintainer: Funami
pkgname=cargo-clone
pkgver=1.2.1
pkgrel=1
pkgdesc="A cargo subcommand to fetch the source code of a Rust crate"
arch=('x86_64')
url="https://github.com/JanLikar/cargo-clone"
license=('APACHE' 'MIT')
depends=('libgit2' 'curl')
makedepends=('cargo' 'libssh2')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
        "https://raw.githubusercontent.com/JanLikar/$pkgname/v$pkgver/LICENSE-MIT")
sha256sums=('076ebb29cf42664b36b0aa01540412837bf902379434d5404536d5f99eb64b70'
            'e4a933f5a41e59573197d3100b2e6fbc46cbeeefa390a26034ecb475e475056a')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LIBSSH2_SYS_USE_PKG_CONFIG=1
  cargo build --frozen --release
}

package() {
  install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"

  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
}
