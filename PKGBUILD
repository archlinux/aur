# Maintainer: Sergey Mezentsev <thebits@yandex.ru>

pkgname=datafusion-cli
pkgver=53.0.0
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
  "$pkgname-$pkgver.tar.gz::https://github.com/apache/arrow-datafusion/archive/tags/$pkgver.tar.gz"
  "895d852.patch"
)
b2sums=('dabc271a2d0b18aed09709b18813ce1d1f16f1c1feae0098ac8382a5e946f281becb0a9ddeb7d3be7fcc610db67c144f6c889f148a315be36989e587fcffeb7e'
        'b02cebe4848ee754f02150fcfed8ea35b370deb708720945fd4749b60c5dd39c6b8bb3358be40b315b1cd0de78424dd3a621466f54de27ac79b3fb87fa242e63')

prepare() {
  # Updating aws-lc-sys to 0.39.0 to fix build failure caused by `cc` crate: https://github.com/aws/aws-lc-rs/pull/1064
  patch -d "datafusion-tags-$pkgver" -Np1 -i ../895d852.patch
}


build() {
  cd "datafusion-tags-$pkgver/"
  cargo build -p datafusion-cli --release --locked
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
