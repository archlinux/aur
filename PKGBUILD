# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=delta-app
_pkgname=Delta
pkgver=1.0.0
pkgrel=1
pkgdesc="Cryptocurrency portfolio tracker"
arch=('x86_64')
url='https://getdelta.io'
license=('custom')
makedepends=('gendesk')
source=("https://static-assets.getdelta.io/desktop_app/$_pkgname-$pkgver-$arch.AppImage")
md5sums=('7ec5f287c880aa23fc6b8d9747bb0271')
options=(!strip)

prepare() {
	gendesk -f -n \
                --name "Delta" \
                --pkgname "$pkgname" \
                --pkgdesc "$pkgdesc" \
                --categories="Utility;Office"
}

package() {
	_appImage="$_pkgname-$pkgver-$arch.AppImage"

	# Extract files
	chmod +x "$srcdir/$_appImage"
	`$srcdir/$_appImage --appimage-extract`
	mv "$srcdir/squashfs-root" "$srcdir/$pkgname"

	# Install Icon
	install -Dm644 "$srcdir/$pkgname/usr/share/icons/hicolor/512x512/apps/delta.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -d "$pkgdir/opt/$pkgname"
	cp -a "$srcdir/$pkgname/." "$pkgdir/opt/$pkgname/"
	chmod -R +rx "$pkgdir/opt/$pkgname"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/app/delta" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
