# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=kei

pkgdesc="Fast, parallel photo sync from the cloud to local storage"
url="https://github.com/rhoopr/kei"

_git_organisation=rhoopr

pkgver=0.10.0
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
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_git_organisation}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}-LICENSE::https://github.com/${_git_organisation}/${pkgname}/raw/refs/tags/v${pkgver}/LICENSE"
    "kei.service"
)
b2sums=(
    "5494c8f4566430d2dbbcf7d6ba3674378553427befdc02c8461d318d99e7089b59efb7963903063f908f768e4cf9d54e3f9c725f2f687e6847354d705734d276"
    "f6dc0928cf8b2e32a43f51600dfb1bd3ab5d8794b2c259a9171ace0d2d6aad28012a6561193c80a7b58a2f81384c67773d7ded7d60c19a8f14f7f7672f87e373"
    "7617a6e4439adca6bb6d55fa32978f091607a01875792204a5f3307fac62ac7b412fcbceb1d626293195483c8be3f575879d8670494eec86518a6c25bb7c988b"
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
    export CFLAGS=
    cargo build --frozen --release --all-features --package kei
}

check() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    install -Dm 0755 \
        "target/release/kei" \
        "${pkgdir}/usr/bin/kei"
    install -Dm 0644 \
        "README.md" \
        "docs"/*.md \
        -t "${pkgdir}/usr/share/docs/${pkgname}/"

    cd "${srcdir}"
    install -Dm 0644 \
        "${pkgname}.service" \
        -t "${pkgdir}/usr/lib/systemd/user/"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
