# Maintainer: Matheus Gabriel Werny de Lima <matheusgwdl@protomail.com>

_pkgname=matomo

pkgname=matomo-git
pkgver=latest_tag
pkgrel=1
epoch=
pkgdesc="A powerful web analytics platform."
arch=("any")
url="https://github.com/matomo-org/${_pkgname}"
license=("GPL3")
groups=()
depends=("php" "php-fpm" "php-gd")
makedepends=("composer" "git")
checkdepends=()
optdepends=("apache: HTTP server"
"certbot: Creates SSL certificates."
"mariadb: Database"
"nginx: HTTP server")
provides=(${_pkgname})
conflicts=("matomo")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver()
{
    cd ${srcdir}/${_pkgname}/
    version=$(git describe --tags --abbrev=0)
    printf "%s" ${version} | sed "s/^v//;s/-/_/g;s/\//./g"
}

build()
{
    cd ${srcdir}/${_pkgname}/
    git checkout tags/$(git describe --tags --abbrev=0)
    git submodule update --init --merge --recursive
    composer install --no-dev
}

package()
{
    # Assure that the directories exist.
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/
    
    # todo
    mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/config/
    mkdir -p ${pkgdir}/etc/webapps/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/tmp/
    mkdir -p ${pkgdir}/var/lib/webapps/${_pkgname}/tmp/

    # Install the software.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/share/webapps/

    # todo
    chown -R http:http ${pkgdir}/usr/share/webapps/matomo/

    sudo chmod 744 ${pkgdir}/usr/share/webapps/matomo/matomo.js
    sudo chmod 744 ${pkgdir}/usr/share/webapps/matomo/piwik.js

    install -d "${pkgdir}/etc/webapps/"

    mv "${pkgdir}/usr/share/webapps/${_pkgname}/config/" "${pkgdir}/etc/webapps/${_pkgname}/"
    ln -s "${pkgdir}/etc/webapps/${_pkgname}/" "${pkgdir}/usr/share/webapps/${_pkgname}/config/"

    rm -r "${pkgdir}/usr/share/webapps/${_pkgname}/tmp/"
    install -dm700 "${pkgdir}/var/lib/webapps/${_pkgname}/tmp/"
    ln -s "${pkgdir}/var/lib/webapps/${_pkgname}/tmp/" "${pkgdir}/usr/share/webapps/${_pkgname}/tmp/"

    ## Download the GeoIP database.
    cd ${pkgdir}/usr/share/webapps/matomo/misc/
    cur_year=$(date +"%Y")
    cur_month=$(date +"%m")

    while [ $(curl -s -o /dev/null/ -w "%{http_code}" https://download.db-ip.com/free/dbip-city-lite-${cur_year}-${cur_month}.mmdb.gz) != "200" ]; do
        if [ ${cur_month} -gt 1 ]; then
            cur_month-=1
        else
            cur_year-=1
            cur_month=12
        fi
    done

    curl https://download.db-ip.com/free/dbip-city-lite-${cur_year}-${cur_month}.mmdb.gz -o "DBIP-City-Lite.mmdb"

    # Install the documentation.
    install -Dm644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/

    # Install the license.
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/

    # Information
    echo -e "\033[0;32mConfiguration is needed after the installation. For assistance, read the included \"README.md\".\033[0m"
}
