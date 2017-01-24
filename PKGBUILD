# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud
pkgver=11.0.1
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
validpgpkeys=('28806A878AE423A28372792ED75899B9A724937A')
source=("https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"{,.asc}
  "apache.example.conf"
  "set-nc-perms.sh")

md5sums=('7c5f147039a0e9240926fe1f4d134e81'
         'SKIP'
         'bc2b02b0562b7a58e660e33acd4202bc'
         '13780e7de28cd3a8796d3345a2bf8d42')
_fetchedMD5=$(curl -sS https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2.md5)
IFS=' '; _arrFetchedMD5=($_fetchedMD5); unset IFS;
_fetchedMD5=${_arrFetchedMD5[0]}
md5sums[0]=$_fetchedMD5

options=(!strip emptydirs)

#prepare() {
#  cd nextcloud-${pkgver}
#}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  #cp "${srcdir}/nextcloud/COPYING-AGPL" "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/."
  
  # set the proper permissions
  "${srcdir}/set-nc-perms.sh" runtime "${pkgdir}/usr/share/webapps/nextcloud"
 
  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  ln -s /usr/share/webapps/nextcloud/occ "${pkgdir}/usr/bin/occ"
}

# vim:set ts=2 sw=2 et:
