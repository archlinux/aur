# Maintainer: Elrondo46 <elrond94@hotmail.com> 
# Contributor: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Andre Wayand <aur-davical@awayand.sleepmail.com>
# Contributor: <zenlord@gmail.com>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=davical
pkgver=1.1.10
pkgrel=2
pkgdesc="A server for calendar sharing"
arch=('any')
url="https://gitlab.com/davical-project/davical"
license=('GPL' 'LGPL')
depends=('php>=5.1' 'awl' 'php-sqlite' 'php-pgsql' 'perl-dbd-pg' 'perl-yaml' 'perl-dbi')
makedepends=('phpdocumentor2' 'doxygen')
optdepends=('postgresql: run postgresql locally'
            'apache: Web server to run davical'
            'nginx: Web server to run davical'
            'php-ldap: PHP module for ldap support')
backup=("etc/webapps/davical/localhost-conf.php")
install="$pkgname.install"
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgname}/-/archive/r${pkgver}/${pkgname}-r${pkgver}.tar.bz2"
         httpd-davical.conf
         README.archlinux)
sha512sums=('e39333fdb3ded3baaeda6430325009d0c9237ce6e0b63adfba6754c1816d3b458ab6bb4ec8896f3de08e61ddbf4930e455297e365408bbb39c766efa688bc0f8'
            'b4466049d9ba116cdbe3951a7a4cf004a423b59f197f78765151c656cf4f16f30a2bcc302bd643be0548818a67611654f95deb95113fa7f581394af78cb17109'
            'd7ffe40a87e4752f1cd148bcc0a39285d81d9a717357207a114c1fc8384431ac07e673c84fd152865d47a1291b2c00dfd95237a973f3b6069a97ba5d0940ca84')

_instdir="usr/share/webapps/davical"
_docdir="usr/share/doc/davical"
_etcdir="etc/webapps/davical"

prepare() {
    cd "${srcdir}"
    # rename source dir
    mv "${pkgname}-r${pkgver}" "${pkgname}-${pkgver}"
    # strip debian build files from source dir
    rm -rf "${srcdir}/${pkgname}-${pkgver}/debian"
    # enable pdo_sqlite php extension for apigen
    sed -i 's|apigen generate|php -d "extension=pdo_sqlite.so" /usr/bin/apigen generate|g' "${srcdir}/${pkgname}-${pkgver}/Makefile"
    # enable inconv php extension for make test
    sed -i 's|; do php -l \$\${PHP}|; do php -d "extension=iconv.so" -l \$\${PHP}|g' "${srcdir}/${pkgname}-${pkgver}/Makefile"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # fix paths
    find -type f -exec sed -i "s%/etc/davical/%/${_etcdir}/%g" {} \;
    find dba -name '*.sql' -exec sed -i "s/'SQL'/'sql'/g; s/'PlPgSQL'/'plpgsql'/g" {} \;
    make all
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -D -d -m755 "${pkgdir}/${_instdir}"
    cp -ra config dba htdocs inc locale po scripts testing zonedb "${pkgdir}/${_instdir}"

    install -D -d -m755 "${pkgdir}/${_docdir}"
    cp -ra docs/* "${pkgdir}/${_docdir}"

    install -D -m 0644 "config/example-config.php" "${pkgdir}/${_etcdir}/localhost-conf.php"
    install -D -m 0644 "${srcdir}/README.archlinux" "${pkgdir}/${_docdir}/README.archlinux"
    install -D -m 0644 "${srcdir}/httpd-davical.conf" "${pkgdir}/${_docdir}/httpd-davical.conf"
}
