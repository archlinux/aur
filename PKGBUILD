# Maintainer: wuxxin <wuxxin@gmail.com>

pkgname=coreos-installer
pkgver=0.27.0
pkgrel=1
pkgdesc="Installer for CoreOS disk images"
url="https://github.com/coreos/coreos-installer"
arch=('x86_64')
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'openssl' 'xz' 'zstd')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1491d7f0af8e01c80e77e9d480301b9bd23bf4dd9752019a7b1182c299810be')
prepare() {
    cd "${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo build --release --frozen
}

check() {
    cd "${pkgname}-${pkgver}"
    export CARGO_HOME="${srcdir}/cargo-home"
    cargo test --release --frozen
}
package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 man/*.8 -t "${pkgdir}/usr/share/man/man8"
}
