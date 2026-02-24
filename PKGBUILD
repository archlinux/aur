# Maintainer: Umar Alfarouk <medrivia@gmail.com>

# NOTE: x86_64 build requires `options=(!lto)` to prevent LTO from poisoning ring's C symbol visibility.

pkgname=surrealmcp
pkgver=0.4.0
pkgrel=1
pkgdesc="The official MCP server for SurrealDB"
arch=('x86_64' 'aarch64')
url="https://github.com/surrealdb/surrealmcp"
license=('custom:BSL')
depends=('rocksdb')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/surrealdb/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a051fc107b02114767a6762fb7dda92e0c16da7ba1b30bab405e2f6c3af594b')

# Disable LTO: Arch's system-wide LTO (options=(...lto)) poisons ring's C symbol visibility
# causing "undefined symbol: ring_core_0_17_14__LIMBS_less_than" errors
# https://github.com/briansmith/ring/issues/2746
[[ $CARCH == 'x86_64' ]] && options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  
  export CARGO_TARGET_DIR="$PWD/target"
  export ROCKSDB_LIB_DIR=/usr/lib
  
  cargo build --release --frozen
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 target/release/surrealmcp "$pkgdir/usr/bin/surrealmcp"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 AUTHENTICATION.md "$pkgdir/usr/share/doc/$pkgname/AUTHENTICATION.md"
}
