#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for ERPNext.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

pkgname="erpnext"
pkgver="14.17.4"
pkgrel="1"
pkgdesc="Free and open source Enterprise Resource Planning (ERP)."
arch=("x86_64")
url="https://github.com/frappe/${pkgname}"
license=("GPL3")
depends=("frappe-bench" "nodejs" "python")
makedepends=("python-build" "python-installer")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha512sums=("7fb7154bc8542eab411492949cbfe38b7755f5b1a41f410cfab89865ee53d0ac26bc52e77295648c95f7c0c376c377dcbea543f74b525a265bc71d362f9cb68d"
    "4829a0db8899fc1021c2e2a5e98399c3647f5149bf324968b6418c09818b85913bfac1cfb27ac3000751c0b537c6dc7b0abecef970cb77682b1efaf9337f6203")

build()
{
    cd "${srcdir}" || exit 1
    bench init "${pkgname}"
    cd ./"${pkgname}" || exit 1
    #bench get --branch v"${pkgver}" "${pkgname}" "${url}.git"
    bench get "${pkgname}" "${url}.git"
    bench new-site "${pkgname}"
    bench --site "${pkgname}" install-app "${pkgname}"
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${pkgname}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/
    echo "${pkgname}" > "${pkgdir}"/usr/share/webapps/"${pkgname}"/sites/currentsite.txt
    install -Dm755 "${srcdir}"/"${pkgname}".sh "${pkgdir}"/usr/bin/"${pkgname}"

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
