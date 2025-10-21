# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=librdp
_pkgname=rdp
pkgdesc="Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification
algorithms"
url="https://github.com/urschrei/rdp"
license=("MIT")
pkgver=0.14.2
pkgrel=1

arch=("i686" "x86_64")
makedepends=(
    "cargo"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/urschrei/rdp/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("226364b217547d14f5ece2422ad99a4ff0e11e2d9a525c987248aae5ea0b87d1528c31867e5223a3f1cecaf3354eb104cf4663330f49392e9ca82cb335675d9c")

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
