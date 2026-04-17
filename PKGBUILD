# Maintainer: Ross <git at ross dot ch>

pkgname=forgecode
pkgver=2.11.3
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
b2sums=('a3917e8b3da3ac51d624d1ea7c45f7d1e53b4903b7498a352b283e7b352ab7c5cfcf70b0177b637225d1021aa595b79e4de28af03127aa11dede304b3f0117ab')
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
