# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=ad
pkgver=0.3.1
pkgrel=1
pkgdesc='An adaptable text editor'
arch=('x86_64')
url="https://github.com/sminez/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('809cd09550daf38b1c4b7d19b975e6dbeb85f424f8942f20fc9cd7808c1ef196')
makedepends=('cargo' 'tree-sitter-python' 'tree-sitter-rust')
depends=('gcc-libs' 'tree-sitter')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so -C link-arg=/usr/lib/libtree-sitter-python.so -C link-arg=/usr/lib/libtree-sitter-rust.so"
  cargo test --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 "docs/man/$pkgname.1" -t "$pkgdir/usr/share/man/man1"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R docs/* "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
