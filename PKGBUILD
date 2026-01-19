# Maintainer: mutex_lock
pkgname=pesde
pkgver=0.7.2
pkgrel=1
pkgdesc="A package manager for the Luau programming language supporting multiple runtimes including Roblox and Lune"
arch=('x86_64' 'aarch64')
url="https://github.com/pesde-pkg/pesde"
license=('MIT')

depends=()
makedepends=('cargo')
options=(!lto)

_regver=0.2.3

source=("$pkgname-$pkgver.tar.gz::https://github.com/pesde-pkg/pesde/archive/refs/tags/v$pkgver+registry.$_regver.tar.gz")
sha256sums=('6b2f8af189875e28197c3157acee57342d8dd12416c47c064a002b8b17539448')

prepare() {
  ls
  cd "$pkgname-$pkgver-registry.$_regver"
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver-registry.$_regver"
  export CARGO_TARGET_DIR=target
  cargo build --locked --release --all-features
}

check() {
  cd "$pkgname-$pkgver-registry.$_regver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver-registry.$_regver"

  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
