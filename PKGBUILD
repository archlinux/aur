# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=avahi-nosystemd
pkgver=0.6.31
pkgrel=1
pkgdesc='Multicast/unicast DNS-SD framework'
url='http://www.avahi.org/'
license=('LGPL')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('expat' 'libdaemon' 'glib2' 'libcap' 'gdbm' 'dbus')
optdepends=('gtk3: avahi-discover-standalone, bshell, bssh, bvnc'
            'gtk2: gtk2 bindings'
            'qt4: qt4 bindings'
            'pygtk: avahi-bookmarks, avahi-discover'
            'twisted: avahi-bookmarks'
            'mono: mono bindings'
            'python2-dbus: avahi-discover'
            'nss-mdns: NSS support for mDNS')
provides=("avahi=${pkgver}" 'howl' 'mdnsresponder')
replaces=('avahi' 'howl' 'mdnsresponder')
conflicts=('avahi' 'howl' 'mdnsresponder')
makedepends=('qt4' 'pygtk' 'mono' 'intltool' 'python2-dbus'
             'gtk-sharp-2' 'gobject-introspection' 'gtk3' 'xmltoman')
backup=('etc/avahi/hosts'
        'etc/avahi/avahi-daemon.conf'
        'etc/avahi/services/ssh.service'
        'etc/avahi/services/sftp-ssh.service'
        'usr/lib/avahi/service-types.db'
        'usr/share/avahi/service-types')
source=("http://www.avahi.org/download/avahi-${pkgver}.tar.gz"
        rc.d.patch)
sha1sums=('7e05bd78572c9088b03b1207a0ad5aba38490684'
          'd40050547c5637e77ef51fcf11936f0724bd7844')

install=avahi.install

prepare() {
	cd "${srcdir}/avahi-${pkgver}"
	sed '/^Libs:/s:$: -ldbus-1:' -i avahi-client.pc.in
	sed 's:netdev:network:g' -i avahi-daemon/avahi-dbus.conf
	sed 's:/sbin/resolvconf:/usr/sbin/resolvconf:g' -i */*.action
	sed 's:-DG[^ ]*_DISABLE_DEPRECATED=1::g' -i avahi-ui/Makefile.*

	patch -p1 -i ../rc.d.patch
}

build() {
	cd "${srcdir}/avahi-${pkgver}"
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
		--with-autoipd-group=avahi \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \

	make
}

package() {
	cd "${srcdir}/avahi-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# howl and mdnsresponder compatability
	cd "${pkgdir}"/usr/include; ln -s avahi-compat-libdns_sd/dns_sd.h dns_sd.h; ln -s avahi-compat-howl howl
	cd "${pkgdir}"/usr/lib/pkgconfig; ln -s avahi-compat-howl.pc howl.pc
}
