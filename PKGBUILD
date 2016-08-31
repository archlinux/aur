# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Link Dupont <link@subpop.net>

_url="https://raw.githubusercontent.com/gentoo/gentoo/master"
_pkgname=dbus

pkgname=dbus-openrc
pkgver=1.10.10
pkgrel=5
pkgdesc="Freedesktop.org message bus system"
url="https://wiki.freedesktop.org/www/Software/dbus/"
arch=("i686" "x86_64")
license=("GPL" "custom")
provides=("libdbus" "dbus")
depends=("libeudev" "expat")
makedepends=("eudev" "xmlto" "docbook-xsl" "python" "yelp-tools" "doxygen" 'libx11')
conflicts=("libdbus" "dbus")
source=("https://dbus.freedesktop.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz"
        "dbus.initd::${_url}/sys-apps/dbus/files/dbus.initd-r1")
sha256sums=('9d8f1d069ab4d1a0255d7b400ea3bcef4430c42e729b1012abb2890e3f739a43'
            '4491c09942d72fd464bc1da286c4f5a237ec8debfbaba83c6fbf4a46d46fe51e')

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

    sed -e 's|#!/sbin/runscript|#!/usr/bin/openrc-run|' \
            -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|' \
            -e 's|/var/run|/run|g' \
            -e 's|dbus.pid|dbus/pid|g' \
            -i ${pkgdir}/etc/init.d/$1
}

prepare() {
    cd $_pkgname-$pkgver
#   autoreconf -fvi
}

build() {
    cd $_pkgname-$pkgver
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --libexecdir=/usr/lib/dbus-1.0 --with-dbus-user=dbus \
        --with-system-pid-file=/run/dbus/pid \
        --with-system-socket=/run/dbus/system_bus_socket \
        --with-console-auth-dir=/run/console/ \
        --enable-inotify --disable-static \
        --disable-verbose-mode --disable-asserts \
        --disable-systemd --disable-user-session
    make
}

package() {
    cd $_pkgname-$pkgver

    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/var/run"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"

    # Split docs
    rm -rv "$pkgdir/usr/share/doc"

    _inst_initd 'dbus'
}
