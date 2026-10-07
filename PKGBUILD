# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=55.2.0
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
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/apache/datafusion/archive/tags/$pkgver.tar.gz"
)
b2sums=('774bbc14a8a2c6e5dd8b9adbde8c41c33bf7590dcbe008fbbff9c3eb9f280df16b0d4e65faeb1c5f1269df29d96d3274b167355b35dee109f865804741ae9809')

prepare() {
  cd "datafusion-tags-$pkgver"
  cargo fetch --locked
}

build() {
  cd "datafusion-tags-$pkgver/"
  cargo build -p datafusion-cli --release --locked --offline
}

# check() {
#   cd "datafusion-tags-$pkgver"
#   cargo test --release --all-features --frozen
# }

package() {
  cd "datafusion-tags-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 {README,CHANGELOG}.md
}
