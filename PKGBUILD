# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=licensure
pkgver=0.1.3
pkgrel=1
pkgdesc="A software license header and copyright mangement tool"
arch=('x86_64')
url="https://github.com/chasinglogic/licensure"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" 'Cargo.lock')
sha512sums=('b2daef0dabd562000f932ddbb1e54f840712e06fc9acdbf5fa64ce5d988f01dc0789c611b56d19ed6041933bdf51f9c09e48b99cc4b1b83ae956d77a6490c917'
            '9cc8b289406e3e0f2515c280732bdb08df865e312d500f3e5faa5ff8329887540792c532f952bbf065fcabb4d9f0513c86a63e5f5f1c056a8c05525787fa5da0')
b2sums=('79217d914eb05959c2411e2db018b3e3379e4ad26c63d214ff754565da22c22415912c28978bd00727bea308701f23d349995c1f810915822d8da1f336256063'
        '778bea5b826bb820d194e3ea2364911aaeac22f17831d2ea24a4237d1e764dcb64e8259673f662ca018bd48bdfb7b5c8248eb8436860e18848438b86da42774e')

prepare() {
  cd "$pkgname-$pkgver"

  # use pre-updated Cargo.lock
  cp -vf ../Cargo.lock .

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

# Issue raised upstream: https://github.com/chasinglogic/licensure/issues/10
#check() {
#  cd "$pkgname-$pkgver"
#  cargo test --frozen --all-features
#}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc" README.md
}
