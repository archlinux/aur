#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Yamlfix.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="yamlfix"
pkgver="1.1.1"
pkgrel="1"
pkgdesc="A simple, opinionated yaml formatter that keeps your comments!"
arch=("any")
url="https://github.com/lyz-code/${pkgname}"
license=("GPL3")
depends=("python" "python-click" "python-ruyaml")
makedepends=("python-build" "python-installer" "python-pdm" "python-pip")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=("cccca8d53b973a4c43303f3b01e23d0894580c229df4999a355c110d715ca6ea0328a2e344613a08e2a20d31d20ee21ae0efded2f5c22501200ee1ffb2c671c3")

build()
{
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/

    # Install the software.
    cd "${srcdir}"/"${pkgname}"-"${pkgver}"/ || exit 1
    python -m installer -d "${pkgdir}" "${srcdir}"/"${pkgname}"-"${pkgver}"/dist/*.whl

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
    cp -r "${srcdir}"/"${pkgname}"-"${pkgver}"/docs/* "${pkgdir}"/usr/share/doc/"${pkgname}"/
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type d -exec chmod 755 {} +
    find "${pkgdir}"/usr/share/doc/"${pkgname}"/ -type f -exec chmod 644 {} +
}
