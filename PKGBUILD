# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=malachite
_pkgname=mlc
pkgver=2.1.0
pkgrel=2
pkgdesc='Tool for packaging and maintaining pacman repositories'
arch=('x86_64' 'aarch64')
url="https://git.getcryst.al/crystal/software/${pkgname}"
license=('GPL3')
depends=('git' 'pacman-contrib' 'gnupg')
makedepends=('cargo')
source=("${pkgname}-${pkgver}::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('1099ea27ffd0cead66458e5f4a0c36939f7b560844fa1ab8f678ede4d792c2f9')

prepare() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm 644 docs/COMMON_FEATURES.md "${pkgdir}/usr/share/doc/${_pkgname}/COMMON_FEATURES.md"
    install -Dm 644 docs/GETTING_STARTED.md "${pkgdir}/usr/share/doc/${_pkgname}/GETTING_STARTED.md"
    install -Dm 644 docs/REPOSITORY_MODE.md "${pkgdir}/usr/share/doc/${_pkgname}/REPOSITORY_MODE.md"
    install -Dm 644 docs/USAGE.md "${pkgdir}/usr/share/doc/${_pkgname}/USAGE.md"
    install -Dm 644 docs/WORKSPACE_MODE.md "${pkgdir}/usr/share/doc/${_pkgname}/WORKSPACE_MODE.md"
}
