# Maintainer: Stefan Tatschner <rumpelsepp@sevenbyte.org>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Andre Wayand <aur-davical@awayand.sleepmail.com>
# Contributor: <zenlord@gmail.com>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=davical
pkgver=1.1.4
pkgrel=2
pkgdesc="A server for calendar sharing"
arch=('any')
url="https://gitlab.com/davical-project/davical"
license=('GPL' 'LGPL')
depends=('php>=5.1' 'awl>=0.56' 'php-pgsql' 'perl-dbd-pg' 'perl-yaml' 'perl-dbi')
optdepends=('postgresql: run postgresql locally'
            'apache: Web server to run davical'
            'nginx: Web server to run davical'
            'php-ldap: PHP module for ldap support')
backup=("etc/webapps/davical/localhost-conf.php")
install="$pkgname.install"
source=("git+https://gitlab.com/davical-project/davical.git#tag=r${pkgver}"
        httpd-davical.conf
        README.archlinux)
sha256sums=('SKIP'
            'cbcfee6967549baafa313de96f94b61b44c80e0e0eaa3d7309523ff721645db8'
            '619dce9a16e5dffa650954f78d793f93cf8034f51a6d3936d513fa8d78da5778')

_instdir="/usr/share/webapps/davical"
_docdir="/usr/share/doc/davical"
_etcdir="/etc/webapps/davical"

build() {
  cd "${srcdir}/${pkgname}"

  find -type f -exec sed -i "s%/etc/davical/%/etc/webapps/davical/%g" {} \;
  cd dba
  find -name \*.sql -exec sed -i "s/'SQL'/'sql'/g; s/'PlPgSQL'/'plpgsql'/g" {} \;
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d \
    "${pkgdir}${_instdir}" \
    "${pkgdir}${_etcdir}" \
    "${pkgdir}${_docdir}"

  cp -ra . "${pkgdir}${_instdir}"

  install -D -m 0644 "config/example-config.php" "${pkgdir}${_etcdir}/localhost-conf.php"
  install -D -m 0644 "${srcdir}/README.archlinux" "${pkgdir}${_docdir}/README.archlinux"
  install -D -m 0644 "${srcdir}/httpd-davical.conf" "${pkgdir}${_docdir}/httpd-davical.conf"
}
