# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud-10
pkgver=10.0.2
pkgrel=1
pkgdesc="A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way (Version 10.x for migrating from ownCloud 9.x)"
url="https://nextcloud.com"
arch=('any')
license=('AGPL')
depends=('php' 'php-gd')
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
        "set-nc-perms.sh")
sha256sums=('a687a818778413484f06bb23b4e98589c73729fe2aa9feb1bf5584e3bd37103c'
            'SKIP'
            'f9ff4ecee6bca01a2820e0f8509e4ef59343fb91fa2ada205ced2d3765c7d707'
            '6622fc3beba36d055b10b6a661bfe9ca44373277edfa4ce9d5ac8258893efd02')
options=(!strip emptydirs)

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/."
  
  # set the proper permissions
  "${srcdir}/set-nc-perms.sh" runtime "${pkgdir}/usr/share/webapps/nextcloud"
 
  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  ln -s /usr/share/webapps/nextcloud/occ "${pkgdir}/usr/bin/occ"
}

