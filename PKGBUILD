#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

pkgname="dl-librescore"
pkgver="0.34.21"
pkgrel="1"
pkgdesc="Download sheet music from MuseScore."
arch=("any")
url="https://github.com/LibreScore/${pkgname}"
license=("MIT")
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("578792446ed6f57e1dedaacd7a9f53e8987419ac0173a47fdc538474807cf62be13a3b4cf600b149293acc92baa5bb705b44a541b1de5d262d3e4248ea6f3fb2")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    npm install
    npm run build
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/bin/
    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/"${pkgname}"/

    ## Create an executable.
    echo -e "#!/bin/bash

node /usr/share/\"${pkgname}\"/dist/cli.js \"\${@}\"" > "${pkgdir}"/usr/bin/"${pkgname}"
    chmod 755 "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
