# Maintainer: Your Name <youremail@domain.com>
pkgname=earlyoom
pkgver=0.9
pkgrel=2
pkgdesc="Early OOM Daemon for Linux"
arch=('any')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
source=(
	"https://github.com/rfjakob/$pkgname/archive/v$pkgver.tar.gz"
)
md5sums=('59fe2bff6677686a76e6aaec5b4b2be8')

# TODO: wirft Fehler weil wir nicht in einem gitrepo sind, da im Makefile irgendwie GITVERSION per git gesetzt wird.
# Wie wärs: GITVERSION zu VERSION umbenennen, und wenn sie für's script noch nicht von außerhalb gesetzt ist, dann per
# git berechnen? Dann kann ich da meine $pkgver reinwerfen.
build() {
	cd "$pkgname-$pkgver"
	make VERSION=$pkgver
}

package() {
	cd "$pkgname-$pkgver"

	# earlyoom's make install script can't be parameterized for a location, therefore do it by hand.
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/lib/systemd/system/"
	# TODO: Das service-file will /usr/local/bin/earlyoom starten, und hat auch sonst komische Optionen
	# sed oder ganz neu.
	install -m 644 ./earlyoom.service "${pkgdir}/usr/lib/systemd/system/earlyoom.service"
	install -m 755 ./earlyoom "${pkgdir}/usr/bin/earlyoom"
}
