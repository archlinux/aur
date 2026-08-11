# Maintainer: RK <rk at rkevin dot dev>

pkgname=moonlight-cli
pkgver=0.2.6
pkgrel=1
pkgdesc='CLI to install moonlight, the Discord mod'
url='https://github.com/moonlight-mod/moonlight-installer'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('06183683c510d2a20804c334fb474e942a45aed14092881d97dc5b3137b64b4bf8714db4a39c9f1887858a9b05377fd832c7ae847ded803af377e69e9f778396')

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
