# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=avahi-nosystemd
pkgver=0.7+18+g1b5f401
pkgrel=1
pkgdesc='Service Discovery for Linux using mDNS/DNS-SD -- compatible with Bonjour'
url='https://github.com/lathiat/avahi'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('expat' 'libdaemon' 'glib2' 'libcap' 'gdbm' 'dbus')
optdepends=('gtk3: avahi-discover, avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'qt4: qt4 bindings'
            'qt5-base: qt5 bindings'
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
             'doxygen' 'graphviz' 'qt5-base')
backup=('etc/avahi/hosts'
        'etc/avahi/avahi-daemon.conf'
        'etc/avahi/avahi-autoipd.action'
        'etc/avahi/avahi-dnsconfd.action'
        'usr/lib/avahi/service-types.db')
_commit=1b5f401f64d7bed40c4335b0327acf4125da3086  # pull/115/merge~2
source=("git+https://github.com/lathiat/avahi#commit=$_commit"
        avahi-daemon.rc
        avahi-dnsconfd.rc)
sha512sums=('SKIP'
            '6e9d7bcebd69325ed9e131f68077779c45dc3a6018d4d069b9d57553d89bf3a5201e483e8c114f8c02fb3b37678f3decfc6a259b22c32bb0ed5956bd9d4d2312'
            'b4f45f6dcb1e9f2406d1dac4c51999d764855f61f5f8f0b45677606b1aa74d712273270747961591fa166f03abb11913018bee42cb2437c246170557acbe9b41')

install=avahi.install

prepare() {
	cd avahi

	# CVE-2017-6519 CVE-2018-100084
	git cherry-pick -n e111def44a7df4624a4aa3f85fe98054bffb6b4f

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
		with_dbus_sys=/usr/share/dbus-1/system.d \
		--disable-monodoc \
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

	rmdir "$pkgdir/run"

	# this isn't ported
	sed -i '1s|python3|python2|' "$pkgdir/usr/bin/avahi-bookmarks"

	# mdnsresponder compat
	ln -s avahi-compat-libdns_sd/dns_sd.h "$pkgdir/usr/include/dns_sd.h"

	# install rc scripts
	install -Dm755 "$srcdir"/avahi-daemon.rc "$pkgdir"/etc/rc.d/avahi-daemon
	install -Dm755 "$srcdir"/avahi-dnsconfd.rc "$pkgdir"/etc/rc.d/avahi-dnsconfd
}
