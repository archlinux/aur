# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=stfed
pkgver=1.0.4
pkgrel=1
pkgdesc="Synthing folder event daemon"
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs' 'syncthing')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c9e5eb0295065a88cef9d1bc463d5ee9ac90dbae2813fcf88aed5472260b85bf043b7e779afb6dc0d4e0e5e56b735ee5da5629c6dbf71ee574837f1bf54c3f96')

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
