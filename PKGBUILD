# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=sacad
pkgver=3.0.0.b6
pkgrel=1
pkgdesc='Smart Automatic Cover Art Downloader'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MPL2')
depends=('gcc-libs')
makedepends=('cargo' 'ffmpeg')
options=(!lto)  # causes issues, fat lto is already enabled for the release profile in Cargo.toml anyway
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('398427d0ae602d28d1017510fc37e84ff2c4c561c5c0a56a9cbae30c48a5c9bef3bef747104cc0825a9cb9af9e00a815e9353e65e7e0a723c197319c9cb149d2')

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
