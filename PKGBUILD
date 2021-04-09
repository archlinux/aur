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
makedepends=("composer" "git" "gzip" "sudo")
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
    mkdir -p ${pkgdir}/etc/systemd/system/php-fpm.service.d/
    mkdir -p ${pkgdir}/etc/webapps/
    mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/
    mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/misc/
    
    # Install the software.
    cp -r ${srcdir}/${_pkgname}/ ${pkgdir}/usr/share/webapps/
    chown -R http:http ${pkgdir}/usr/share/webapps/${_pkgname}/
    
#     mv "${pkgdir}/usr/share/webapps/${_pkgname}/config" "${pkgdir}/etc/webapps/${_pkgname}" # todo
#     ln -s "../../../../etc/webapps/${_pkgname}" "${pkgdir}/usr/share/webapps/matomo/config" # todo
    
#     rm -r "${pkgdir}/usr/share/webapps/matomo/tmp" # todo
#     install -dm700 "${pkgdir}/var/lib/webapps/matomo/tmp" # todo
#     ln -s "../../../../var/lib/webapps/matomo/tmp" "${pkgdir}/usr/share/webapps/matomo/tmp" # todo

    ## GeoIP database
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
    
    ## Configure php-fpm
    echo -e "[Service]
ReadWritePaths = /usr/share/webapps/matomo/config
ReadWritePaths = /usr/share/webapps/matomo/matomo.js
ReadWritePaths = /usr/share/webapps/matomo/misc/user/
ReadWritePaths = /usr/share/webapps/matomo/plugins/" > ${pkgdir}/etc/systemd/system/php-fpm.service.d/override_matomo.conf
    sudo systemctl daemon-reload

    curl https://download.db-ip.com/free/dbip-city-lite-${cur_year}-${cur_month}.mmdb.gz -o "DBIP-City-Lite.mmdb.gz"
    gzip -d DBIP-City-Lite.mmdb.gz
    install -Dm644 ${srcdir}/DBIP-City-Lite.mmdb ${pkgdir}/usr/share/webapps/${_pkgname}/misc/

    # Install the documentation.
    install -Dm644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/share/doc/${_pkgname}/

    # Install the license.
    install -Dm644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/

    # Information
    echo -e "\033[0;32mConfiguration is needed after the installation. For assistance, read the included \"README.md\".\033[0m"
}
