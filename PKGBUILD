# Maintainer: picokan <todaysoracle@protonmail.com>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: micwoj92 <micwoj9292@gmail.com>

_pkgname=ConsoleKit2

pkgname=consolekit
pkgver=2.0.0
pkgrel=1
pkgdesc="A framework for defining and tracking users, login sessions, and seats"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ConsoleKit2/ConsoleKit2"
license=(GPL-2.0-only)
provides=('elogind')
depends=('dbus' 'glib2' 'libx11' 'polkit-consolekit' 'udev' 'zlib' 'python3')
makedepends=('acl' 'xmlto' 'docbook-xsl' 'python-setuptools' 'glib2-devel' 'gobject-introspection')
options=('libtool')
install=consolekit.install
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        'consolekit.tmpfiles.conf')
sha256sums=('f3f4a424f2a4fbb67696b4011caf2fd4c02e5e67c24ef1c86cecb2301bccdba4'
            '778552dc12b3c235bde200e476d4262da0c135f3f6f8b3e975a87881d1f154d1')

build(){
	cd $srcdir/$_pkgname-$pkgver

    ./autogen.sh  \
        --prefix=/usr \
        --sysconfdir=/etc \
        --sbindir=/usr/bin \
        --with-rundir=/run \
        --libexecdir=/usr/lib/ConsoleKit \
        --localstatedir=/var \
        --enable-polkit \
        --enable-pam-module \
        --enable-udev-acl \
        --enable-docbook-docs \
        --with-dbus-services=/usr/share/dbus-1/services \
        --with-xinitrc-dir=/etc/X11/xinit/xinitrc.d \
        --with-pam-module-dir=/usr/lib/security \
        --without-systemdsystemunitdir \
        --disable-cgroups \
        --disable-dependency-tracking

		make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir"/consolekit.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/consolekit.conf

	rm -rf "${pkgdir}"/run
}

# vim:set ts=4 sts=4 sw=4 et:
