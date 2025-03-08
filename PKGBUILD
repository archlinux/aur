# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=46.0.0
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
b2sums=('6b0f9026fcb18d9560cfa3c415af38a3ac1da68d8d24f0cf97721a056b2d976f27b9fb0a322d02bb22e11c2765a5ba780a91cee41c0cae3dac9b7ae10283b4ee')

build() {
  export CARGO_TARGET_DIR=target
  cd "datafusion-tags-$pkgver/datafusion-cli"
  rustup override set 1.82
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
