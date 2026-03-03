# Maintainer: Mateusz Russak <mateusz@russak.biz>

pkgname=lazytail
pkgver=0.8.2
pkgrel=1
pkgdesc="A fast, universal terminal-based log viewer with live filtering and follow mode"
arch=('x86_64')
url="https://github.com/raaymax/lazytail"
license=('MIT')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raaymax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d0e30834f9441d37767d98adc6f8e9a6fe815fe749da32c56017509bde9b32ea')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
