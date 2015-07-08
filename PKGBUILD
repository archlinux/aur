# Maintainer: C. Dominik Bódi <dominik.bodi@dominikbodi.de>
pkgname=mandos-server
_srcname=mandos
pkgver=1.6.9
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
	     pkg-config)
optdepends=('fping: host uptime checking - legacy method')
backup=('etc/mandos/mandos.conf'
	'etc/mandos/clients.conf'
	'etc/dbus-1/system.d/mandos.conf')
install=mandos.install
source=("http://ftp.recompile.se/pub/mandos/mandos_1.6.9.orig.tar.gz"
	'fix_makefile.patch')
sha256sums=('bf04b7786c5c29409ca48454de25aa3e70f2bbd3428a393d3424069f89e3a40e'
            '73af9f42039d4b843f13ca3985ec5ab4809ecd092c2f229db57e36deb671b54d')
prepare() {
	patch -p2 -i fix_makefile.patch
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
