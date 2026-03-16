# Maintainer: Mateusz Russak <mateusz@russak.biz>

pkgname=lazytail
pkgver=0.9.0
pkgrel=1
pkgdesc="A fast, universal terminal-based log viewer with live filtering and follow mode"
arch=('x86_64')
url="https://github.com/raaymax/lazytail"
license=('MIT')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raaymax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('750d24bfc59eb0f7caa78a8846b7c68033f12df7feb582b07a90721b4e684bd4')

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
