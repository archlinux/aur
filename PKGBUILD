# Maintainer: mutex_lock
pkgname=pesde
pkgver=0.7.3
pkgrel=2
pkgdesc="A package manager for the Luau programming language supporting multiple runtimes including Roblox and Lune"
arch=('x86_64' 'aarch64')
url="https://github.com/pesde-pkg/pesde"
license=('MIT')
install=post.install

depends=()
makedepends=('cargo')
options=(!lto)

_regver=0.2.3

source=("$pkgname-$pkgver.tar.gz::https://github.com/pesde-pkg/pesde/archive/refs/tags/v$pkgver+registry.$_regver.tar.gz")
sha256sums=('18a1201a0f49892e90ada46ba64b2c7af7e2a7054569ab7e24157da6cdc31a05')

prepare() {
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
