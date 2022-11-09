#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="haveno"
pkgver="0.0.3"
pkgrel="1"
pkgdesc="Decentralized P2P exchange built on Monero and Tor."
arch=("any")
url="https://github.com/haveno-dex/${pkgname}"
license=("AGPL3")
depends=("jdk11-openjdk")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("c5ab75991b3692166e75a86ff78816ead88b52d26424c0100fc4dc1f9ff4965356a8ee40cc6af25c8f618932b5df4413a2f4b962fbfa93d994680fd3a46e7385")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    make skip-tests
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/opt/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-pricenode" "haveno-relay" "haveno-seednode" "haveno-statsnode")

    for binary in "${binaries[@]}"; do
        install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${binary}" "${pkgdir}"/opt/"${pkgname}"/
        ln -s /opt/"${pkgname}"/"${binary}" "${pkgdir}"/usr/bin/
    done

    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/lib/ "${pkgdir}"/opt/"${pkgname}"/
    find "${pkgdir}"/opt/"${pkgname}"/lib/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/opt/"${pkgname}"/lib/ -type f -exec chmod 644 {} +

    # Install the documentation.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
