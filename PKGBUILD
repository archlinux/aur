# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud-testing
pkgver=11.0.0beta2
pkgrel=1
pkgdesc="Testing Release -- A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way"
url="https://nextcloud.com"
arch=('any')
provides=('nextcloud')
conflicts=('owncloud' 'nextcloud')
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
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/prereleases/nextcloud-${pkgver}.tar.bz2"{,.asc}
  "apache.example.conf"
  "set-nc-perms.sh")

md5sums=('0ca765c16b1d34e7e263f7226abbc96b'
         'SKIP'
         'bc2b02b0562b7a58e660e33acd4202bc'
         'd505daefdb3c0ef5c9ca6ea8973d7c17')
_fetchedMD5=$(curl -sS https://download.nextcloud.com/server/prereleases/nextcloud-${pkgver}.tar.bz2.md5)
IFS=' '; _arrFetchedMD5=($_fetchedMD5); unset IFS;
_fetchedMD5=${_arrFetchedMD5[0]}
md5sums[0]=$_fetchedMD5

options=(!strip emptydirs)

#prepare() {
#  cd nextcloud-${pkgver}
#}

package() {
  #install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  #cp "${srcdir}/nextcloud/COPYING-AGPL" "${pkgdir}/usr/share/licenses/${pkgname}"

  install -d "${pkgdir}/usr/share/webapps"
  cp -r nextcloud "${pkgdir}/usr/share/webapps/."

  # set the proper permissions
  "${srcdir}/set-nc-perms.sh" runtime "${pkgdir}/usr/share/webapps/nextcloud"

  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  ln -s /usr/share/webapps/nextcloud/occ "${pkgdir}/usr/bin/occ"
}

# vim:set ts=2 sw=2 et:
