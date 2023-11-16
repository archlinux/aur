# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=stfed
pkgver=1.0.2
pkgrel=4
pkgdesc="Synthing folder event daemon"
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'syncthing')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('4d9dc80c8377b53378eb8df678d50636fbdbc7628bd6740a0476e8ce02632e24c04b06c23aae1a37e8c338a9e652b363a24a26015dfd76fe792428805abb40c6')

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
