#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protonmail.com>

_pkgname="matomo"

pkgname="matomo-git"
pkgver="4.11.0"
pkgrel="1"
pkgdesc="A powerful web analytics platform."
arch=("any")
url="https://github.com/matomo-org/${_pkgname}"
license=("GPL3")
depends=("php" "php-fpm" "php-gd")
makedepends=("composer" "curl" "git" "git-lfs")
optdepends=("apache: HTTP server"
    "certbot: Creates SSL certificates."
    "mariadb: Database"
    "nginx: HTTP server")
provides=("${_pkgname}")
conflicts=("matomo")
source=("git+${url}.git")
sha512sums=("SKIP")

build()
{
    # Information
    echo -e "\033[0;32mConfiguration is needed before the installation. For assistance, read the included \"README.md\".\033[0m"

    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    git checkout tags/"${pkgver}"
    git submodule update --init --merge --recursive
    composer install --no-dev
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/etc/systemd/system/php-fpm.service.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${_pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${_pkgname}"/misc/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/ "${pkgdir}"/usr/share/webapps/

    ## GeoIP database
    current_year=$(date +"%Y")
    current_month=$(date +"%m")

    while [[ "$(curl -s -o /dev/null/ -w "%{http_code}" https://download.db-ip.com/free/dbip-city-lite-"${current_year}"-"${current_month}".mmdb.gz || true)" != "200" ]]; do
        ### Remove the preceding 0.
        if [[ "${current_month::1}" == "0" ]]; then
            current_month=${current_month:1}
        fi

        ### Take the last month.
        if [[ "${current_month}" -gt "1" ]]; then
            ((current_month--))
        else
            ((current_year--))
            current_month="12"
        fi

        ### Put a 0 at the beginning again.
        if [[ "${#current_month}" == "2" ]]; then
            current_month="0${current_month}"
        fi
    done

    curl https://download.db-ip.com/free/dbip-city-lite-"${current_year}"-"${current_month}".mmdb.gz -o DBIP-City-Lite.mmdb.gz
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
    install -Dm644 "${srcdir}"/"${_pkgname}"/README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/
}
