# Maintainer: Mateusz Russak <mateusz@russak.biz>

pkgname=lazytail
pkgver=0.7.0
pkgrel=1
pkgdesc="A fast, universal terminal-based log viewer with live filtering and follow mode"
arch=('x86_64')
url="https://github.com/raaymax/lazytail"
license=('MIT')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raaymax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('42b9c6fe7eae5bb22e07d91442e4e7b7f0bedc9a1e6eed81df9e09ae37845b68')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
