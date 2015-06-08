# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix
pkgver=3.7.0
pkgrel=2
pkgdesc='A lightweight system monitoring tool that uses rrd databases.'
arch=('any')
url='http://www.monitorix.org'
license=('GPLv2')
depends=('perl' 'perl-cgi' 'perl-mailtools' 'perl-mime-lite' 'perl-libwww'
	'perl-dbi' 'perl-xml-simple' 'perl-config-simple' 'perl-config-general'
	'rrdtool' 'perl-http-server-simple')
optdepends=(
	'anything-sync-daemon: offload your databases to tmpfs to save i/o to your disk.'
	'hddtemp: enable support for hdd temp monitoring.'
	'lm_sensors: enable support for system temp monitoring.'
	'nvidia: enable support for nVidia card temp and usage monitoring.'
	'smartmontools: enable support for hdd bad sector monitoring.'
	'terminus-font: if graphs do not contain characters, you may need this font package.')
conflicts=$pkgname-git
backup=(etc/$pkgname/$pkgname.conf etc/$pkgname.conf)
install=readme.install
source=("http://www.$pkgname.org/$pkgname-$pkgver.tar.gz")
sha256sums=('b63d2bf2319a3c6086ebb899f048bf9e1298bdd43e8b0396d3ea66d4d819fef0')

prepare() {
	cd "$pkgname-$pkgver"

	# use Arch default location for http servers and enable built-in httpd
	sed -i -e '/^base_dir/ s,var\/lib\/monitorix\/www,srv\/http\/monitorix,' \
		-i -e '/^<httpd_builtin>/{$!N; s/y/n/}' $pkgname.conf
	
	# apply fix for RRDtool 1.5 scheduled to be included in the next release
	sed -i '/$macti = $minac/ s,"",0,' lib/system.pm
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" BASEDIR=/srv/http/monitorix \
		WWWDIR=/srv/http/monitorix install-systemd-all

	# Arch provides the license so do not duplicate it
	rm -f "$pkgdir/usr/share/doc/$pkgname/COPYING"
	
	# remove unneed files
	rm -f "$pkgdir/usr/share/doc/$pkgname/README.OpenBSD"
	rm -f "$pkgdir/usr/share/doc/$pkgname/README.NetBSD"
	rm -f "$pkgdir/usr/share/doc/$pkgname/README.FreeBSD"
}
