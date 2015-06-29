# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Andre Wayand <aur-davical@awayand.sleepmail.com>
# Contributor: <zenlord@gmail.com>
# Contributor: Michael Seiwald <michael@mseiwald.at>

pkgname=davical
pkgver=1.1.3.1
pkgrel=1
pkgdesc="A server for calendar sharing"
arch=('any')
url="https://gitlab.com/davical-project/davical"
license=('GPL' 'LGPL')
depends=('php>=5.1' 'awl>=0.55' 'php-pgsql' 'perl-dbd-pg' 'perl-yaml' 'perl-dbi')
optdepends=('postgresql: run postgresql locally'
            'apache: Web server to run davical'
            'nginx: Web server to run davical'
            'php-ldap: PHP module for ldap support')
backup=("etc/webapps/davical/localhost-conf.php")
install="$pkgname.install"
source=("${pkgname}.tar.gz::https://gitlab.com/davical-project/davical/repository/archive.tar.gz?ref=r${pkgver}"
        httpd-davical.conf
        README.archlinux)
sha256sums=('4439c2df0052241b65c61eb4f0b10c406d93afd65a5cc6b523b597c0a7b05c15'
            'cbcfee6967549baafa313de96f94b61b44c80e0e0eaa3d7309523ff721645db8'
            '619dce9a16e5dffa650954f78d793f93cf8034f51a6d3936d513fa8d78da5778')

_instdir="/usr/share/webapps/davical"
_docdir="/usr/share/doc/davical"
_etcdir="/etc/webapps/davical"

build() {
  cd "${srcdir}/${pkgname}.git"

  find -type f -exec sed -i "s%/etc/davical/%/etc/webapps/davical/%g" {} \;
  cd dba
  find -name \*.sql -exec sed -i "s/'SQL'/'sql'/g; s/'PlPgSQL'/'plpgsql'/g" {} \;
}

package() {
  cd "${srcdir}/${pkgname}.git"

  install -d \
    "${pkgdir}${_instdir}" \
    "${pkgdir}${_etcdir}" \
    "${pkgdir}${_docdir}"

  cp -ra . "${pkgdir}${_instdir}"

  install -D -m 0644 "config/example-config.php" "${pkgdir}${_etcdir}/localhost-conf.php"
  install -D -m 0644 "${srcdir}/README.archlinux" "${pkgdir}${_docdir}/README.archlinux"
  install -D -m 0644 "${srcdir}/httpd-davical.conf" "${pkgdir}${_docdir}/httpd-davical.conf"
}
