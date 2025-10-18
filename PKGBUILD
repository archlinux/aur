# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.3.3
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache-2.0')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mimblewimble/grin-wallet/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6f619aecbc0035040e96cc22741079b2be3aa0298b60e6c3b1474979903470174dc1721ec86dd6e2c9cbe8565b9b01079f62927323f375c85c00f1caa3915064')
options=(!lto)

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" target/release/grin-wallet
}
