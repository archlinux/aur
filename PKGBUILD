# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet
pkgver=5.3.1
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('i686' 'x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache-2.0')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mimblewimble/grin-wallet/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ff608d08f068c6e7cab31b339e704c40e998b9a3c04c3fbcfeb0cc5e21c4b83ed2cffbd0fe03deca5a2b993c0ae432e8eafec9226af185a0d898d2566efcef5d')
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
