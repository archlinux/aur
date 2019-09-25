# Maintainer: C. Dominik Bódi <dominik.bodi@dominikbodi.de>
pkgname=mandos-server
_srcname=mandos
pkgver=1.8.9
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
sha256sums=('9bec9f41b429fe9f554092719127b710a379003641d17aeb01189eb51dcf3deb'
            'd5d2d190799efdc4ecba1221a405983a3e770b085f055c1c156199436836dc47'
            '26ede8999354df4a1697e697d317c2f9e90c532ca849888d544c1905847ef1e5')

prepare() {
        mkdir -p "$_srcname-$pkgver/patches"
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
