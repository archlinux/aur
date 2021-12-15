#!/bin/bash
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname=matomo

# shellcheck disable=SC2034
pkgname=matomo-git
pkgver=4.6.2
# shellcheck disable=SC2034
pkgrel=1
# shellcheck disable=SC2034
epoch=
# shellcheck disable=SC2034
pkgdesc="A powerful web analytics platform."
# shellcheck disable=SC2034
arch=("any")
url="https://github.com/matomo-org/${_pkgname}"
# shellcheck disable=SC2034
license=("GPL3")
# shellcheck disable=SC2034
groups=()
# shellcheck disable=SC2034
depends=("php" "php-fpm" "php-gd")
# shellcheck disable=SC2034
makedepends=("composer" "curl" "git" "gzip")
# shellcheck disable=SC2034
checkdepends=()
# shellcheck disable=SC2034
optdepends=("apache: HTTP server"
"certbot: Creates SSL certificates."
"mariadb: Database"
"nginx: HTTP server")
# shellcheck disable=SC2034
provides=("${_pkgname}")
# shellcheck disable=SC2034
conflicts=("matomo")
# shellcheck disable=SC2034
replaces=()
# shellcheck disable=SC2034
backup=()
# shellcheck disable=SC2034
options=()
# shellcheck disable=SC2034
install=
# shellcheck disable=SC2034
changelog=
# shellcheck disable=SC2034
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# shellcheck disable=SC2034
noextract=()
# shellcheck disable=SC2034
sha256sums=("6c83a093ad71b1b3b6bc27815287782787f05c2d9c15a2b01c8a1ee019599789")
# shellcheck disable=SC2034
validpgpkeys=()

build()
{
    # Information
    echo -e "\033[0;32mConfiguration is needed before the installation. For assistance, read the included \"README.md\".\033[0m"

    # shellcheck disable=SC2154
    cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/ || exit
    git submodule update --init --merge --recursive
    composer install --no-dev
}

package()
{
    # Assure that the directories exist.
    # shellcheck disable=SC2154
    mkdir -p "${pkgdir}"/etc/systemd/system/php-fpm.service.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${_pkgname}"/misc/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"-"${pkgver}"/* "${pkgdir}"/usr/share/webapps/"${_pkgname}"/

    ## GeoIP database
    current_year=$(date +"%Y")
    current_month=$(date +"%m")

    while [ "$(curl -s -o /dev/null/ -w "%{http_code}" https://download.db-ip.com/free/dbip-city-lite-"${current_year}"-"${current_month}".mmdb.gz)" != "200" ]; do
        # Remove the preceding 0.
        if [ "${current_month::1}" == "0" ]; then
            current_month=${current_month:1}
        fi

        # Take the last month.
        if [ "${current_month}" -gt 1 ]; then
            ((current_month--))
        else
            ((current_year--))
            current_month=12
        fi

        # Put a 0 at the beginning.
        if [ "${#current_month}" == 2 ]; then
            current_month="0${current_month}"
        fi
    done

    curl https://download.db-ip.com/free/dbip-city-lite-"${current_year}"-"${current_month}".mmdb.gz -o "DBIP-City-Lite.mmdb.gz"
    gzip -d "${srcdir}"/DBIP-City-Lite.mmdb.gz
    install -Dm644 "${srcdir}"/DBIP-City-Lite.mmdb "${pkgdir}"/usr/share/webapps/"${_pkgname}"/misc/

    ## Configure php-fpm.
    echo -e "[Service]
ReadWritePaths = /usr/share/webapps/${_pkgname}/config/
ReadWritePaths = /usr/share/webapps/${_pkgname}/matomo.js
ReadWritePaths = /usr/share/webapps/${_pkgname}/misc/user/
ReadWritePaths = /usr/share/webapps/${_pkgname}/plugins/
ReadWritePaths = /usr/share/webapps/${_pkgname}/tmp/" > "${pkgdir}"/etc/systemd/system/php-fpm.service.d/override_matomo.conf

    ## Set the owner.
    chown -R http:http "${pkgdir}"/usr/share/webapps/"${_pkgname}"/

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"-"${pkgver}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
}
