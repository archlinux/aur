# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=stfed
pkgver=1.0.3
pkgrel=1
pkgdesc="Synthing folder event daemon"
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'syncthing')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('dc765af1e9130269c1e8a483f61315878d122e65caaf9be989bce768964167a4908ef408e2ee10782d1e783d948e3d84811cfd4fd06ad5a9b11cee867ca8919a')

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
