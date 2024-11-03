# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=42.1.0
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
b2sums=('6df81761076dd5a0680a0a28827be23286252856f1adf67991790d8da6a839c586f73b40fdfc7699ffd09b345169557a7358160a14fc7323ab004f747080e4e3')

build() {
  export CARGO_TARGET_DIR=target
  cd "datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.79
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
