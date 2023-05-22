#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="haveno"
pkgver="0.0.6"
pkgrel="1"
pkgdesc="Decentralised P2P exchange built on Monero and Tor."
arch=("any")
url="https://github.com/haveno-dex/${pkgname}"
license=("AGPL3")
depends=("bash" "java-runtime>=11")
makedepends=("java-environment>=11")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("962bffad3c6501af2a879cd4ea08b0fc8083cb655f7b2b3673d62efc35964dd54c8fe202697bb72f9f1a4b5c11cca593dd1d49f5c8813e1544651660331ff2db")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    ./gradlew -F lenient -x test build
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/lib/ "${pkgdir}"/usr/share/java/"${pkgname}"/

    declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

    for _binary in "${_binaries[@]}"; do
        install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${_binary}" "${pkgdir}"/usr/share/java/"${pkgname}"/
        ln -s /usr/share/java/"${pkgname}"/"${_binary}" "${pkgdir}"/usr/bin/
    done

    # Install the documentation.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
