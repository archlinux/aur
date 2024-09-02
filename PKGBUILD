#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for Bench.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Sabu Siyad <hello@ssiyad.com>

readonly _pkgname="bench"

pkgname="frappe-bench"
pkgver="5.22.9"
pkgrel="1"
pkgdesc="CLI to manage multi-tenant deployments for Frappe apps."
arch=("any")
url="https://github.com/frappe/${_pkgname}"
license=("GPL-3.0-or-later")
makedepends=("python-build" "python-hatchling" "python-installer" "python-wheel")
depends=("cronie" "git" "nodejs" "python" "python-click" "python-gitpython" "python-jinja" "python-pip" "python-python-crontab" "python-requests" "python-semantic-version" "python-setuptools" "python-tomli" "redis" "ruby-foreman" "supervisor" "yarn")
optdepends=("mariadb: Database"
    "nginx: HTTP server")
provides=("bench")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("86eb3dd169df393390dd097aa1308e76e524e6add033f52855220f8f6c46f9f70692440fe6bad3f5df647965f6ffc7d884c8eed08e0a4930d706d5c812b9ed8d")

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
