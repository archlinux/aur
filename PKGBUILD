# Maintainer: Ross <git at ross dot ch>

pkgname=forgecode
pkgver=2.11.1
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
b2sums=('900286cc868786feaedd8f2f4cd1243caadae0aa94799ace519bddf53adc1296a68ea6a4c4cde459ba4aafecaaf42a51bff4444499b7218b670e41f6683d48ae')
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
