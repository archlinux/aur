#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname=btcpayserver

# shellcheck disable=SC2034
pkgname=btcpayserver-git
# shellcheck disable=SC2034
pkgver=latest_tag
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="Accept Bitcoin payments. Free, open-source and self-hosted Bitcoin payment processor."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/btcpayserver/${_pkgname}"
# shellcheck disable=SC2034
license=("MIT")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("aspnet-runtime-3.1" "bitcoin-daemon" "dotnet-sdk-3.1" "nbxplorer-git")
# shellcheck disable=SC2034
makedepends=("git")
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
provides=("${_pkgname}")
# shellcheck disable=SC2034
conflicts=("btcpayserver")
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
source=("git+${url}.git")
# shellcheck disable=SC2034
noextract=()
# shellcheck disable=SC2034
md5sums=("SKIP")
# shellcheck disable=SC2034
validpgpkeys=()

pkgver()
{
    # shellcheck disable=SC2154
    cd "${srcdir}"/"${_pkgname}"/ || exit
    version=$(git describe --tags --abbrev=0)
    printf "%s" "${version}" | sed "s/^v//;s/-/_/g;s/\//./g"
}

build()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit
    git checkout tags/"$(git describe --tags --abbrev=0)"
    ./build.sh
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/ "${pkgdir}"/usr/share/webapps/

    ## Create an executable.
    echo -e "#!/bin/bash
dotnet run --no-launch-profile --no-build -c Release -p \"/usr/share/webapps/${_pkgname}/BTCPayServer/BTCPayServer.csproj\" -- \"\${@}\"" > "${pkgdir}"/usr/bin/"${_pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${_pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/

    # Information
    echo -e "\033[0;32mConfiguration is needed after the installation. For assistance, read the included \"README.md\".\033[0m"
}
