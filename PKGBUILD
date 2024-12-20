#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="haveno"
pkgver="1.0.16"
pkgrel="1"
pkgdesc="Decentralised P2P exchange built on Monero and Tor."
arch=("any")
url="https://github.com/haveno-dex/${pkgname}"
license=("AGPL-3.0-or-later")
depends=("bash" "java-runtime>=21")
makedepends=("java-environment>=21")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha512sums=("9cd2f849009d2a5ff53d0be0dfb14abdd8cf39a0068769c7ed5111b78916353f622a2bd7e3678eafc3234917ed42b9ab7c312b9cff7e654abc085865e443ad22"
    "046e32ecc69058d270b5660d55c323d1458b91989f1a3ddc8a107edc28c196029d25b5a5f5f46b754a778919cca13d016ef3e17813578605938c2b3b289b8e93")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    ./gradlew -F lenient -x test build
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/applications/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/java/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/pixmaps/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/lib/ "${pkgdir}"/usr/share/java/"${pkgname}"/

    declare -ar _binaries=("haveno-apitest" "haveno-cli" "haveno-daemon" "haveno-desktop" "haveno-inventory" "haveno-monitor" "haveno-relay" "haveno-seednode" "haveno-statsnode")

    for _binary in "${_binaries[@]}"; do
        install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${_binary}" "${pkgdir}"/usr/share/java/"${pkgname}"/
        ln -s /usr/share/java/"${pkgname}"/"${_binary}" "${pkgdir}"/usr/bin/
    done

    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/desktop/package/linux/icon.png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
    install -Dm644 "${srcdir}"/"${pkgname}".desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop

    # Install the documentation.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
