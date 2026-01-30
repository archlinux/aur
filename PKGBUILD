# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=nnd
pkgver=0.69
pkgrel=1
pkgdesc="A debugger for Linux"
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/al13n321/nnd/archive/v${pkgver}.tar.gz")
sha256sums=('300ef5e1a9d92eb0a4a84feed424f5b7134e18751e7ec2f36e3813190d6a0b84')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${pkgname}-${pkgver}"
    CFLAGS+=" -ffat-lto-objects"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
