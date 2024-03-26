#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for ast-comments.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="ast-comments"

pkgname="python-ast-comments"
pkgver="1.2.2"
pkgrel="1"
pkgdesc="Extension to the built-in ast module."
arch=("any")
url="https://github.com/t3rn0/${_pkgname}"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-poetry-core")
checkdepends=("python-pytest")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("e2cd0096b1f1656b10e3b5d857e3266c368bfc4b685246e2c7b01e2953706110bb8924966e0adab983d5d3f540a6ad85df05652a89644d900c72da3b185692e9")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    # -n cannot be used as Python files will be missing.
    python -m build -w
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
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the license.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/
}
