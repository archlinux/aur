# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Idares <idares@seznam.cz>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Vadym Abramchuk <abramm@gmail.com>
# Contributor: karol_007 <karol.blazewicz@gmail.com>

pkgname=zabbix-proxy-sqlite-lts
pkgver=5.0.0
pkgrel=1
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.zabbix.com"
license=('GPL')
depends=('sqlite3' 'fping' 'openipmi' 'libxml2')
makedepends=('binutils' 'gcc' 'make' 'fakeroot')
backup=('etc/zabbix/zabbix_proxy.conf')

install='zabbix-proxy.install'
source=("https://cdn.zabbix.com/zabbix/sources/stable/5.0/zabbix-${pkgver}.tar.gz"
        'zabbix-proxy.install'
	'zabbix-proxy.service'
	'zabbix-proxy.sysusers'
	'zabbix-proxy.tmpfiles')

sha512sums=('056aee99d19def2f673813e29bb7869fa7906abe6956fddbeac359195167abe06add21ef08baf68a5ad6e256323a797e604cdd7828f34be2762daf7b31923984'
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
		--with-openssl \
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
