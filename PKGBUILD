# Maintainer: MartiMcFly martimcfly@autorisation.de

pkgname=('zarafa-webaccess')
pkgver=7.2.0
_pkgmajver=7.2
_pkgrev=${pkgver}-48204
pkgrel=8
pkgdesc="Open Source Groupware Solution"
arch=('any')
url="http://www.zarafa.com/"
license=('AGPL3')
depends=('php')
makedepends=('gettext')
install=("install")
source=("zarafa-${pkgver}.tar.gz::http://download.zarafa.com/community/final/${_pkgmajver}/${_pkgrev}/sourcecode/zarafa-${pkgver}.tar.gz"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"zarafa-webaccess.conf"
	"zarafa-webaccess.ini")

md5sums=('7dc8a526b3eb83e6eb5bbc9d2215b501'
         'bdb65922b267d27f4602026f3c55423f'
         '73451bc5c35072b22b0b2925c5920978'
         '7adcf5e023718421a5e8e07e5e9a2480'
         '38ce6fbf16357ded687db57d5ef581bd'
         'daedd4114b213e9279806ee720eeb1ef')

package() {
  # extract make task and run it
  cd ${srcdir}/zarafa-${pkgver}
  grep -Pzo '(?s)install-ajax-webaccess.*' Makefile.in > Makefile
  make top_srcdir=. DESTDIR=${pkgdir} install-ajax-webaccess
 
  # prepare application
  mkdir -p ${pkgdir}/usr/share/webapps
  mv ${pkgdir}/usr/share/zarafa-webaccess ${pkgdir}/usr/share/webapps/zarafa-webaccess
  mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webaccess/plugins
  rm ${pkgdir}/usr/share/webapps/zarafa-webaccess/zarafa-webaccess.conf
  rm -rf ${pkgdir}/etc/zarafa
  
  # prepare library
  mkdir -p ${pkgdir}/var/lib/zarafa-webaccess
  mkdir -p ${pkgdir}/var/lib/zarafa-webaccess/tmp
  mkdir -p ${pkgdir}/var/lib/zarafa-webaccess/tmp/attachements
  mkdir -p ${pkgdir}/var/lib/zarafa-webaccess/tmp/session
  
  # prepare logging
  mkdir -p ${pkgdir}/var/log/zarafa-webaccess
  touch ${pkgdir}/var/log/zarafa-webaccess/debug.txt
  ln -s /var/log/zarafa-webaccess/debug.txt ${pkgdir}/usr/share/webapps/zarafa-webaccess/debug.txt

  # prepare settings
  mkdir -p ${pkgdir}/etc/webapps/zarafa-webaccess
  cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/zarafa-webaccess/
  cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/zarafa-webaccess/
  cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/zarafa-webaccess/
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/zarafa-webaccess.conf ${pkgdir}/etc/webapps/zarafa-webaccess/apache.example.conf
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/config.php.dist ${pkgdir}/etc/webapps/zarafa-webaccess/config.example.php
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/debug.php ${pkgdir}/etc/webapps/zarafa-webaccess/debug.example.php
  ln -s /etc/webapps/zarafa-webaccess/config.php ${pkgdir}/usr/share/webapps/zarafa-webaccess/config.php
  
  # => php
  mkdir -p ${pkgdir}/etc/php/conf.d
  cp ${srcdir}/zarafa-webaccess.ini ${pkgdir}/etc/php/conf.d

  # => php-fpm
  mkdir -p ${pkgdir}/etc/php/fpm.d
  cp ${srcdir}/zarafa-webaccess.conf ${pkgdir}/etc/php/fpm.d

  # => fix pear path
  sed -i 's$/usr/share/php/$/usr/share/pear/$' ${pkgdir}/etc/webapps/zarafa-webaccess/config.example.php

}
