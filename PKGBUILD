#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dprint-plugin-json.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="dprint-plugin-json"
pkgver="0.19.1"
pkgrel="1"
pkgdesc="JSON code formatting plugin for dprint."
arch=("any")
url="https://github.com/dprint/${pkgname}"
license=("MIT")
depends=("dprint")
makedepends=("rust" "rust-wasm")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("3139a19138922dfc29ef201ba11adeb4be345392f8ad6c4bc8b1832bb14a2b70f5c71b6eeb96a3ac80769862f2489750260086d783bc819e9cc0e76beaea68ba")

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
