# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=hddfancontrol
pkgver=2.0.1
pkgrel=1
pkgdesc='Regulate fan speed according to hard drive temperature'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL-3.0-only')
depends=('gcc-libs' 'hddtemp' 'hdparm' 'smartmontools')
makedepends=('cargo')
backup=('etc/conf.d/hddfancontrol')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9cce0fe888a58f52974ac29117ed7b4e1f1cc8751f14b994b935618f02124086a2f1ae8631f8a5738964444f84cccf99e53e1af14f2fd03f68ce3f43fbf9c000')

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
