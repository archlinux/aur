#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for dprint-plugin-malva.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="malva"

pkgname="dprint-plugin-malva"
pkgver="0.16.0"
pkgrel="1"
pkgdesc="CSS, SCSS, Sass and Less code formatting plugin for dprint."
arch=("any")
url="https://github.com/g-plane/${_pkgname}"
license=("MIT")
depends=("dprint")
makedepends=("rust" "rust-wasm")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("e08f373e5387a1383a16e2e364268188a470a80df51237df387d10d4f0b8edb0173056bb65a3c73369042b33624465d7c29d581d51598c42a76b1aa74091d167")

prepare()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    export CARGO_TARGET_DIR="target/"
    export RUSTUP_TOOLCHAIN="stable"
    cargo build --frozen -p dprint_plugin_malva -r --target wasm32-unknown-unknown
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/dprint/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    install -Dm755 "${srcdir}"/"${_pkgname}"-"${pkgver}"/target/wasm32-unknown-unknown/release/"${pkgname//-/_}".wasm "${pkgdir}"/usr/lib/dprint/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
