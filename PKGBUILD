# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Andre Wayand <aur-davical@awayand.sleepmail.com>
# Contributor: <zenlord@gmail.com>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=davical
pkgver=1.1.5
pkgrel=1
pkgdesc="A server for calendar sharing"
arch=('any')
url="https://gitlab.com/davical-project/davical"
license=('GPL' 'LGPL')
depends=('php>=5.1' 'awl>=0.56' 'php-pgsql' 'perl-dbd-pg' 'perl-yaml' 'perl-dbi')
makedepends=('phpdocumentor2' 'python2-rst2pdf')
optdepends=('postgresql: run postgresql locally'
            'apache: Web server to run davical'
            'nginx: Web server to run davical'
            'php-ldap: PHP module for ldap support')
backup=("etc/webapps/davical/localhost-conf.php")
install="$pkgname.install"
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/davical-project/${pkgname}/repository/archive.tar.bz2?ref=r${pkgver}"
        httpd-davical.conf
        README.archlinux)
sha256sums=('4032c5fbf1bdc63878a5b2faab8289bb6cbeaa43d6fcb6dd84472ac334d31f20'
            'cbcfee6967549baafa313de96f94b61b44c80e0e0eaa3d7309523ff721645db8'
            '619dce9a16e5dffa650954f78d793f93cf8034f51a6d3936d513fa8d78da5778')

_instdir="usr/share/webapps/davical"
_docdir="usr/share/doc/davical"
_etcdir="etc/webapps/davical"

prepare() {
    cd "${srcdir}"
    # rename source dir
    mv ${pkgname}-r${pkgver}-* "${pkgname}-${pkgver}"
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
  cp -ra config dba docs htdocs inc locale po scripts testing zonedb "${pkgdir}/${_instdir}"

  install -D -m 0644 "config/example-config.php" "${pkgdir}/${_etcdir}/localhost-conf.php"
  install -D -m 0644 "${srcdir}/README.archlinux" "${pkgdir}/${_docdir}/README.archlinux"
  install -D -m 0644 "${srcdir}/httpd-davical.conf" "${pkgdir}/${_docdir}/httpd-davical.conf"
}
