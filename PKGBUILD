# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=ad
pkgver=0.3.0
pkgrel=1
pkgdesc='An adaptable text editor'
arch=('x86_64')
url="https://github.com/sminez/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('86c759384f792d9cfbf3b3fab38df9e935ebea9c1765dfa5f6139f319f38ca45')
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
