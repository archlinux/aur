# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=3.0.0.b4
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'ffmpeg')
option=(!lto)  # causes issues, fat lto is already enabled for the release profile in Cargo.toml anyway
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ac04b78ab49a9412c3ed09337ec3cebafab31c37d3cad49613f1ce9077ea7f66b9ed1c813926afc60d1ed3b521cc57aa3585b9cd8ecc2b43ba36bd564e36837e')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features tests-ffmpeg
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}_r
}
