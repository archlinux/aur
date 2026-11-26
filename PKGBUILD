# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=ampscan
pkgver=1.5.6
pkgrel=1
pkgdesc='Audit IPv4/IPv6 networks for ports exploitable in DDoS amplification attacks'
arch=('x86_64')
url='https://github.com/gondimcodes/ampscan'
license=('GPL-3.0-only')
depends=('glibc' 'libgcc' 'openssl')
makedepends=('cargo')
conflicts=('ampscan-bin')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b27adcf5f9b0eef140fe6f9652b81be67ea46765606f5ad0b58de00303a38d6f')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/ampscan -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 config.toml "${pkgdir}/usr/share/doc/${pkgname}/config.toml.example"
}
