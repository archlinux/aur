# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud-beta
pkgver=11.0.0beta
pkgrel=1
pkgdesc="A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way"
url="https://nextcloud.com"
arch=('any')
license=('AGPL')
depends=('php' 'php-gd')
optdepends=('php-apache: to use the Apache web server'
      'php-sqlite: to use the SQLite database backend'
      'php-pgsql: to use the PostgreSQL database backend'
      'php-ldap: LDAP authentication'
      'php-intl'
      'php-apcu'
      'mariadb: to use the MySQL database backend'
      'smbclient: to mount SAMBA shares'
      'php-mcrypt'
      'imagemagick: file preview'
      'ffmpeg: file preview'
      'libreoffice: file preview')
options=('!strip')
install=${pkgname}.install
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/prereleases/nextcloud-${pkgver}.tar.bz2"{,.asc}
  "apache.example.conf"
  "set-nc-perms.sh")

sha512sums=('576b453ee72af794cfcc061ba0b8fb3f126a56869d7c28f4961e409a19ad367a237d2e2a2f7f520f86465ca6287d25638ed18c14f1f499840679fbe95588c670'
            'SKIP'
            'c6c525173e7f2da47c2d8df81394ea4aa7df4af684b2b57cb1e23ef7c1e5672f9d9343a8c3a977603f2253a5a2926149af5a3578b024b0f11646c52684c76e8b'
            'b75c22b11491e826e4bc529320d0532707ce89d462bce60022fa4abcd95304f87ff4d1791efec8ee2cc63f948ca0b90c59b9eb5a68f5e46aaf963d2b70b39c70')

options=(!strip emptydirs)

#prepare() {
#  cd nextcloud-${pkgver}
#}

package() {
  #install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  #cp "${srcdir}/nextcloud/COPYING-AGPL" "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/nextcloud-beta"
  
  find "${pkgdir}/usr/share/webapps/nextcloud-beta/" -type f -print0 | xargs -0 chmod 0640
  find "${pkgdir}/usr/share/webapps/nextcloud-beta/" -type d -print0 | xargs -0 chmod 0750
  chmod 0664 "${pkgdir}/usr/share/webapps/nextcloud-beta/.user.ini"
  chmod 0664 "${pkgdir}/usr/share/webapps/nextcloud-beta/.htaccess"
 
  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud-beta"
  ln -s /usr/share/webapps/nextcloud-beta/occ "${pkgdir}/usr/bin/occ-beta"
}

# vim:set ts=2 sw=2 et:
