# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Contributor: Julio Napurí <julionc@gmail.com>
pkgname=webgrind
pkgver=1.3.1
pkgrel=1
pkgdesc='Xdebug Profiling Web Frontend in PHP.'
arch=('any')
url='https://github.com/jokkedk/webgrind'
license=('BSD')
depends=('php' 'xdebug')
install="${pkgname}.install"
source=("https://github.com/jokkedk/webgrind/archive/v${pkgver}.zip")
sha512sums=('670d36d8b94959bc1592e0693c5d5e0b80003eeebdb639c001e2555f74ef94650d660daaca4237b56617c6ec2cc4ff01deae52a1e954d1e395e48cf1ed02a681')

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
