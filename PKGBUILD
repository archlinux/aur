# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=3.0.0.b7
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'ffmpeg')
options=(!lto)  # causes issues, fat lto is already enabled for the release profile in Cargo.toml anyway
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('547dd1ad5f11dcb73c3b3bed9fbcc0c516733585d43ef7d9ffbd5a7742014f58d2a0a1820e3e218739f53c188e5b411d83083763778450452e151bd269b7625c')

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
