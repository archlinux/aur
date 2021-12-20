# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=licensure
pkgver=0.2.0
pkgrel=1
pkgdesc="A software license header and copyright mangement tool"
arch=('x86_64')
url="https://github.com/chasinglogic/licensure"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'Cargo.lock'
)
sha512sums=('f5b7b1e50e27eb5607e40667c4a50ef3347cb59b1f8e9b1d179640338582c66e62bb3114b03a5372b4947c41af098f965ffeed38527c8ca8f921a96e259a17e2'
            '8ffb8c22f649f6232ce185c6c9d5d0b09426dac21bfad94bbbb7756c3b1d1988caf7305baa0c53c3342c4b7a3008835942a1b38e8de4b22ae1ea55551ee36a76')
b2sums=('9f2106afbd07c47d343f47b5d68cdb28f9a84aa4acc8386f81ac25bca523fe4f1b419e623eca2465915897306c7f18ceb17852a366eb651b9bd577c489fc1868'
        '92132bf8c40acaa542d858794ce917b02f292d58716b3d057ec623ad58ff8124f21dc102eb78fd7d2e6e3e73992b350731f97e5cb327ecff314e110ab4a4f74d')

prepare() {
  cd "$pkgname-$pkgver"

  # fix serde/derive version mismatch
  sed -i "s/^serde = { version = \"0.2.0/serde = { version = \"1.0.0/" Cargo.toml

  # use pre-generated Cargo.lock
  cp -vf ../Cargo.lock .

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

# ref: https://github.com/chasinglogic/licensure/issues/17
#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen --all-features
#}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
