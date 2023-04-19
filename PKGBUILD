# Maintainer: Idares <idares at seznam dot cz>

pkgname=nagios
pkgver=4.4.11
pkgrel=1
pkgdesc="Nagios is an open source host, service and network monitoring program."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
depends=('gd' 'freetype2' 'libtool' 'glib2')
makedepends=('unzip')
optdepends=('monitoring-plugins: a bundle of standard plugins'
            'apache' 'php-apache' 'nginx' 'php' 'php-fpm' 'fcgiwrap')
source=("https://github.com/NagiosEnterprises/nagioscore/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        "nagios.install")
install='nagios.install'

_nagios_user="nagios"
_nagios_group="nagios"
_instdir="usr/share/nagios"
_bindir="usr/bin"
_vardir="var/nagios"
_confdir="etc/nagios"
_httpdconfdir="etc/webapps/$pkgname/"
_checkresultdir="var/nagios/spool/checkresults"
_perldir="$_instdir/bin"

getent group $_nagios_group > /dev/null || _nagios_group=30
getent passwd $_nagios_user > /dev/null || _nagios_user=30

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure \
		--with-nagios-user=$_nagios_user \
		--with-nagios-group=$_nagios_group \
		--prefix="/$_instdir" \
		--bindir="/$_bindir" \
		--localstatedir="/$_vardir" \
		--sysconfdir="/$_confdir" \
		--with-httpd-conf="/$_httpdconfdir" \
		--with-checkresultdir="/$_checkresultdir" \
		--enable-embedded-perl

	make all
}

package() {
	cd $srcdir/$pkgname-$pkgver

	DESTDIR="$pkgdir/" make \
		prefix=$_instdir \
		BINDIR=$_bindir \
		LOGDIR=$_vardir \
		CFGDIR=$_confdir \
		HTTPD_CONF=$_httpdconfdir \
		CHECKRESULTDIR=$_checkresultdir \
		install install-config

	install -D -m 644 sample-config/httpd.conf $pkgdir/$_httpdconfdir/apache.example.conf
	install -D -m 644 startup/default-service $pkgdir/usr/lib/systemd/system/nagios.service

	mkdir $pkgdir/var/nagios/rw
	chown $_nagios_user:$_nagios_group $pkgdir/var/nagios/rw
	chmod 755 $pkgdir/var/nagios/rw

	chmod 755 $pkgdir/usr/bin
	chmod 755 $pkgdir/usr/bin/nagios

	find $pkgdir/etc/nagios -name '*cfg' -exec mv "{}" "{}.sample" \; > /dev/null

}

md5sums=('2c7acd82d983af2729e86659d0a18429'
         'e11fa7de430ed858269f82e179fc87ca')
sha1sums=('53d56f9ebbcef6e8f46c44c627cca62b8f15606b'
          '04008cee208226e60b099550bd9ec7dc78cb1457')

