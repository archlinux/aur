# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=roger-router
pkgver=1.8.14
pkgrel=1
pkgdesc="Roger Router"
arch=('i686' 'x86_64')
url="http://en.tabos.org/roger-router/"
license=('GPL2')
depends=(curl dbus glib2 libsndfile spandsp speex libxml2 gtk3 isdn4k-utils libpeas libsoup gupnp)
makedepends=(intltool libnotify libpulse libsecret gobject-introspection evolution)
optdepends=(
	'evolution: Address book integration'
	'libpulse: Pulse Audio support'
	'libsecret: Store passwords in keyring'
	'libnotify: Desktop notifications')
provides=(roger)
conflicts=(roger)
install=roger-router.install
source=(http://www.tabos.org/downloads/$pkgname-$pkgver.tar.xz)
sha1sums=('2bbaaaf840ee6944c93530d89786630ac09b2439')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	# To build without evolution: --with-ebook=no
	# To build with kwallet support: --with-kwallet=yes
	./configure --prefix=/usr \
		--with-secret=yes \
		--with-pulseaudio=yes \
		--with-portaudio=check \
		--with-kwallet=check
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/var/spool/roger"
	chmod 2770 "$pkgdir/var/spool/roger"
	chown root:lp "$pkgdir/var/spool/roger"

	mkdir -p "$pkgdir/usr/lib/cups/backend"
	mv "$pkgdir/usr/share/roger/roger-cups" "$pkgdir/usr/lib/cups/backend/roger-cups"
	chmod 0755 "$pkgdir/usr/lib/cups/backend/roger-cups"

	mkdir -p "$pkgdir/usr/share/cups/model"
	mv "$pkgdir/usr/share/roger/roger-fax.ppd" "$pkgdir/usr/share/cups/model/roger-fax.ppd"

	# The install-fax.sh script is not very useful in our setup and probably even harmful.
	rm "$pkgdir/usr/share/roger/install-fax.sh"
}
