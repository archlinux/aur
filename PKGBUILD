# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=avahi-nosystemd
pkgver=0.6.31
pkgrel=2
_commit=573e3b5
pkgdesc='Multicast DNS-SD / Zeroconf Suite'
url='http://www.avahi.org/'
license=('LGPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('expat' 'libdaemon' 'glib2' 'libcap' 'gdbm' 'dbus')
optdepends=('gtk3: avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'qt4: qt4 bindings'
            'pygtk: avahi-bookmarks, avahi-discover'
            'python2-twisted: avahi-bookmarks'
            'mono: mono bindings'
            'python2-dbus: avahi-discover'
            'nss-mdns: NSS support for mDNS')
provides=("avahi=${pkgver}" 'howl' 'mdnsresponder')
replaces=('avahi' 'howl' 'mdnsresponder')
conflicts=('avahi' 'howl' 'mdnsresponder')
makedepends=('qt4' 'pygtk' 'mono' 'intltool' 'python2-dbus'
             'gtk-sharp-2' 'gobject-introspection' 'gtk3' 'xmltoman' 'git')
backup=('etc/avahi/hosts'
        'etc/avahi/avahi-daemon.conf'
        'etc/avahi/services/ssh.service'
        'etc/avahi/services/sftp-ssh.service'
        'usr/lib/avahi/service-types.db'
        'usr/share/avahi/service-types')
source=("git+https://github.com/heftig/avahi#commit=$_commit"
        avahi-daemon.rc
        avahi-dnsconfd.rc)
sha1sums=('SKIP'
          '2f580771e008ed09e9c6caf5ee0a2707a6f04ded'
          'c14d281a023b2c3ed834a107ad1e7f13c5c7469a')

install=avahi.install

prepare() {
	cd avahi

	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd avahi

	export MOC_QT4=/usr/bin/moc-qt4
	export PYTHON=/usr/bin/python2

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-monodoc \
		--disable-qt3 \
		--enable-compat-libdns_sd \
		--enable-compat-howl \
		--with-distro=archlinux \
		--with-avahi-priv-access-group=network \
		--with-autoipd-user=avahi \
		--with-autoipd-group=avahi

	cp -a avahi-python/avahi avahi-python/avahi3

	make
	make -C avahi-python/avahi3 PYTHON=/usr/bin/python3
}

package() {
	cd avahi

	make DESTDIR="${pkgdir}" install
	make DESTDIR="$pkgdir" -C avahi-python/avahi3 install \
		PYTHON=/usr/bin/python3 pythondir=/usr/lib/python3.4/site-packages

	# howl and mdnsresponder compatability
	ln -s avahi-compat-howl "$pkgdir/usr/include/howl"
	ln -s avahi-compat-howl.pc "$pkgdir/usr/lib/pkgconfig/howl.pc"

	# install rc scripts
	install -Dm755 "$srcdir"/avahi-daemon.rc "$pkgdir"/etc/rc.d/avahi-daemon
	install -Dm755 "$srcdir"/avahi-dnsconfd.rc "$pkgdir"/etc/rc.d/avahi-dnsconfd
}
