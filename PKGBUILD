# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=librdp
_pkgname=rdp
pkgdesc="Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification
algorithms"
url="https://github.com/urschrei/rdp"
license=("MIT")
pkgver=0.12.11
pkgrel=1

arch=("i686" "x86_64")
makedepends=(
    "cargo"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/urschrei/rdp/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=("bceb03f24a3fcffc24872cfe18d4d77bab683c4800e0dce784e4aad6428324cc564f2812b05247017e7ec03d6040fbaa7aeaa1d92197826d141f0f0dc3e0821a")

prepare() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    install -Dm0755 -t "${pkgdir}/usr/lib/" "target/release/${pkgname}.so"
    install -Dm0644 "include/header.h" "${pkgdir}/usr/include/${pkgname}/header.h"
    install -Dm0644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
