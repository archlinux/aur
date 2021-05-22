#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname=NBXplorer
_pkgname_lc=$(echo "${_pkgname}" | tr "[:upper:]" "[:lower:]")

# shellcheck disable=SC2034
pkgname=nbxplorer-git
# shellcheck disable=SC2034
pkgver=latest_tag
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
makedepends=("git")
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=()
# shellcheck disable=SC2034
provides=("${_pkgname_lc}")
# shellcheck disable=SC2034
conflicts=("nbxplorer")
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

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/ "${pkgdir}"/usr/share/

    ## Create an executable.
    echo -e "#!/bin/bash
dotnet run --no-launch-profile --no-build -c Release -p \"/usr/share/\"${_pkgname}\"/NBXplorer/NBXplorer.csproj\" -- \"\${@}\"" > "${pkgdir}"/usr/bin/"${_pkgname_lc}"
    chmod 755 "${pkgdir}"/usr/bin/"${_pkgname_lc}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/
}
