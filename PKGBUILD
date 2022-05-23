#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname="NBXplorer"

pkgname="nbxplorer"
pkgver="2.3.24"
pkgrel="1"
pkgdesc="A minimalist UTXO tracker for HD wallets."
arch=("any")
url="https://github.com/dgarage/${_pkgname}"
license=("MIT")
depends=("aspnet-runtime" "bitcoin-daemon" "dotnet-sdk" "postgresql")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("a748d1d75868a7277c4532c51419c0cf0b64db2bf07ebf8eae15d9c6d14540d1a9e92d80f67e62e307cae8ef6876d54f9550b5760cc73982dc31589d2d96394f")

build()
{
    dotnet build -c Release "${srcdir}"/"${_pkgname}"-"${pkgver}"/NBXplorer/NBXplorer.csproj
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${_pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/"${_pkgname}"/

    ## Create an executable.
    echo -e "#!/bin/bash

dotnet run --no-launch-profile --no-build -c Release --project /usr/share/\"${_pkgname}\"/NBXplorer/NBXplorer.csproj -- \"\${@}\"" > "${pkgdir}"/usr/bin/"${pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    chmod -R 644 "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/
}
