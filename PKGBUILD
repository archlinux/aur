# Maintainer: artoo <artoo@manjaro.org>

_pkgname=ConsoleKit2

pkgname=consolekit
pkgver=0.9.4
pkgrel=1
pkgdesc="A framework for defining and tracking users, login sessions, and seats"
arch=('i686' 'x86_64')
url="https://github.com/ConsoleKit2/ConsoleKit2"
license=('GPL')
#provides=('logind')
depends=('dbus' 'glib2' 'libx11' 'polkit-consolekit' 'udev' 'zlib')
optdepends=('consolekit-openrc: consolekit openrc initscript')
makedepends=('xmlto' 'docbook-xsl')
options=('libtool')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver.tar.bz2"
		'consolekit.tmpfiles.conf'
		'25-consolekit.rules'
		'consolekit.pamd')
sha256sums=('b3e9554472f1a431576c317536d93ba1ef292916ea8447667deee0b555980e2e'
            '778552dc12b3c235bde200e476d4262da0c135f3f6f8b3e975a87881d1f154d1'
            'c5159d9fe8fdd52ad0d6a84af7ba00bac09edaae965896ab0d099a4df1c5ea6b'
            'f7b88e87f447e2d37c12886f57d932c385f19a8fef238e0f1de7a1746d8be69e')

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
		--without-systemdsystemunitdir

		make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir"/consolekit.tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/consolekit.conf

	rm -rf "${pkgdir}"/run

	install -dm 700 -o polkitd "${pkgdir}"/usr/share/polkit-1/rules.d
	install -m 644 ${srcdir}/25-consolekit.rules $pkgdir/usr/share/polkit-1/rules.d/75-consolekit.rules

	install -dm755 $pkgdir/etc/pam.d/
	install -Dm755 ${srcdir}/consolekit.pamd $pkgdir/etc/pam.d/consolekit
}
