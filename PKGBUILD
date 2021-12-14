#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname=NBXplorer

pkgname=nbxplorer
pkgver=2.2.18
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="A minimalist UTXO tracker for HD wallets."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/dgarage/${_pkgname}"
# shellcheck disable=SC2034
license=("MIT")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("aspnet-runtime-3.1" "bitcoin-daemon" "dotnet-sdk-3.1")
# shellcheck disable=SC2034
makedepends=()
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=()
# shellcheck disable=SC2034
conflicts=()
# shellcheck disable=SC2034
replaces=()
# shellcheck disable=SC2034
backup=()
# shellcheck disable=SC2034
options=()
# shellcheck disable=SC2034
install=
# shellcheck disable=SC2034
changelog=
# shellcheck disable=SC2034
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# shellcheck disable=SC2034
noextract=()
# shellcheck disable=SC2034
sha256sums=("617fd70f5a78c63011308b33924aaca880cfffca7518d8926cd586daba585fc6")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # shellcheck disable=SC2154
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit
    ./build.sh
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${_pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/"${_pkgname}"/

    ## Create an executable.
    echo -e "#!/bin/bash
dotnet run --no-launch-profile --no-build -c Release -p \"/usr/share/${_pkgname}/NBXplorer/NBXplorer.csproj\" -- \"\${@}\"" > "${pkgdir}"/usr/bin/"${pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/
}
