#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for farmOS.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="farmOS"

pkgname="farmos"
pkgver="3.1.0"
pkgrel="1"
pkgdesc="A web-based farm record keeping application."
arch=("any")
url="https://github.com/farmOS/${_pkgname}"
license=("GPL-2.0-only")
depends=("bash" "perl" "php" "php-fpm" "php-gd" "php-sodium")
makedepends=("composer")
optdepends=("apache: HTTP server"
    "certbot: Creates SSL certificates."
    "geos: Geometry"
    "mariadb: Database"
    "nginx: HTTP server"
    "php-pgsql: Database support for PostgreSQL"
    "php-sqlite: Database support for SQLite"
    "postgresql: Database"
    "sqlite: Database")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("df99f11d107728d9892ef34fb1abec8fc09bc48382915eb506ccdef3caca46d1")

build()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    composer install --no-dev
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/
    chown -R http:http "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/web/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
