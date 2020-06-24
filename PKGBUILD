# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Idares <idares@seznam.cz>
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
# Contributor: Vadym Abramchuk <abramm@gmail.com>
# Contributor: karol_007 <karol.blazewicz@gmail.com>

pkgname=zabbix-proxy-sqlite-lts
pkgver=5.0.1
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
	'zabbix-proxy.tmpfiles'
	'automake.patch'
	'musl-fix-includes.patch')

sha512sums=('66d16d6c8e0bac235b23bab9d6f5f5c29d96b508fd4834c16f82b7ca33591e36e44cd982e918c1c4736331d3f8c93535616c64be5596724842b1af5621508490'
            '78a0ff34910815eff8af5f2d66a650ae2e265c9a42e81b16bdf916f676861546e3fb915fe8b0841e95d674ff0bca3cbdb0ff6d00472448025110e215efa9a1a4'
            '6e4e8f16e467afe472e958a3ca4246fd499d56c67544ee5b21fdf94cee698534f9bc3caedc49a207f652500e25d4251d6b708e098fa82858aeb385ab4fbba314'
            'fa42d06ebf0ada6e80efa6479034afedf6ff6d2e8e6cb9e4bb34c682f438eb37c97a25eb76bf19576944781ff057603f851a0333109de065dec6feadb916228d'
            '3c63a2791e6ac77cb3144eb47a275cc8748f5c8943a076052300d6964994b95b18d60f504584fdcb683739dc514261402895e3f30ae2fbdb218acbc42c3d72df'
            '7f70dfd602aa164ec8cc65ebb7e8274c685975f6aea9051933928051b8d9b6e368e5a673a07e7084a2105468c5085d72fa7b9f934460f10648d594f28f031a91'
            '72709df7624d99b2eaab8d91d95167580e80da10b3ac65b7f27f12d858f0d051d4f9143bcabceae2bfd51aeb7c4ca93e2b74670637ec0925b026e3c52475d52b')

prepare() {
	cd $srcdir/zabbix-$pkgver
	patch -Np1 < $srcdir/automake.patch
	patch -Np1 < $srcdir/musl-fix-includes.patch
}

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
