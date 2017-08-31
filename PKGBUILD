# Maintainer: Idares <idares at seznam dot cz>

pkgname=nagios
pkgver=4.3.4
pkgrel=1
pkgdesc="Nagios is an open source host, service and network monitoring program."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.nagios.org"
depends=('gd' 'freetype2' 'libtool' 'glib2')
makedepends=('unzip')
optdepends=('monitoring-plugins: a bundle of standard plugins'
            'apache' 'php-apache' 'nginx' 'php' 'php-fpm' 'fcgiwrap')
source=("http://downloads.sourceforge.net/nagios/$pkgname-$pkgver.tar.gz"
        "nagios.install"
        "nagios.service")
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

	make \
		prefix=$pkgdir/$_instdir \
		BINDIR=$pkgdir/$_bindir \
		LOGDIR=$pkgdir/$_vardir \
		CFGDIR=$pkgdir/$_confdir \
		HTTPD_CONF=$pkgdir/$_httpdconfdir \
		CHECKRESULTDIR=$pkgdir/$_checkresultdir \
		install install-config

	install -D -m 755 daemon-init $pkgdir/etc/nagios/
#	install -D -m 644 sample-config/httpd.conf $pkgdir/$_httpdconfdir/nagios.conf
	install -D -m 644 sample-config/httpd.conf $pkgdir/$_httpdconfdir/apache.example.conf
	install -D -m 644 $srcdir/nagios.service $pkgdir/usr/lib/systemd/system/nagios.service

	mkdir $pkgdir/var/nagios/rw
	chown $_nagios_user.$_nagios_group $pkgdir/var/nagios/rw
	chmod 755 $pkgdir/var/nagios/rw

	chmod 755 $pkgdir/usr/bin
	chmod 755 $pkgdir/usr/bin/nagios

	find $pkgdir/etc/nagios -name '*cfg' -exec mv "{}" "{}.sample" \; > /dev/null

}

md5sums=('e2229f9a98c2577d51576daf19713e4d'
         'e11fa7de430ed858269f82e179fc87ca'
         '49e077f2d61ede589f55bfd03b597ab0')
sha1sums=('15e38467fecf8c42200d1f253e5b7d4d124abec1'
          '04008cee208226e60b099550bd9ec7dc78cb1457'
          '0df0b4c6976c1562b03e261926b7c2cae6061595')

