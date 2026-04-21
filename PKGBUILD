# Maintainer:
# Contributor: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>

pkgname=nnd
pkgver=0.71
pkgrel=1
pkgdesc="A debugger for Linux"
arch=('x86_64')
url="https://github.com/al13n321/nnd"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/al13n321/nnd/archive/v${pkgver}.tar.gz")
sha256sums=('b0d770d5b78c29ac364553b7816954b5e39a8b5101d1f2fcb6905d730a2330f5')

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
