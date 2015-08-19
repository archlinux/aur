# Maintainer: C. Dominik Bódi <dominik.bodi@dominikbodi.de>
pkgname=mandos-server
_srcname=mandos
pkgver=1.7.0
pkgrel=1
pkgdesc="unlock LUKS encrypted drives remotely - server component"
arch=(any)
url="https://wiki.recompile.se/wiki/Mandos"
license=('GPL3')
depends=(avahi
	 gnupg
	 python2-gnutls
	 python-gobject2
	 python2-gobject2
         python-dbus
         python2-dbus
	 python-urwid
	 python2-urwid
	 openssh)
makedepends=(docbook-xml
             docbook-xsl
	     pkg-config
	     quilt)
optdepends=('fping: host uptime checking - legacy method')
backup=('etc/mandos/mandos.conf'
	'etc/mandos/clients.conf'
	'etc/dbus-1/system.d/mandos.conf')
install=mandos.install
source=("http://httpredir.debian.org/debian/pool/main/m/mandos/mandos_$pkgver.orig.tar.gz"
        'series'
	'fix_makefile.patch')
sha256sums=('37f145c575d4b49eaa2d0b6ed8067d1e4687f7fa3927b6154f7a5d7907ba947a'
            'd5d2d190799efdc4ecba1221a405983a3e770b085f055c1c156199436836dc47'
            'e51e3db7faa66af3bc307c7a2503b2b23d702896a5027660a01d3cc2e4dedb1b')

prepare() {
        mkdir "$_srcname-$pkgver/patches"
	cp series "$_srcname-$pkgver/patches/"
	cp fix_makefile.patch "$_srcname-$pkgver/patches/"
	cd "$_srcname-$pkgver"
	quilt push -a
}

build() {
	cd "$_srcname-$pkgver"
	make doc
	make
}

check() {
	cd "$_srcname-$pkgver"
	make -k check
}

package() {
	cd "$_srcname-$pkgver"
	install --directory $pkgdir/var/lib/mandos
	install -D --mode=u=rwx,go=rx mandos $pkgdir/usr/bin/mandos
	install -D --mode=u=rwx,go=rx mandos-ctl $pkgdir/usr/bin/mandos-ctl
	install -D --mode=u=rwx,go=rx mandos-monitor $pkgdir/usr/bin/mandos-monitor
	install -D --mode=u=rw,go=r mandos.conf $pkgdir/etc/mandos/mandos.conf
	install -D --mode=u=rw clients.conf $pkgdir/etc/mandos/clients.conf
	install -D --mode=u=rw,go=r dbus-mandos.conf $pkgdir/etc/dbus-1/system.d/mandos.conf
	install -D --mode=u=rw,go=r mandos.service $pkgdir/usr/lib/systemd/system/mandos.service
	install -D mandos.8 $pkgdir/usr/share/man/man8/mandos.8
	install -D mandos-monitor.8 $pkgdir/usr/share/man/man8/mandos-monitor.8
	install -D mandos-ctl.8 $pkgdir/usr/share/man/man8/mandos-ctl.8
	install -D mandos.conf.5 $pkgdir/usr/share/man/man5/mandos.conf.5
	install -D mandos-clients.conf.5 $pkgdir/usr/share/man/man5/mandos-clients.conf.5
	install -D intro.8mandos $pkgdir/usr/share/man/man8/intro.8mandos
	gzip --best $pkgdir/usr/share/man/man8/mandos.8
	gzip --best $pkgdir/usr/share/man/man8/mandos-monitor.8
	gzip --best $pkgdir/usr/share/man/man8/mandos-ctl.8
	gzip --best $pkgdir/usr/share/man/man5/mandos.conf.5
	gzip --best $pkgdir/usr/share/man/man5/mandos-clients.conf.5
	gzip --best $pkgdir/usr/share/man/man8/intro.8mandos

}
