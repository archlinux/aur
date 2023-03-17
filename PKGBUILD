# Maintainer: Felix Golatofski <contact at xdfr dot de>
# Contributor: Karel Louwagie <aur at karellouwagie dot net>
# Contributor: Idares <idares at seznam dot cz>
# Contributor: Enrico Morelli <morelli at cerm dot unifi dot it>
# Contributor: Vadym Abramchuk <abramm at gmail dot com>
# Contributor: karol_007 <karol dot blazewicz at gmail dot com>

pkgname=zabbix-proxy-sqlite-2.4
pkgver=2.4.8
pkgrel=2
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.zabbix.com"
license=('GPL')
depends=('sqlite3' 'fping' 'openipmi' 'libxml2')
makedepends=('binutils' 'gcc' 'make' 'fakeroot')
backup=('etc/zabbix/zabbix_proxy.conf')

install='zabbix-proxy.install'
source=("https://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$pkgver/zabbix-$pkgver.tar.gz"
        'zabbix-proxy.install'
	'zabbix-proxy.service'
	'zabbix-proxy.sysusers'
	'zabbix-proxy.tmpfiles')

sha512sums=('bf0816279f771448076bd8d8f1efe65651e24964b402ba128aace3d5afc0333f808a9d48b5763e334a05bc9f53fa934d81cc1b90072a0e9ba74b29205ab2b300'
            '78a0ff34910815eff8af5f2d66a650ae2e265c9a42e81b16bdf916f676861546e3fb915fe8b0841e95d674ff0bca3cbdb0ff6d00472448025110e215efa9a1a4'
            '6e4e8f16e467afe472e958a3ca4246fd499d56c67544ee5b21fdf94cee698534f9bc3caedc49a207f652500e25d4251d6b708e098fa82858aeb385ab4fbba314'
            'fa42d06ebf0ada6e80efa6479034afedf6ff6d2e8e6cb9e4bb34c682f438eb37c97a25eb76bf19576944781ff057603f851a0333109de065dec6feadb916228d'
            '3c63a2791e6ac77cb3144eb47a275cc8748f5c8943a076052300d6964994b95b18d60f504584fdcb683739dc514261402895e3f30ae2fbdb218acbc42c3d72df')

build() {
	cd $srcdir/zabbix-$pkgver
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/zabbix \
		--enable-proxy \
		--enable-ipv6 \
		--with-sqlite3 \
		--with-ssh2 \
		--with-net-snmp \
		--with-openipmi \
		--with-libxml2 \
		--with-libcurl

	make
}

package() {
	cd $srcdir/zabbix-$pkgver
	make DESTDIR=$pkgdir install

	install -d -m0750 $pkgdir/var/log/zabbix

	install -D -m0644 $srcdir/zabbix-proxy.service $pkgdir/usr/lib/systemd/system/zabbix-proxy.service

	# change pid file location
	sed -i 's:# PidFile=.*:PidFile=/run/zabbix/zabbix_proxy.pid:' $pkgdir/etc/zabbix/zabbix_proxy.conf

	# tmpfile
	install -D -m 0644 $srcdir/zabbix-proxy.tmpfiles $pkgdir/usr/lib/tmpfiles.d/zabbix-proxy.conf

	# sysusers
	install -D -m 0644 $srcdir/zabbix-proxy.sysusers $pkgdir/usr/lib/sysusers.d/zabbix-proxy.conf
}
