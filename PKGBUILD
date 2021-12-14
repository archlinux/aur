#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname=dl-musescore
pkgver=0.30.1
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="Download sheet music from MuseScore."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
# shellcheck disable=SC2034
license=("MIT")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("nodejs")
# shellcheck disable=SC2034
makedepends=("npm")
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
sha256sums=("eaec79c44603773fa4e83daf48c30d26532848a7d0b26897417b8fe4d6fde0ea")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # shellcheck disable=SC2154
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit
    npm install
    npm run build
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/"${pkgname}"/

    ## Create an executable.
    echo -e "#!/bin/bash
node /usr/share/${pkgname}/dist/cli.js \"\${@}\"" > "${pkgdir}"/usr/bin/"${pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
