# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=2.0.0.b4
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'hddtemp' 'hdparm' 'smartmontools')
makedepends=('cargo')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1c27e4478c07922161439e900c4e29120566a03a85e64adf62651f80daba017d007667639bd101cf3ffc3ffc697f25619bb9f51c2ab6e77a54bca09a7226816e')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    mkdir -p target/man
    cargo run --frozen --features gen-man-pages -- ./target/man/
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 systemd/hddfancontrol.service "${pkgdir}/usr/lib/systemd/system/hddfancontrol.service"
    install -Dm 644 systemd/hddfancontrol.conf "${pkgdir}/etc/conf.d/hddfancontrol"
    install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./target/man/*
}
