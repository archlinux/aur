# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix
pkgver=3.8.1
pkgrel=3
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
	'net-tools: for netstat monitoring'
	'nvidia: enable support for nVidia card temp and usage monitoring.'
	'perl-dbd-mysql: for mysql monitoring'
	'smartmontools: enable support for hdd bad sector monitoring.'
	'terminus-font: if graphs do not contain characters, you may need this font package.')
conflicts=("$pkgname-git")
backup=("etc/$pkgname/$pkgname.conf" "etc/$pkgname.conf")
install=readme.install
source=("http://www.$pkgname.org/$pkgname-$pkgver.tar.gz")
sha256sums=('d284f9a7296a42fcb8e8f67c7c8400fa5fba95c49016bebc87f0f66fc3094e90')

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
