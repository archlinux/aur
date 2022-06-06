#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname="NBXplorer"

pkgname="nbxplorer"
pkgver="2.3.27"
pkgrel="1"
pkgdesc="A minimalist UTXO tracker for HD wallets."
arch=("any")
url="https://github.com/dgarage/${_pkgname}"
license=("MIT")
depends=("aspnet-runtime" "bitcoin-daemon" "dotnet-sdk" "postgresql")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("54d54b8a3a23b32bbfc2bf4368dbbb60e11ce66dffa1079d2fff04c20c4afd08c604cd3c3bc7db6119fc1a1a230a32ab813f67b65dc8c23eb538cd79537e8b41")

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
