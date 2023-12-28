# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=librdp
_crates_pkgname=rdp
pkgdesc="Fast Ramer–Douglas–Peucker and Visvalingam-Whyatt line simplification
algorithms"
url="https://github.com/urschrei/rdp"
license=("MIT")
pkgver=0.12.8
pkgrel=1

arch=("i686" "x86_64")
makedepends=(
    "cargo"
)

source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${_crates_pkgname}/${_crates_pkgname}-${pkgver}.crate")
b2sums=('1508fe29bc96eb6a0373988234eaa790cd0dc40933a47c7cb7ae99a51712967f14ebc80b5bf0e636d22a59152d4755dbe4a5f4c346b365ce1ebaececfdef2444')

prepare() {
    cd ${srcdir}/${_crates_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${srcdir}/${_crates_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${srcdir}/${_crates_pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${srcdir}/${_crates_pkgname}-${pkgver}
    install -Dm0755 -t "${pkgdir}/usr/lib/" "target/release/${pkgname}.so"
    install -Dm0644 "include/header.h" "${pkgdir}/usr/include/${pkgname}/header.h"
    install -Dm0644 "license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
