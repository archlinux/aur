# Maintainer: Kim Nielsen <github@insecurity.dk>
pkgname=axon-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Runs named requests from a .http file, authenticating via .netrc, and prints the responses curl-style, or as JSON"
arch=('x86_64' 'aarch64')
url="https://github.com/desdic/axon-cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
# ring's C code built with -flto emits GCC bitcode that rust-lld can't link
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b0524fdc152ad118ffa482824a44f6a275afe00eabcb53d4287757102267c2ac')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --offline --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --offline --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/axon-cli "$pkgdir/usr/bin/axon-cli"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
