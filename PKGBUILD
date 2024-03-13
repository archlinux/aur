#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Serai.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

declare -r _tag="c507ab9fd610611ce6d06299856b6737c97f2ec5"

pkgname="serai"
pkgver="0.0.0"
pkgrel="1"
pkgdesc="Decentralised exchange."
arch=("any")
url="https://github.com/serai-dex/${pkgname}"
license=("AGPL-3.0-or-later")
depends=("solidity")
makedepends=("git" "rust")
source=("${pkgname}::git+${url}.git#tag=${_tag}"
    "${pkgname}.desktop"
    "${pkgname}.png")
sha512sums=("SKIP"
    "3f9e2b9a0da05d8ba3c207f00a65530bf4a3e0808104a8fca967a11a83286c7720e4260530706559491468a375b0b73093c9be90811ffe36ca5cd7c1f014ebcb"
    "86698f2de5a3633e3f4dacb80c17e14f856633f66a4a4106a3edfda42be33d03eb93520c6de693e732a64857c9a8716252672db5dd721308c5f73f7e2f6f4bf2")

prepare()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    export RUSTUP_TOOLCHAIN="stable"
    cargo fetch --locked --target "$(rustc -vV | sed -n "s/host: //p" || true)"
}

build()
{
    cd "${srcdir}"/"${pkgname}"/ || exit 1
    export CARGO_TARGET_DIR="target/"
    export RUSTUP_TOOLCHAIN="stable"
    cargo build --all-features --frozen -r
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/applications/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/pixmaps/

    # Install the software.
    declare -ar _binaries=("serai-coordinator" "serai-message-queue" "serai-node" "serai-processor" "reserialize_chain")

    for _binary in "${_binaries[@]}"; do
        install -Dm755 "${srcdir}"/"${pkgname}"/target/release/"${_binary}" "${pkgdir}"/usr/bin/
    done

    install -Dm644 "${srcdir}"/"${pkgname}".png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
    install -Dm644 "${srcdir}"/"${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${pkgname}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
