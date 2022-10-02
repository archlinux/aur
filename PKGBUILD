#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="haveno"
pkgver="0.0.2"
pkgrel="1"
pkgdesc="Decentralized P2P exchange built on Monero and Tor."
arch=("any")
url="https://github.com/haveno-dex/${pkgname}"
license=("AGPL3")
depends=("jdk11-openjdk")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "merge-459.diff::https://patch-diff.githubusercontent.com/raw/haveno-dex/${pkgname}/pull/459.diff")
sha512sums=("06f46e111104df99cfa16c5b9a828eb8968fb63f2a03f4d67d59b4b884dc8d682bf9cefb82501b098a53bc5bd1c8ab0f6067490f3eda1d89622c0fd3b68dc567"
    "e84ad992664e1db647cd20060201a3cffb344ac822e67b76182dd9789c437e0b73dd020d3bc616062676e328015c535f1b2b6fc802ee1b803e9577817f9e4266")

prepare()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    patch -N -p 1 -i "${srcdir}"/merge-459.diff
}

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    make skip-tests
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-pricenode" "haveno-relay" "haveno-seednode" "haveno-statsnode")

    for binary in "${binaries[@]}"; do
        install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${binary}" "${pkgdir}"/usr/bin/
    done

    # Install the documentation.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    chmod -R 644 "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
