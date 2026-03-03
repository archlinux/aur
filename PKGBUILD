# Maintainer: Mateusz Russak <mateusz@russak.biz>

pkgname=lazytail
pkgver=0.8.1
pkgrel=1
pkgdesc="A fast, universal terminal-based log viewer with live filtering and follow mode"
arch=('x86_64')
url="https://github.com/raaymax/lazytail"
license=('MIT')
depends=()
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/raaymax/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b302c6acab3f072b277203f4e5145575d854eb8e381e5fbc4a3b9d342e22031c')

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
