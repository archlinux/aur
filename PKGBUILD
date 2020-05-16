# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nextcloud-10
pkgver=10.0.6
pkgrel=1
pkgdesc="A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way (Version 10.x for migrating from ownCloud 9.x)"
url="https://nextcloud.com"
arch=('any')
license=('AGPL')
makedepends=('systemd')
depends=('php<7.4' 'php-gd<7.4')
optdepends=('php-apache: to use the Apache web server'
            'php-sqlite: to use the SQLite database backend'
            'php-pgsql: to use the PostgreSQL database backend'
            'php-ldap: LDAP authentication'
            'php-intl'
            'php-apcu: Memory caching'
            'mariadb: to use the MySQL database backend'
            'smbclient: to mount SAMBA shares'
            'php-mcrypt'
            'imagemagick: file preview'
            'ffmpeg: file preview'
            'libreoffice: file preview')
conflicts=('nextcloud')
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"{,.asc}
        "apache.example.conf"
        "nextcloud-set-permissions.sh")
sha256sums=('1b9acad0fa3317047902fd647c425a1d567e7d93ffa9c40700d072a45cf396f1'
            'SKIP'
            'e3d802ae8c868bafd3efc884f0fd8eaa36dac0769718a54a14303fbf386fd87a'
            '6622fc3beba36d055b10b6a661bfe9ca44373277edfa4ce9d5ac8258893efd02')
options=(!strip emptydirs)

package() {
  # install project
  install -d -m 755 "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/."
  
  # set the proper permissions
  install -D -m 755 "${srcdir}/nextcloud-set-permissions.sh" "${pkgdir}/usr/bin/nextcloud-set-permissions"
  "${srcdir}/nextcloud-set-permissions.sh" runtime "${pkgdir}/usr/share/webapps/nextcloud"
 
  # install apache example config file
  install -D -m 644 "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  
  # install executable launcher
  ln -s /usr/share/webapps/nextcloud/occ "${pkgdir}/usr/bin/occ"
}
