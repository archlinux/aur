# Maintainer: MartiMcFly martimcfly@autorisation.de

pkgname=('zarafa-webaccess')
groups=('zarafa')
pkgver=7.2.1
_pkgmajver=7.2
_pkgrev=${pkgver}-51847
pkgrel=4
pkgdesc="Open Source Groupware Solution"
arch=('any')
url="http://www.zarafa.com/"
license=('AGPL3')
depends=('php<7'
	 'php-fpm<7')
makedepends=('gettext')
install=("install")
source=("zarafa-${pkgver}.tar.gz::http://download.zarafa.com/community/final/${_pkgmajver}/${pkgver}-51838/sourcecode/zarafa-${_pkgrev}.tar.gz"
	"nginx-location.conf"
	"nginx-ssl.example.conf"
	"php-fpm.example.conf"
	"zarafa-webaccess.conf"
	"zarafa-webaccess.ini"
	"compress-static")

md5sums=('d281fd9f85562efc81802620673d682b'
         'cd4ca8bec5346fd129661f54a0ae11b9'
         '73451bc5c35072b22b0b2925c5920978'
         '7adcf5e023718421a5e8e07e5e9a2480'
         '38ce6fbf16357ded687db57d5ef581bd'
         'daedd4114b213e9279806ee720eeb1ef'
         'd737d82dfab24adc516c001238a4119f')

package() {
  # extract make task and run it
  cd ${srcdir}/zarafa-${pkgver}
  grep -Pzo '(?s)install-ajax-webaccess.*' Makefile.in > Makefile
  make top_srcdir=. DESTDIR=${pkgdir} install-ajax-webaccess
 
  # prepare application
  mkdir -p ${pkgdir}/usr/share/webapps
  mv ${pkgdir}/usr/share/zarafa-webaccess ${pkgdir}/usr/share/webapps/${pkgname}
  mkdir -p ${pkgdir}/usr/share/webapps/${pkgname}/plugins
  rm ${pkgdir}/usr/share/webapps/${pkgname}/zarafa-webaccess.conf
  rm -rf ${pkgdir}/etc/zarafa
  
  # compress for nginx
  ${srcdir}/compress-static ${pkgdir}/usr/share/webapps/${pkgname}
  
  # prepare library
  mkdir -p ${pkgdir}/var/lib/${pkgname}
  mkdir -p ${pkgdir}/var/lib/${pkgname}/tmp
  mkdir -p ${pkgdir}/var/lib/${pkgname}/tmp/attachements
  mkdir -p ${pkgdir}/var/lib/${pkgname}/tmp/session
  
  # prepare logging
  mkdir -p ${pkgdir}/var/log/${pkgname}
  touch ${pkgdir}/var/log/${pkgname}/debug.txt
  ln -s /var/log/${pkgname}/debug.txt ${pkgdir}/usr/share/webapps/${pkgname}/debug.txt

  # prepare settings
  mkdir -p ${pkgdir}/etc/webapps/${pkgname}
  cp ${srcdir}/php-fpm.example.conf ${pkgdir}/etc/webapps/${pkgname}/
  cp ${srcdir}/nginx-ssl.example.conf ${pkgdir}/etc/webapps/${pkgname}/
  cp ${srcdir}/nginx-location.conf ${pkgdir}/etc/webapps/${pkgname}/
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/zarafa-webaccess.conf ${pkgdir}/etc/webapps/${pkgname}/apache.example.conf
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/config.php.dist ${pkgdir}/etc/webapps/${pkgname}/config.example.php
  cp ${srcdir}/zarafa-${pkgver}/php-webclient-ajax/debug.php ${pkgdir}/etc/webapps/${pkgname}/debug.example.php
  ln -s /etc/webapps/${pkgname}/config.php ${pkgdir}/usr/share/webapps/${pkgname}/config.php
  
  # => php
  mkdir -p ${pkgdir}/etc/php/conf.d
  cp ${srcdir}/zarafa-webaccess.ini ${pkgdir}/etc/php/conf.d

  # => php-fpm
  mkdir -p ${pkgdir}/etc/php/fpm.d
  cp ${srcdir}/zarafa-webaccess.conf ${pkgdir}/etc/php/fpm.d

  # => fix pear path
  sed -i 's$/usr/share/php/$/usr/share/pear/$' ${pkgdir}/etc/webapps/${pkgname}/config.example.php

}
