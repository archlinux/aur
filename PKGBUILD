#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dprint-plugin-markdown.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dprint-plugin-markdown"
pkgver="0.15.1"
pkgrel="1"
pkgdesc="Markdown code formatting plugin for dprint."
arch=("any")
url="https://github.com/dprint/${pkgname}"
license=("MIT")
depends=("dprint")
makedepends=("rust" "rust-wasm")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("78739183730460e1a5b7fe1107ec4319823eadcf540028a705ed28ff0cff8499e15dcd70d7b6644ab36d1a7fc8b64eff8b754c7e87f06c60121a884596ddedb6")

prepare()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    export CARGO_TARGET_DIR="target/"
    export RUSTUP_TOOLCHAIN="stable"
    cargo build --frozen -F wasm -r --target wasm32-unknown-unknown
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
