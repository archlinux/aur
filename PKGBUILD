# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c
pkgver=0.5.0
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/lu-zero/cargo-c/archive/v${pkgver}.tar.gz")
sha256sums=('cf6804ad9c9f55cfb90b46e080c388931fdd5ac07a6d7f784342fcb83df1548c')

prepare() {
    # https://github.com/lu-zero/cargo-c/issues/44
    # cannot use the '--locked' option as upstream does not provide 'Cargo.lock' (no reproducible builds support)
    cd "${pkgname}-${pkgver}"
    cargo fetch
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --frozen
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cbuild"   -t "${pkgdir}/usr/bin"
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cinstall" -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
