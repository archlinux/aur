# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=55.1.0
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
b2sums=('f72bf194e0f4caebdae466d611aa18de2672e980f15274132aed3f1f4ed3efedc612c4f4042b93c7d201b5e4ee73d5898e073fa5d5642a0bf051b88d49e4911a')

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
