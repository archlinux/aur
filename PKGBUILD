# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=52.0.0
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
b2sums=('f67e9a4432df3bb6464a07b43afef1e9561ef80b3385797c4cc5d83ded40932285aca2496ab97233f2f61f44146b14c7c2f03aa88248e90ac85533f4b2b6e262')

build() {
  export CARGO_TARGET_DIR=target
  cd "datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.88.0
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
