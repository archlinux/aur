_pkgname=ConsoleKit2

pkgname=consolekit
pkgver=1.0.2
pkgrel=2
pkgdesc="A framework for defining and tracking users, login sessions, and seats"
arch=('i686' 'x86_64')
url="https://github.com/ConsoleKit2/ConsoleKit2"
license=('GPL')
provides=('consolekit2')
depends=('dbus' 'glib2' 'libx11' 'polkit-consolekit' 'udev' 'zlib')
optdepends=('consolekit-openrc: consolekit openrc initscript'
            'pm-utils: suspend/hibernate support')
makedepends=('xmlto' 'docbook-xsl')
options=('libtool')
install=consolekit.install
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2"
        'consolekit.tmpfiles.conf')
sha256sums=('a2f7697f1e081b68839b85e375a1b8fcda55c2ca76fa4d9118674c5d0e50e800'
            '778552dc12b3c235bde200e476d4262da0c135f3f6f8b3e975a87881d1f154d1')

prepare(){
	cd $srcdir/$_pkgname-$pkgver
}

build(){
	cd $srcdir/$_pkgname-$pkgver

    ./configure  \
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
        --disable-cgroups

		make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir"/consolekit.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/consolekit.conf

	rm -rf "${pkgdir}"/run
}

# vim:set ts=4 sts=4 sw=4 et:
