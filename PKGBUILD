#!/usr/bin/env bash
# shellcheck disable=SC2034
# shellcheck disable=SC2154
# The PKGBUILD for farmOS.
# Maintainer: Matheus <matheusgwdl@protonmail.com>
# Contributor: Matheus <matheusgwdl@protonmail.com>

readonly _pkgname="farmOS"

pkgname="farmos"
pkgver="3.1.2"
pkgrel="1"
pkgdesc="A web-based farm record keeping application."
arch=("any")
url="https://github.com/farmOS/${_pkgname}"
license=("GPL-2.0-or-later")
depends=("bash" "perl" "php" "php-fpm" "php-gd" "php-sodium")
makedepends=("composer")
optdepends=("apache: HTTP server"
    "certbot: Creates SSL certificates."
    "mariadb: Database"
    "nginx: HTTP server"
    "php-geos-git: Geometry"
    "php-pgsql: Database support for PostgreSQL"
    "php-sqlite: Database support for SQLite"
    "postgresql: Database"
    "sqlite: Database")
source=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
    "override-${pkgname}.conf")
sha256sums=("2d5acadcbd00957b87f4c80545f5c3cbdd8c65ed7cd25e8aa2686debc51118cf"
    "d42161c817011222d256232cacecf6b176901d48f8e7db70a10de5e98ea102bd")

build()
{
    cd "${srcdir}"/"${_pkgname}"/ || exit 1
    composer install --no-dev
}

package()
{
    # Assure that the directories exist.
    mkdir -p "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    mkdir -p "${pkgdir}"/usr/share/doc/"${pkgname}"/
    mkdir -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    # Install the software.
    cp -r "${srcdir}"/"${_pkgname}"/* "${pkgdir}"/usr/share/webapps/"${pkgname}"/
    install -Dm644 "${srcdir}"/override-"${pkgname}".conf "${pkgdir}"/usr/lib/systemd/system/php-fpm.service.d/
    chown -R http:http "${pkgdir}"/usr/share/webapps/"${pkgname}"/

    ## Configuration
    sed -i "s/^# \\\$settings\['file_private_path'\] = '';$/\$settings['file_private_path'] = '\/usr\/share\/webapps\/${pkgname}\/web\/sites\/default\/private\/files\/';/g" "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php

    if ! grep -Eq "^\\\$settings\['file_private_path'\] = '/usr/share/webapps/${pkgname}/web/sites/default/private/files/';$" "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php; then
        echo "String not found!" >&2
        exit 1
    fi

    perl -0e "s/# \\\$config\['user.settings'\]\['anonymous'\] = 'Visitor';\n/# \\\$config['user.settings']['anonymous'] = 'Visitor';\n\\\$config['system.performance']['css']['preprocess'] = FALSE;\n\\\$config['system.performance']['js']['preprocess'] = FALSE;\n/g" -i -p "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php

    if ! pcregrep -Mq "# \\\$config\['user.settings'\]\['anonymous'\] = 'Visitor';\n\\\$config\['system.performance'\]\['css'\]\['preprocess'\] = FALSE;\n\\\$config\['system.performance'\]\['js'\]\['preprocess'\] = FALSE;\n" "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php; then
        echo "String not found!" >&2
        exit 1
    fi

    sed -i "s/^# \\\$settings\['trusted_host_patterns'\] = \[\];/\$settings['trusted_host_patterns'] = ['^127\\\.0\\\.0\\\.1$', '^localhost$'];/g" "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php

    if ! grep -Eq "^\\\$settings\['trusted_host_patterns'\] = \['\^127\\\.0\\\.0\\\.1\\\$', '\^localhost\\\$'\];$" "${pkgdir}"/usr/share/webapps/"${pkgname}"/web/sites/default/default.settings.php; then
        echo "String not found!" >&2
        exit 1
    fi

    # Install the documentation.
    install -Dm644 "${srcdir}"/"${_pkgname}"/web/README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/
}
