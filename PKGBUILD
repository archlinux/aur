# Maintainer: Ross <git at ross dot ch>

pkgname=forgecode
pkgver=2.12.5
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
b2sums=('99395d1f6ab1ca44fd73e6ccb9178a4d38fb0c499e8a620e04a1647fbc6c01096ed13c2448beb2de2bab92d48a983f3b744bfe75b9f435eb42a02678bdbd3714')
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
