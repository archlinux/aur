#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="dprint-plugin-typescript"
pkgver="0.74.0"
pkgrel="1"
pkgdesc="TypeScript and JavaScript code formatting plugin for dprint."
arch=("any")
url="https://github.com/dprint/${pkgname}"
license=("MIT")
depends=("dprint")
makedepends=("rust" "rust-wasm")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("fb3fab0628afa9af36a30cfb87d25ecb6278f752c2a496f889961bf0535f4a69db40c57bfc2809bbc6de409d22d58ab385431636e80ea38db30e059f3fe3939a")

prepare()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target/
    cargo build -F wasm --frozen -r --target wasm32-unknown-unknown
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/dprint/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/target/wasm32-unknown-unknown/release/"${pkgname//-/_}".wasm "${pkgdir}"/usr/lib/dprint/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
