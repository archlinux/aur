#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Bench.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Sabu Siyad <hello@ssiyad.com>

readonly _pkgname="bench"

pkgname="frappe-bench"
pkgver="5.20.0"
pkgrel="1"
pkgdesc="CLI to manage multi-tenant deployments for Frappe apps."
arch=("any")
url="https://github.com/frappe/${_pkgname}"
makedepends=("python-build" "python-hatchling" "python-installer" "python-wheel")
depends=("cronie" "git" "nodejs" "python" "python-click" "python-gitpython" "python-jinja" "python-pip" "python-python-crontab" "python-requests" "python-semantic-version" "python-setuptools" "python-tomli" "redis" "ruby-foreman" "supervisor" "yarn")
optdepends=("mariadb: Database"
    "nginx: HTTP server")
provides=("bench")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("55d69aea7c5c982c6fb1c6af1a37c665e768ccab04414cbd46bd0114d71c3c89b9531c3d18197164e843f05dee98d1198bc2cf177b89f633f4b0dc51cbf57b57")

build()
{
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit 1
    python -m build -nw
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
