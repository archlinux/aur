# Maintainer: andrew.boren <andrew.boren@gmail.com>

pkgname=zabbix-agent
pkgver=2.2.14
pkgrel=1
pkgdesc="Software designed for monitoring availability and performance of IT infrastructure components"
arch=('i686' 'x86_64')
url="http://www.zabbix.com"
license=('GPL')
backup=('etc/zabbix/zabbix_agent.conf'
        'etc/zabbix/zabbix_agentd.conf'
		)
install="zabbix-agent.install"
source=("http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/$pkgver/zabbix-$pkgver.tar.gz"
        "zabbix-agent.install"
		"zabbix-agentd.service"
		"zabbix-agentd.tmpfiles"
		)

build() {
	cd $srcdir/zabbix-$pkgver
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc/zabbix \
		--with-libcurl \
		--enable-agent
	make
}

package() {
	cd $srcdir/zabbix-$pkgver
	make DESTDIR=$pkgdir install

	install -d -m0750 $pkgdir/var/log/zabbix

	install -D -m0644 $srcdir/zabbix-agentd.service $pkgdir/usr/lib/systemd/system/zabbix-agentd.service

	# change pid file location
	sed -i 's:# PidFile=.*:PidFile=/run/zabbix/zabbix_agentd.pid:' $pkgdir/etc/zabbix/zabbix_agentd.conf
	# change log file location
	sed -i 's:^LogFile=.*:LogFile=/var/log/zabbix/zabbix_agentd.log:' $pkgdir/etc/zabbix/zabbix_agentd.conf

	# tmpfile
	install -D -m 0644 $srcdir/zabbix-agentd.tmpfiles $pkgdir/usr/lib/tmpfiles.d/zabbix-agentd.conf
}

md5sums=('f3d686e275e5aab4573b00927a3626d2'
         '519372592b66392255bfbf24e9469748'
         'd7ef5c8a7a6352dabecb9105da63fc84'
         '9ce692356b4ac0a71595ce55fe3b44c1')
sha1sums=('5366e17549065f37be049f0d81320c9891408b20'
          'dcd2331be84f7b795087c8427f5c92837f2cf4ff'
          'acfe6a783cad8f28e7f23a65189af9a7d22bb540'
          '8926befcb944732fd59a34c89b569d3fbef1ca9d')

