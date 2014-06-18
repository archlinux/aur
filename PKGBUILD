# $Id: PKGBUILD 212820 2014-05-15 14:29:12Z eric $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

_pkgname=avahi
pkgname=avahi-gtk2
pkgver=0.6.31
pkgrel=12
pkgdesc='Multicast/unicast DNS-SD framework (with Gtk2 client apps)'
url='http://www.avahi.org/'
license=('LGPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('expat' 'libdaemon' 'glib2' 'libcap' 'gdbm' 'dbus')
replaces=(${_pkgname})
optdepends=('gtk2: avahi-discover-standalone, bshell, bssh, bvnc, gtk2 bindings'
            'qt4: qt4 bindings'
            'pygtk: avahi-bookmarks, avahi-discover'
            'twisted: avahi-bookmarks'
            'python2-dbus: avahi-discover'
            'nss-mdns: NSS support for mDNS')
makedepends=('qt4' 'pygtk' 'intltool' 'python2-dbus'
             'gobject-introspection' 'gtk2' 'xmltoman')
backup=('etc/avahi/hosts'
        'etc/avahi/avahi-daemon.conf'
        'etc/avahi/services/ssh.service'
        'etc/avahi/services/sftp-ssh.service'
	'usr/lib/avahi/service-types.db'
	'usr/share/avahi/service-types')
source=("http://www.avahi.org/download/avahi-${pkgver}.tar.gz")
sha1sums=('7e05bd78572c9088b03b1207a0ad5aba38490684')

conflicts=(${_pkgname} 'howl' 'mdnsresponder')
provides=("${_pkgname}=${pkgver}" 'howl' 'mdnsresponder')

install=install

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	sed '/^Libs:/s:$: -ldbus-1:' -i avahi-client.pc.in
	sed 's:netdev:network:g' -i avahi-daemon/avahi-dbus.conf
	sed 's:/sbin/resolvconf:/usr/sbin/resolvconf:g' -i */*.action
	sed 's:-DG[^ ]*_DISABLE_DEPRECATED=1::g' -i avahi-ui/Makefile.*
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	export MOC_QT4=/usr/bin/moc-qt4
	export PYTHON=/usr/bin/python2

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--disable-mono \
		--disable-gtk3 \
		--disable-monodoc \
		--disable-qt3 \
		--enable-compat-libdns_sd \
		--enable-compat-howl \
		--with-distro=archlinux \
		--with-avahi-priv-access-group=network \
		--with-autoipd-user=avahi \
		--with-autoipd-group=avahi \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \

	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -fr "${pkgdir}"/etc/rc.d

	# howl and mdnsresponder compatability
	cd "${pkgdir}"/usr/include; ln -s avahi-compat-libdns_sd/dns_sd.h dns_sd.h; ln -s avahi-compat-howl howl
	cd "${pkgdir}"/usr/lib/pkgconfig; ln -s avahi-compat-howl.pc howl.pc
}
