# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pkgdu
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool to display packages disk usage size"
arch=('x86_64')
url="https://github.com/bpetlert/pkgdu"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('b6df71653a368b683747b9b43ec7d61b892ad8976315a707c878cbc42d62088b6e5d54fdadc9b47a1f477ed9f28bb69ef8117adf62d06a3dc563297c6e89f3dd')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/pkgdu" "$pkgdir/usr/bin/pkgdu"
    install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
}
