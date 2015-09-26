# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Sabart Otto <seberm at gmail dot com>

pkgname=adminer
pkgver=4.2.2
pkgrel=2
pkgdesc="A full-featured MySQL management tool written in PHP."
arch=('any')
license=('Apache', 'GPL')
depends=('php')
conflicts=('adminer-git')
optdepends=('mysql' 'apache' 'adminer-skins' 'postgresql' 'sqlite3')
url="https://www.adminer.org"
install=${pkgname}.install
source=("${pkgname}.install"
        "https://www.adminer.org/static/download/${pkgver}/${pkgname}-${pkgver}.php") 
sha256sums=('f3d2c8d2119cccf4d84d32ad2662300eecda62ffba7304505e563e192b5a10ef'
            '4dced0c64dbeb0f6e9a27c4ec5838bbf5f33b82c368a8965b47ae3da6c9bcb2c')

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  mkdir -p ${_instdir} $pkgdir/etc/webapps/$pkgname $pkgdir/etc/httpd/conf/extra

  install -D -m644 $srcdir/${pkgname}-${pkgver}.php $_instdir/index.php

  # It's similar to phpMyAdmin
  cat >$pkgdir/etc/webapps/$pkgname/apache.example.conf <<EOF
	Alias /${pkgname} "/usr/share/webapps/${pkgname}"
	<Directory "/usr/share/webapps/${pkgname}">
		AllowOverride All
		Options FollowSymlinks
		Require all granted
		php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
	</Directory>
EOF

  cp $pkgdir/etc/webapps/$pkgname/apache.example.conf $pkgdir/etc/httpd/conf/extra/httpd-${pkgname}.conf
#  echo "Include conf/extra/httpd-${pkgname}.conf" >> $pkgdir/etc/httpd/conf/httpd.conf

}
