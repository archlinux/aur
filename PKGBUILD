# Maintainer: Ross <git at ross dot ch>

pkgname=forgecode
pkgver=2.13.2
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
b2sums=('d65f8e556e52f6e83633bf13b375ce0220db65b06d5409db2d92810b150b13431dab2ec03ab6b52d48bead4a5cc5a687b9b56fc4751ea1151e91e675ab89644e')
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
