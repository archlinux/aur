# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=2.0.4
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'hddtemp' 'hdparm' 'smartmontools')
optdepends=('sdparm: SAS drive support')
makedepends=('cargo')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c756dec1ce85482d55af09043f37268564992d4b3c3f3796da53d251de7ed2a9afe4b23e75ee5d544f71eda0ba6329b0caad72188f0bade2427d612b1ff6a827')

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
