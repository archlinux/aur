# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=librdp
_pkgname=rdp
pkgdesc="Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification
algorithms"
url="https://github.com/urschrei/rdp"
license=("MIT")
pkgver=0.14.5
pkgrel=1

arch=("i686" "x86_64")
makedepends=(
    "cargo"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/urschrei/rdp/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("379f3bf9d2f1404b89bc5798b284de428b575fefad3cd77b8c6a3e6b18760496654b1f179e258d91034fcc65a0195c5aa715d625e68403a9a5321ceabb181f50")

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
