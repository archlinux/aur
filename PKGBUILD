#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Technical.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

readonly _pkgname="technical"

pkgname="python-technical"
pkgver="1.4.0"
pkgrel="1"
pkgdesc="Various indicators developed or collected for the Freqtrade."
arch=("any")
url="https://github.com/freqtrade/${_pkgname}"
license=("GPL3")
depends=("python" "python-arrow" "python-pandas" "python-ta-lib")
makedepends=("python-build" "python-installer")
checkdepends=("python-pytest" "python-mock")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("4c602269b5c1344dce3a0a3a902dca633b66212bf55fa79906cc4aed695e5caddd97ae99c918de611be5a481afe5f3dab2a27c16cdc477069e9da5611660e18b")

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
    declare _site_packages
    _site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
    readonly _site_packages

    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${_pkgname}"-"${pkgver}"/dist/*.whl
    rm -r "${pkgdir}"/"${_site_packages}"/tests/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
