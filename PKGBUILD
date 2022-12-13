# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix
pkgver=3.15.0
pkgrel=1
pkgdesc='A lightweight system monitoring tool that uses rrd databases.'
arch=('any')
url='https://www.monitorix.org'
license=('GPL2')
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
sha256sums=('7eb0dea6ab272cf8838cf06d0cfd0325cfda9128d43a4743752f6bc4fafeb5de')

prepare() {
	cd "$pkgname-$pkgver"

	# use Arch default location for http servers and enable built-in httpd
	sed -i -e '/^base_dir/ s,var\/lib\/monitorix\/www,srv\/http\/monitorix,' \
		-i -e '/^<httpd_builtin>/{$!N; s/y/n/}' $pkgname.conf
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
