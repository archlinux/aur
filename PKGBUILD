# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=roger-router
pkgver=1.9.3
pkgrel=5
pkgdesc="Journal, Fax-Software and Call-Monitor for AVM FRITZ!Box or compatible"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')
depends=(curl dbus glib2 libsndfile spandsp speex libxml2 gtk3 isdn4k-utils libpeas libsoup gupnp)
makedepends=(intltool gobject-introspection)
# To build all plugins use those dependencies:
#makedepends=(intltool gobject-introspection evolution gstreamer libnotify libpulse libsecret portaudio libappindicator-gtk3)
optdepends=(
	'evolution: Address book integration'
	'gstreamer: GStreamer support (recommended)'
	'libpulse: Pulse Audio support'
	'portaudio: PortAudio support'
	'libsecret: Store passwords in keyring (requires a compatible keyring application like gnome-keyring)'
	'libnotify: Desktop notifications'
	'libappindicator-gtk3: App indicator support')
provides=(roger)
conflicts=(roger)
install=roger-router.install
source=(
	https://www.tabos.org/wp-content/uploads/tabos/$pkgname-$pkgver.tar.xz
	address-book.svg
	)
sha1sums=(
	'b5c5a38ceb0e6db02684e552367deea981652875'
	'eea8152ef5472bf2e52f05651485ba3c60eb8e3f'
	)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	# To build without evolution: --with-ebook=no
	# To build with kwallet support: --with-kwallet=yes
	./configure --prefix=/usr \
		--with-secret=check \
		--with-pulseaudio=check \
		--with-portaudio=check

	# This file is missing from the release tarball, see https://www.tabos.org/topic/compile-error-2/
	cp "${srcdir}/address-book.svg" roger/images/
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	if [ "$CARCH" == "x86_64" ] ; then
		mv "$pkgdir/usr/lib64/" "$pkgdir/usr/lib/"
	fi

	#mkdir -p "$pkgdir/var/spool/roger"
	#chmod 2770 "$pkgdir/var/spool/roger"
	#chown root:fax "$pkgdir/var/spool/roger"

	mkdir -p "$pkgdir/usr/lib/cups/backend"
	mv "$pkgdir/usr/share/roger/roger-cups" "$pkgdir/usr/lib/cups/backend/roger-cups"
	chmod 0755 "$pkgdir/usr/lib/cups/backend/roger-cups"

	mkdir -p "$pkgdir/usr/share/cups/model"
	mv "$pkgdir/usr/share/roger/roger-fax.ppd" "$pkgdir/usr/share/cups/model/roger-fax.ppd"

	# The install-fax.sh script is not very useful in our setup and probably even harmful.
	rm "$pkgdir/usr/share/roger/install-fax.sh"
}
