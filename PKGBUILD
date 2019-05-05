# Maintainer: Bruce Zhang
pkgname=gitnote
pkgver=3.1.0
pkgrel=1
pkgdesc="A modern note taking app based on Git."
arch=('x86_64' 'i686')
url="https://gitnoteapp.com/"
license=('unknown')
depends=('electron2' 'libappindicator-gtk2' 'libnotify' 'libcurl-gnutls')
makedepends=('p7zip')
source=("https://github.com/zhaopengme/gitnote/releases/download/$pkgver/GitNote_setup_$pkgver.AppImage")
sha256sums=('3c225efabdb91f49c3ad40817877756bc8249d543f2401fc43ca2015a789fce6')

prepare() {
	mkdir gitnote
	cd gitnote
	7z x "../GitNote_setup_$pkgver.AppImage"
}

package() {
	cd "$srcdir/gitnote/usr/share"
	find ./icons -type f -exec install -Dm644 {} "$pkgdir/usr/share/{}" \;

	cd "$srcdir/gitnote"
	install -Dm644 ./resources/app.asar "$pkgdir/usr/share/gitnote/app.asar"

	cd "$srcdir/gitnote/resources"
	find ./app.asar.unpacked -type f -exec install -Dm644 {} "$pkgdir/usr/share/gitnote/{}" \;

	echo "#!/usr/bin/env sh
exec electron2 /usr/share/gitnote/app.asar" > "$srcdir/gitnote.sh"
	install -Dm755 "$srcdir/gitnote.sh" "$pkgdir/usr/bin/gitnote"

	echo "[Desktop Entry]
Name=GitNote
Comment=A modern note taking app based on GIT.
Exec=/usr/bin/gitnote
Terminal=false
Type=Application
Icon=gitnote
StartupWMClass=GitNote
Categories=Utility;
" > "$srcdir/gitnote.desktop"
	install -Dm644 "$srcdir/gitnote.desktop" "$pkgdir/usr/share/applications/gitnote.desktop"
}
