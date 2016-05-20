# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Julio Napurí <julionc@gmail.com>
pkgname=webgrind
pkgver=1.2
pkgrel=1
pkgdesc='Xdebug Profiling Web Frontend in PHP.'
arch=('any')
url='https://github.com/jokkedk/webgrind'
license=('BSD')
depends=('php' 'xdebug')
install="${pkgname}.install"
source=("https://github.com/jokkedk/webgrind/archive/${pkgver}.zip")
sha512sums=('0b70999dc9b3214409088631ac3d439ade799b040dc66ea3f115aa24dd91549efe2ceaa4fdc494abf52a6a315d06ac4226c60a64668986c22fc5d272c1db638f')

package() {
  mkdir -p "${pkgdir}/usr/share/webapps/webgrind"
  mkdir -p "${pkgdir}/etc/webapps/webgrind"

  cd "${srcdir}/webgrind-${pkgver}"
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
