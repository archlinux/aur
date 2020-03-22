# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c
pkgver=0.6.2
pkgrel=1
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('curl' 'openssl' 'zlib')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lu-zero/cargo-c/archive/v${pkgver}.tar.gz")
sha256sums=('c0a3e612b41f441081098e3f3e1716fc709421f3d17654a9f0303f420fdbc1ee')

prepare() {
    # https://github.com/lu-zero/cargo-c/issues/44
    # cannot use the '--locked' option as upstream does not provide 'Cargo.lock' (no reproducible builds support)
    cargo fetch --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

build() {
    cargo build --release --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

check() {
    cargo test --release --frozen --manifest-path="${pkgname}-${pkgver}/Cargo.toml"
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cbuild"   -t "${pkgdir}/usr/bin"
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cinstall" -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
