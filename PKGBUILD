# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>
# Contributor: artoo at manjaro.org
# Contributor: nous at archlinux.us

_pkgname=dbus
_gentoo_uri="https://raw.githubusercontent.com/gentoo/gentoo/master/sys-apps/dbus/files"
pkgname=dbus-openrc
pkgver=1.10.8
pkgrel=5
pkgdesc="Freedesktop.org message bus system, no systemd."
url="http://www.freedesktop.org/Software/dbus"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
groups=('eudev-base' 'openrc-base' 'openrc-desktop')
depends=('expat' "libdbus=${pkgver}" 'shadow' 'openrc')
makedepends=('libx11' 'xmlto' 'docbook-xsl' 'udev')
optdepends=('libx11: dbus-launch support')
provides=('dbus-core' "dbus=${pkgver}")
conflicts=('dbus-core' 'dbus' 'systemd-sysvcompat')
replaces=('dbus-openrc>20160101' 'dbus-eudev')
install=dbus.install
source=("http://dbus.freedesktop.org/releases/dbus/dbus-$pkgver.tar.gz" #{,.asc}
        "dbus.initd::${_gentoo_uri}/dbus.initd-r1"
        '30-dbus.sh')
sha256sums=('baf3d22baa26d3bdd9edc587736cd5562196ce67996d65b82103bedbe1f0c014'
            '4491c09942d72fd464bc1da286c4f5a237ec8debfbaba83c6fbf4a46d46fe51e'
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
        --disable-libaudit \
        --disable-systemd

    make
}

_inst_initd(){
	echo $1 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1
	install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1
	sed -e 's|/sbin|/usr/bin|' -e 's|/var/run|/run|g' -i ${pkgdir}/etc/init.d/$1
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
