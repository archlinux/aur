#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Technical.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

readonly _pkgname="technical"

pkgname="python-technical"
pkgver="1.4.3"
pkgrel="1"
pkgdesc="Various indicators developed or collected for the Freqtrade."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-arrow" "python-pandas" "python-ta-lib")
makedepends=("python-build" "python-installer" "python-wheel")
checkdepends=("python-pytest" "python-mock")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("28ccb869aaa12a39903e6659c19a98546c9e8d21d063e91cd048a2c48cd96ba6333646e51cac0a2aca02dac7b58c1d7e4e5299fd90ded05c5117f4a4d3263d19")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    pytest
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
