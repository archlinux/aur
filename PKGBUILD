#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for NBXplorer.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="NBXplorer"

pkgname="nbxplorer"
pkgver="2.6.0"
pkgrel="1"
pkgdesc="A minimalist UTXO tracker for HD wallets."
arch=("x86_64")
url="https://github.com/dgarage/${_pkgname}"
license=("MIT")
depends=("aspnet-runtime" "bash" "bitcoin-daemon" "dotnet-sdk" "postgresql")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha512sums=("0f3161e0cb4b20d126316a8b8709401e4821ee14d2e5bef30cd91d89845adc540fb57d63338c0857be0b5cc990690768c4386795d215d1de79c73e2990cdb473"
    "ce7e68b099de73f0a09d231e6c3ada98c5440b58c57d229fcc20fd4e3b18e2bd445c810960e828893be1a3bb8f6c954ba7c4b40f82caa84a9115bb5e752a1453")

build()
{
    dotnet build -c Release "${srcdir}"/"${_pkgname}"-"${pkgver}"/NBXplorer/NBXplorer.csproj
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/
    install -Dm755 "${srcdir}"/"${pkgname}".sh "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
