# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=malachite
_pkgname=mlc
pkgver=3.0.0
pkgrel=3
pkgdesc='Tool for packaging and maintaining pacman repositories'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/crystal-linux/software/${pkgname}"
license=('GPL-3.0-only')
depends=('git' 'pacman-contrib' 'gnupg' 'gpgme' 'libarchive' 'libgpg-error' 'podman')
makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('122f9c2bdc55ebd372ae304199def3aececf0a5f619b9c260840919fcac5c99c')

prepare() {
    cd "${pkgname}-v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-v${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-v${pkgver}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
