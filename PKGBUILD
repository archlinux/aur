# Maintainer: RK <rk at rkevin dot dev>

pkgname=moonlight-cli
pkgver=0.2.5
pkgrel=2
pkgdesc='CLI to install moonlight, the Discord mod'
url='https://github.com/moonlight-mod/moonlight-installer'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4e13b2e121485497d6d4a697d8b1b20c9b37b58cfa71e2e67803112ff8c5be6f2f16bed4610dbec718ed575d6ad52b699be26a6bbd6fa0d0e14cd08299426270')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "moonlight-installer-${pkgver}"
    cargo fetch --locked
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "moonlight-installer-${pkgver}"
    export CFLAGS="${CFLAGS} -fno-lto" # LTO causes build failures. If someone wants to fix this, feel free!
    cargo build --frozen --release --all-features -p $pkgname
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "moonlight-installer-${pkgver}"
    cargo test --frozen --all-features -p $pkgname
}

package() {
    install -Dm0755 "moonlight-installer-${pkgver}/target/release/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "moonlight-installer-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
