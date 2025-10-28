# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=librdp
_pkgname=rdp
pkgdesc="Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification
algorithms"
url="https://github.com/urschrei/rdp"
license=("MIT")
pkgver=0.15.0
pkgrel=1

arch=("i686" "x86_64")
makedepends=(
    "cargo"
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/urschrei/rdp/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("d6e205d99bbdace7e0dd6de4236d27443d2e73d42a2abbbe667f793781dea150dee07f2a1cb338d61dc893714e94bc8752d3b89d52eee6b4ab7f2aca6b0cb4c7")

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
