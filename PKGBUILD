# Maintainer: Stephen Molloy <sdmolloy@gmail.com>
# Maintainer: Kirill A Pshenichnyi <pshcyrill@mail.ru>
# Contributors: The Tango team (info@tango-controls.org)

pkgname=tango
pkgver=9.3.4
pkgrel=1
pkgdesc="Tango Controls a toolkit for controlling any kind of hardware or software and building SCADA systems"
arch=('i686' 'x86_64')
url="http://www.tango-controls.org/"
license=('GPL3')
depends=('jre8-openjdk' 'mysql' 'doxygen' 'zeromq' 'omniorb' 'binutils')
conflicts=()
source=("tango-$pkgver.tar.gz::https://github.com/tango-controls/TangoSourceDistribution/releases/download/$pkgver/tango-$pkgver.tar.gz")
md5sums=('e43b5e1d6297e56995388f73297e90dc')


build() {
	cd "$pkgname-$pkgver"
	read -r -p  "Will you enter the mysql host, admin and password now (if not you can create the .my.cnf file yourself later) [y/n]: " yn
	if [[ "$yn" =~ ^(y|Y|yes|Yes)$ ]]
	then
		read -r -p "MySQL host: " mysql_host
		read -r -p "MySQL admin: " mysql_admin
		read -s -r -p "MySQL password: " mysql_password
		echo ''
		./configure --prefix=/usr --with-mysql-ho=$mysql_host --with-mysql-admin=$mysql_admin --with-mysql-admin-passwd=$mysql_password
	else
		./configure --prefix=/usr
	fi
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
