# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: jaco <jacopo[at]autistici[dot]org>

_pkgname=dbus
_gentoo_uri="https://raw.githubusercontent.com/gentoo/gentoo/master/sys-apps/dbus/files"

pkgname=dbus-openrc
pkgver=1.10.6
pkgrel=2
pkgdesc="Freedesktop.org message bus system, package got from manjaro's official repository"
url="http://www.freedesktop.org/Software/dbus"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
groups=('openrc-base' 'openrc-desktop')
depends=('expat' "libdbus=${pkgver}" 'openrc')
makedepends=('libx11' 'xmlto' 'docbook-xsl' 'udev')
optdepends=('libx11: dbus-launch support'
            'dbus-openrc: dbus openrc initscript')
provides=('dbus-core' "dbus=${pkgver}")
conflicts=('dbus-core' 'dbus'
            'systemd-sysvcompat')
#replaces=('dbus-core' 'dbus')
install=dbus.install
source=("http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz" #{,.asc}
        "dbus.initd::${_gentoo_uri}/dbus.initd-r1"
	'30-dbus.sh')
sha256sums=('b5fefa08a77edd76cd64d872db949eebc02cf6f3f8be82e4bbc641742af5d35f'
            '7c1429585cd08f57d420b87bebb89c1fccf963414a0d591021df85c8372f5cab'
            'dc1ce6d38674bad7a48ad1911576f8bbb3819f1019126fb1ef7c3cfad16bb02a')

build() {
    cd $_pkgname-$pkgver
    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/dbus-1.0 \
        --with-dbus-user=dbus \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --with-console-auth-dir=/run/console/ \
        --enable-inotify \
        --disable-verbose-mode \
        --disable-static \
        --disable-tests \
        --disable-asserts \
        --disable-systemd \
        --disable-user-session

    make
}
_inst_initd(){
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

	sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
		-e 's|/var/run|/run|g' \
		-i ${pkgdir}/etc/init.d/$1
}

package(){
    cd $_pkgname-$pkgver

    # Disable installation of libdbus
    sed -i -e 's/^SUBDIRS = dbus/SUBDIRS =/' Makefile

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}/var/run"
    rm -rf "${pkgdir}/usr/lib/pkgconfig"

    install -Dm755 ../30-dbus.sh "$pkgdir/etc/X11/xinit/xinitrc.d/30-dbus"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/dbus/COPYING"

    _inst_initd 'dbus'

    sed -e 's|dbus.pid|dbus/pid|g' -i "${pkgdir}/etc/init.d/dbus"
}
