# Maintainer: Ilya Partanskiy <partanskiy.im@gmail.com>
pkgname=lyfy
pkgver=0.1.0
pkgrel=1
pkgdesc='Declarative system maintenance and Git-backed host state for Arch Linux'
arch=('x86_64')
url='https://github.com/partanskiy/lyfy'
license=('MIT')
depends=('glibc' 'libgcc' 'git' 'pacman' 'systemd')
makedepends=('cargo' 'python')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/partanskiy/lyfy/releases/download/v0.1.0/lyfy-v0.1.0-source.tar.gz")
sha256sums=('ba06631f48ec8583b99d0a74164e8ecc992dad61bbd0e98b10e4ab8716e6c4c2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target x86_64-unknown-linux-gnu
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  cargo build --frozen --release --target x86_64-unknown-linux-gnu --bin lyfy
  python3 scripts/license-notices.py target/THIRD_PARTY_LICENSES.txt
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LYFY_BUILD_VERSION="$pkgver"
  cargo test --frozen --target x86_64-unknown-linux-gnu --all-features
  test "$(target/x86_64-unknown-linux-gnu/release/lyfy --version)" = "lyfy $pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/x86_64-unknown-linux-gnu/release/lyfy "$pkgdir/usr/bin/lyfy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lyfy/LICENSE"
  install -Dm644 target/THIRD_PARTY_LICENSES.txt "$pkgdir/usr/share/licenses/lyfy/THIRD_PARTY_LICENSES.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/lyfy/README.md"
  install -Dm644 ARCHITECTURE.md "$pkgdir/usr/share/doc/lyfy/ARCHITECTURE.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/lyfy/config.example.toml"
  for document in configuration rules storage; do
    install -Dm644 "docs/$document.md" "$pkgdir/usr/share/doc/lyfy/$document.md"
  done
}
