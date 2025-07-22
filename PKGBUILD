# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=spreet
pkgdesc="Create spritesheets from SVGs"
url="https://github.com/flother/spreet"

pkgver=0.12.0
pkgrel=1

arch=("x86_64" "i686")
license=("MIT")

depends=(
    "gcc-libs"
    "glibc"
)
makedepends=(
    "cargo"
)

options=("!lto")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/flother/spreet/refs/heads/master/LICENCE"
)
b2sums=(
    "fb4b9b7884e5f8c018ef45c0e1b593882779692d70c1fc3a2fa94f15a49bcddf5e8fa7cc381675f5255b24b14450c9b14766be5e52f088579b94317e7e3766ec"
    "665632494d1da73aa6ba01c6fd1088d43e48615d371aac0b739191a4bef8696e1365420eeff67ecec8289301e0b0a102dacd80c771c782733da2881334a04638"
)

prepare() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    install -Dm 0755 \
        "target/release/spreet" \
        "${pkgdir}/usr/bin/spreet"
    install -Dm 0644 \
        "README.md" \
        "${pkgdir}/usr/share/docs/${pkgname}/README.md"

    cd "${srcdir}"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
