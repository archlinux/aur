#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=btcpayserver
pkgver=1.3.7
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="Accept Bitcoin payments. Free, open-source and self-hosted Bitcoin payment processor."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/btcpayserver/${pkgname}"
# shellcheck disable=SC2034
license=("MIT")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("aspnet-runtime-3.1" "bitcoin-daemon" "dotnet-sdk-3.1" "nbxplorer")
# shellcheck disable=SC2034
makedepends=()
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=("apache: HTTP server"
"certbot: Creates SSL certificates."
"lnd: Lightning network support"
"mariadb: Database"
"nginx: HTTP server"
"postgresql: Database"
"sqlite: Database")
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
sha256sums=("1bb43b9b8a2be1a7e9ece15ca28f19a133967e3cd1c704a9bbf821cfd09dfab9")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # shellcheck disable=SC2154
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit
    ./build.sh
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    ## Create an executable.
    echo -e "#!/bin/bash
dotnet run --no-launch-profile --no-build -c Release -p \"/usr/share/webapps/${pkgname}/BTCPayServer/BTCPayServer.csproj\" -- \"\${@}\"" > "${pkgdir}"/usr/bin/"${pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Information
    echo -e "\033[0;32mConfiguration is needed after the installation. For assistance, read the included \"README.md\".\033[0m"
}
