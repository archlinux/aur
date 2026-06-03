# Maintainer: peippo <christoph.fink@gmail.com>

pkgname=kei

pkgdesc="Fast, parallel photo sync from the cloud to local storage"
url="https://github.com/rhoopr/kei"

pkgver=0.21.2
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
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}-${pkgver}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
    "kei.service"
)
b2sums=(
    "234983d35b06e8daf45eeb80e403d24f95b0e29ccbcb964b4ca288228f6d541ba960fe1c7c0f19ee29bcc67382b180e87541329b7ba8186c986e904c053d6745"
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

# check() {
#     cd "${srcdir}"/${pkgname}-${pkgver}
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen
# }

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    install -Dm 0755 \
        "target/release/kei" \
        "${pkgdir}/usr/bin/kei"
    install -Dm 0644 \
        "example.config.toml" \
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
