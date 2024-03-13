#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Haveno.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="haveno"
pkgver="0.0.18"
pkgrel="1"
pkgdesc="Decentralised P2P exchange built on Monero and Tor."
arch=("any")
url="https://github.com/haveno-dex/${pkgname}"
license=("AGPL-3.0-or-later")
depends=("bash" "java-runtime>=11")
makedepends=("java-environment>=11")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.desktop")
sha512sums=("1374efc643914339f14ad28960b7dd227fad83b416cbb1fffa6df20e16376e81242e6b85656e7aeabc36b776f8ce70b190053aca1a8492b46292645d4abd2621"
    "ad15f8a5fa39c1db3b83fd3771ff0721dd4993d2278bd20713bef62100cf8eda0a86cc5ea781623ea0cf102bf0c7f15ebd0158509d37c54164e9e3e0430d4142")

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
