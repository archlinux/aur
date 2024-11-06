# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=stfed
pkgver=1.1.0
pkgrel=1
pkgdesc="Synthing folder event daemon"
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'syncthing')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0c6fe0de45c465606ca0647b18750ec5ccb8b2cffda2e40ff80f8c1fe30413f59350f77f39d8c230bd3b7676d703263baabf38b177f99d24071e7884ab820ea5')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's@/usr/local/bin/@/usr/bin/@w /dev/stdout' systemd/${pkgname}.service
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin/" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/lib/systemd/user/" systemd/${pkgname}.service
}
