# Maintainer: Ross <git at ross dot ch>

pkgname=forgecode
pkgver=2.12.2
pkgrel=1
pkgdesc="An AI-powered code assistant CLI tool"
arch=('x86_64' 'aarch64')
url="https://github.com/antinomyhq/forgecode"
license=('Apache-2.0')
provides=('forge')
conflicts=('forge')
depends=(
  'fzf'
  'bat'
  'fd'
)
makedepends=(
  'cargo'
  'protobuf'
  'cmake'
  'clang'
)
optdepends=('git: For git-related operations')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8c4ce52b95d8a2cc797554e44598d2bcf57d5952f3429326bf0e06a40149f6d4d8b18224bc52467de56d65d6f8f976c5bbbe6be545ccdf7308d467e248a3a260')
options=(!lto)

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  APP_VERSION="$pkgver" cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --workspace
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/forge"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
