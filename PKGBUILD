# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=44.0.0
pkgrel=1
pkgdesc="The DataFusion CLI is a command-line interactive SQL utility for executing queries against any supported data files."
url="https://github.com/apache/datafusion"
arch=(x86_64)
license=(APACHE)
options=("!lto")  # https://github.com/briansmith/ring/issues/1444
makedepends=(
  rustup
  cargo
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-datafusion/archive/tags/$pkgver.tar.gz")
b2sums=('5c8521872396426f85b2b2d6f82029b12ed59e83cfd6e1f4509016d6c4a9b2a79d437b79cd2d52cddb9180f7a5189327d8a3584068c0e1b31d98c7cc5014c951')

build() {
  export CARGO_TARGET_DIR=target
  cd "datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.80
  rustup component add rustfmt
  cargo build --release --locked
}

# check() {
#   cd "datafusion-tags-$pkgver"
#   cargo test --release --all-features --frozen
# }

package() {
  cd "datafusion-tags-$pkgver/datafusion-cli"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  cd ..
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 {README,CHANGELOG}.md
}
