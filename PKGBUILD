# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: graysky <graysky AT archlinux dot us>

pkgname=monitorix-git
_pkgname=Monitorix
pkgver=3.14.0.r131.g842cf2c
pkgrel=1
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
conflicts=('monitorix')
replaces=('monitorix')
backup=("etc/monitorix/monitorix.conf")
install=readme.install
source=("git+https://github.com/mikaku/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd ${_pkgname}
  # work around for AUR helpers
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${_pkgname}

	# use Arch default location for http servers and enable built-in httpd
	sed -i -e '/^base_dir/ s,var\/lib\/monitorix\/www,srv\/http\/monitorix,' \
		-i -e '/^<httpd_builtin>/{$!N; s/y/n/}' ${_pkgname,,}.conf
}

package() {
	cd ${_pkgname}
	make DESTDIR="$pkgdir" BASEDIR=/srv/http/monitorix \
		WWWDIR=/srv/http/monitorix install-systemd-all

	# Arch provides the license so do not duplicate it
	rm -f "$pkgdir/usr/share/doc/${_pkgname,,}/COPYING"

	# remove unneed files
	rm -f "$pkgdir/usr/share/doc/${_pkgname,,}/README.OpenBSD"
	rm -f "$pkgdir/usr/share/doc/${_pkgname,,}/README.NetBSD"
	rm -f "$pkgdir/usr/share/doc/${_pkgname,,}/README.FreeBSD"
}
