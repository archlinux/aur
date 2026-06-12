# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.4.1
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache-2.0')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mimblewimble/grin-wallet/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('571aa5c865a1d49262f528b1c7e9111c23f79c217298daa99c15ed7f9e6b0dea969f2d1683235021efa9d50cc12b0f17923ab6ca647f1bcda6ea764eb13e5ca2')
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
