# Maintainer: Denis Kopin <deng@lixun.app>
pkgname=lixun-semantic
pkgver=0.7.10
pkgrel=1
pkgdesc="Lixun semantic sidecar worker: dense-vector hybrid retrieval via fastembed + LanceDB"
arch=('x86_64')
url="https://lixun.app"
license=('MIT OR Apache-2.0')
options=(!debug !lto)
depends=("lixun=$pkgver" 'gcc-libs' 'xz' 'libheif')
makedepends=('cargo' 'clang' 'cmake' 'protobuf')
_commit=8e7e8d5a9fba14df49c24a40a3abcd04eb9c1371
source=("lixun-$pkgver.tar.gz::https://github.com/dengkeping/lixun/archive/$_commit.tar.gz")
sha256sums=('a85f4e04fcf1705c7d41f8eed5e4d29cdc71af363df8e4e565a6f600434fc9dc')

prepare() {
  cd "$srcdir/lixun-$_commit"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked
}

build() {
  cd "$srcdir/lixun-$_commit"
  export CARGO_TARGET_DIR="$srcdir/target"
  export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=/usr/bin/gcc
  unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS
  cargo clean
  cargo build --release --frozen -p lixun-semantic-worker
}

package() {
  cd "$srcdir/lixun-$_commit"
  install -Dm755 "$srcdir/target/release/lixun-semantic-worker" \
    "$pkgdir/usr/lib/lixun/lixun-semantic-worker"

  install -Dm644 LICENSE-MIT     "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE  "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
