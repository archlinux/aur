# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=malachite
_pkgname=mlc
pkgver=2.1.0
pkgrel=1
pkgdesc='Tool for packaging and maintaining pacman repositories'
arch=('x86_64' 'aarch64')
url="https://github.com/crystal-linux/malachite"
license=('GPL3')
depends=('git' 'pacman-contrib' 'gnupg')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('187992fe21bbb6373d4af8ec39c23e75c63725b00ff762b162e70bd4d49ae6c1')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 644 docs/COMMON_FEATURES.md "${pkgdir}/usr/share/doc/${_pkgname}/COMMON_FEATURES.md"
    install -Dm 644 docs/GETTING_STARTED.md "${pkgdir}/usr/share/doc/${_pkgname}/GETTING_STARTED.md"
    install -Dm 644 docs/REPOSITORY_MODE.md "${pkgdir}/usr/share/doc/${_pkgname}/REPOSITORY_MODE.md"
    install -Dm 644 docs/USAGE.md "${pkgdir}/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm 644 docs/WORKSPACE_MODE.md "${pkgdir}/usr/share/doc/${_pkgname}/WORKSPACE_MODE.md"
}
