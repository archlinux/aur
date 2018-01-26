# Maintainer: Kirill A Pshenichnyi <pshcyrill@mail.ru>
# Contributors: The Tango team (info@tango-controls.org)

pkgname=tango
pkgver=9.2.5a
pkgrel=1
pkgdesc="Tango Controls a toolkit for controlling any kind of hardware or software and building SCADA systems"
arch=('i686' 'x86_64')
url="http://www.tango-controls.org/"
license=('GPL3')
depends=('jre8-openjdk' 'mysql56' 'doxygen' 'zeromq' 'omniorb' 'binutils')
conflicts=('')
source=("tango-$pkgver.tar.gz::https://netix.dl.sourceforge.net/project/tango-cs/tango-$pkgver.tar.gz")
md5sums=('db8bb308ac2304090b93636c5462fd0e')


build() {
	cd "$pkgname-$pkgver"
	read -r -p  "will you enter the mysql host, admin and password now, or create the .my.cnf file yourself? [y/n]: " yn
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
