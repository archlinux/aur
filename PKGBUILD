# Amintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Julio Napurí <julionc@gmail.com>
pkgname=webgrind
pkgver=1.0
pkgrel=1
pkgdesc='Xdebug Profiling Web Frontend in PHP.'
arch=('any')
url='http://code.google.com/p/webgrind/'
license=('BSD')
depends=('php' 'xdebug' 'php-apache')
install="${pkgname}.install"
source=("http://webgrind.googlecode.com/files/webgrind-release-${pkgver}.zip")
md5sums=('66ce2840eecd315052aa6d194dccb659')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/webgrind"
  mkdir -p "${pkgdir}/etc/webapps/webgrind"

  cd "${srcdir}/webgrind"
  sed -e 's#config.php#./config.php#g' -i index.php
  sed -e 's#library/FileHandler.php#./library/FileHandler.php#g' -i index.php

  install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp config.php  "${pkgdir}/etc/webapps/webgrind/config.sample.php"
  cp ${pkgdir}/etc/webapps/webgrind/config.sample.php ${pkgdir}/etc/webapps/webgrind/config.php
  rm config.php
  cp -R . "${pkgdir}/usr/share/webapps/webgrind"
  ln -s  /etc/webapps/webgrind/config.php "${pkgdir}/usr/share/webapps/webgrind/config.php"

  echo "deny from all" >$pkgdir/etc/webapps/webgrind/.htaccess
  cat >${pkgdir}/etc/webapps/webgrind/apache.example.conf <<EOF
	Alias /webgrind "/usr/share/webapps/webgrind"
	<Directory "/usr/share/webapps/webgrind">
		AllowOverride All
		Options FollowSymlinks
		Order allow,deny
		Allow from all
	</Directory>
EOF
}
