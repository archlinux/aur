# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.3.0
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache-2.0')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mimblewimble/grin-wallet/archive/v$pkgver.tar.gz")
b2sums=('1785645e8a6f14727decdf29ad4ec89ab2b6514e025806be8016cc8604401d699cdfd7b48d5f2b2a3859a02acc54a042d44d55d68a695d6af9bac1d54a542f0a')
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
