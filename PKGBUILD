# Maintainer: Rowan Lewis <rl@nbsp.io>
# Contributor: Andrew Webley <unsuspectinghero@gmail.com>
# Contributor: Christian Chung <christian@cys.codes>

_pkgname=firefox-gtk3
pkgname=$_pkgname-bin
pkgver=44.0a1.20151007171834
_firefoxver=44.0a1
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org (GTK+ 3)"
arch=(x86_64)
license=("MPL" "LGPL" "GPL")
depends=('gtk2' 'libxt' 'dbus-glib' 'gtk3' 'alsa-lib' 'dbus-glib' 'nss>=3.14.1' 'hunspell')
url="https://bugzilla.mozilla.org/show_bug.cgi?id=627699"
conflicts=(firefox-gtk3)
provides=(firefox-gtk3)

_elmdir="elm-linux"
[[ "$CARCH" == "x86_64" ]] && _elmdir="elm-linux64"
_baseurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/tinderbox-builds/$_elmdir/latest"
_filename="firefox-$_firefoxver.en-US.linux-$CARCH"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep sha512 | cut -d " " -f1)"

sha512sums=("$_sha512sum"
			"cdfe2eb4b883760b3e967b025570ddbfeed7376fa0d617e33395ccc6e7c5b0bc241ed335c0655e8ccc78ebfe0890003af11faf1ffe6ff2334af9e77a7424af40")

source=("$_baseurl/$_filename.tar.bz2"
		"firefox-gtk3.desktop")
install="$pkgname.install"

pkgver(){
	cd "$srcdir/firefox"
	echo "$_firefoxver.$(cat platform.ini | grep BuildID | cut -d "=" -f2)"
}

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/lib/"
	mv firefox "$pkgdir/usr/lib/$_pkgname/"
	chmod -R 645 "$pkgdir/usr/lib/$_pkgname/"

	cd "$pkgdir/usr/lib/$_pkgname/"

	for i in 16 32 48; do
 		install -Dm644 browser/chrome/icons/default/default$i.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox-gtk3.png"
	done
	install -Dm644 "browser/icons/mozicon128.png" "$pkgdir/usr/share/pixmaps/$pkgname-icon.png"

	# Use system-provided dictionaries
	rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
	ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox-gtk3/dictionaries"
	ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox-gtk3/hyphenation"

	mkdir "$pkgdir/usr/bin/"
	ln -s "/usr/lib/firefox-gtk3/firefox" "$pkgdir/usr/bin/firefox-gtk3"

	mkdir "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/firefox-gtk3.desktop" "$pkgdir/usr/share/applications"
}
