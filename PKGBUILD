#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Technical.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

readonly _pkgname="technical"

pkgname="python-technical"
pkgver="1.7.0"
pkgrel="1"
pkgdesc="Various indicators developed or collected for the Freqtrade."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("python" "python-matplotlib" "python-numpy" "python-pandas" "python-scipy" "python-ta-lib")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
checkdepends=("python-mock" "python-pip-audit" "python-pytest" "python-syrupy")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("ed42f0d1fbe7bae968f6bc210b945fd42d063d2da546457866a09e644a3d382273aa7c03ea710ef8e5c54732227dab078e2b5cfbc4c2786b2ca844d942ba6f12")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

check()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    pytest -k "not test_pip_audit_no_vulnerabilities" # TODO
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
