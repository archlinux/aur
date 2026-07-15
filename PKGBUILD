# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=stfed
pkgver=1.1.1
pkgrel=1
pkgdesc="Synthing folder event daemon"
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'syncthing')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('86db1c87c165ca6f8f39c869b1ef0f4640d16fa2a542ee615976ea1d915e1a02a75219aae1d8045666355d0d6340095129c6bf554a07f5a5ee71f5966a66cc6d')

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

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin/" ./target/release/${pkgname}
    install -Dm 644 -t "${pkgdir}/usr/lib/systemd/user/" systemd/${pkgname}.service
}
