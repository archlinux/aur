# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=avahi-nosystemd
pkgver=0.7
pkgrel=2
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour'
url='https://github.com/lathiat/avahi'
license=('LGPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('expat' 'libdaemon' 'glib2' 'libcap' 'gdbm' 'dbus')
optdepends=('gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'qt4: qt4 bindings'
            'pygtk: avahi-bookmarks'
            'python2-twisted: avahi-bookmarks'
            'mono: mono bindings'
            'nss-mdns: NSS support for mDNS'
            'python-gobject: avahi-discover'
            'python-dbus: avahi-discover')
provides=("avahi=${pkgver}")
replaces=('avahi')
conflicts=('avahi')
makedepends=('qt4' 'pygtk' 'mono' 'intltool' 'python-dbus' 'python-gobject'
             'gtk-sharp-2' 'gobject-introspection' 'gtk3' 'xmltoman' 'git'
             'doxygen' 'graphviz')
backup=('etc/avahi/hosts'
        'etc/avahi/avahi-daemon.conf'
        'usr/lib/avahi/service-types.db')
_commit=6242e5f0fe001b7de2ccaa9431db279b2ee76b83  # tags/v0.7
source=("git+https://github.com/lathiat/avahi#commit=$_commit"
        avahi-daemon.rc
        avahi-dnsconfd.rc
        0001-avahi-python-Use-the-agnostic-DBM-interface.patch)
sha1sums=('SKIP'
          '2f580771e008ed09e9c6caf5ee0a2707a6f04ded'
          'c14d281a023b2c3ed834a107ad1e7f13c5c7469a'
          'f5519fe4338e5d984a44ee9dff3d7c7ea10c3965')

install=avahi.install

prepare() {
	cd avahi

	patch -Np1 -i ../0001-avahi-python-Use-the-agnostic-DBM-interface.patch
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd avahi

	export MOC_QT4=/usr/bin/moc-qt4
	export PYTHON=/usr/bin/python3

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-monodoc \
		--disable-qt3 \
		--enable-compat-libdns_sd \
		--with-distro=archlinux \
		--with-avahi-priv-access-group=network \
		--with-autoipd-user=avahi \
		--with-autoipd-group=avahi
	sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

	cp -a avahi-python/avahi avahi-python/avahi2

	make
	make -C avahi-python/avahi2 PYTHON=/usr/bin/python2
}

package() {
	cd avahi

	make DESTDIR="${pkgdir}" install
	make DESTDIR="$pkgdir" -C avahi-python/avahi2 install \
		PYTHON=/usr/bin/python2 pythondir=/usr/lib/python2.7/site-packages

	# this isn't ported
	sed -i '1s|python3|python2|' "$pkgdir/usr/bin/avahi-bookmarks"

	# mdnsresponder compat
	ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

	# install rc scripts
	install -Dm755 "$srcdir"/avahi-daemon.rc "$pkgdir"/etc/rc.d/avahi-daemon
	install -Dm755 "$srcdir"/avahi-dnsconfd.rc "$pkgdir"/etc/rc.d/avahi-dnsconfd
}
