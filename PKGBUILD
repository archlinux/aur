# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=roger-router
pkgver=1.8.12
pkgrel=1
pkgdesc="Roger Router"
arch=('i686' 'x86_64')
url="http://en.tabos.org/roger-router/"
license=('GPL2')
depends=(curl dbus glib2 libsndfile spandsp speex libxml2 gtk3 isdn4k-utils libpeas libsoup)
makedepends=(intltool libnotify libpulse libsecret gobject-introspection evolution)
optdepends=(
	'evolution: Address book integration'
	'libpulse: Pulse Audio support'
	'libsecret: Store passwords in keyring'
	'libnotify: Desktop notifications')
provides=(roger)
conflicts=(roger)
install=roger-router.install
source=(http://de.tabos.org/download/$pkgname-$pkgver.tar.xz)
sha1sums=('7b2d29ef0a1d027f26447f9a6bae503a8f3dcb9a')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	# Configuring without cups, as this will enable the experimentell CUPS backend
	# which is not functional yet.
	# See http://de.tabos.org/forum/viewtopic.php?f=6&t=3708&sid=9c3a58c9f53ce0aac0cd5d9ad8c8e351&p=5673#p5673
	# To build without evolution: --with-ebook=no
	# To build with kwallet support: --with-kwallet=yes
	./configure --prefix=/usr --disable-werror \
		--with-secret=yes \
		--with-cups=no \
		--with-appindicator3=no \
		--with-portaudio=no
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
