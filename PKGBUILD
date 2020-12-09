# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

# Repository for PR: https://gitlab.com/phnx47-aur/ledger-live-bin

pkgname=ledger-live-bin
pkgdesc='Ledger Live - Desktop'
pkgbin=ledger-live-desktop
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=2.17.1
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
depends=('ledger-udev')
options=(!strip)
provides=('ledger-live')
conflicts=('ledger-live')
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
  "LICENSE"
)
sha512sums=('3afbcd93098c45b2823e750e89ae7b94d16f01b8ace9befda3edb7e86cf9075fe0cef2079ed00799db89632ce328ffa322006ea66dbb9bc4b82aca9b3e41cd87'
            '0e76943ab7d3849ee569a30a46dec494658b8de9937965a81d043ad957116bf9c8bdb9bb9aee20e2f00fb15b736df90bbe6144dc2088a968ced2cc7b8e2de07f')


package() {
	# Clean old build dir files
	rm -rf "$srcdir/squashfs-root"

	# Extract files
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract
	rm -rf "$srcdir/squashfs-root/$pkgbin.png"
	
	install -d "$pkgdir/opt/$pkgbin"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgbin/"
	chmod -R +rx "$pkgdir/opt/$pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgbin/$pkgbin" "$pkgdir/usr/bin/$pkgbin"

	# Fix icon folders
	mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/2x2" "$srcdir/squashfs-root/usr/share/icons/hicolor/128x128"
	mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/3x3" "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256"
	mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/4x4" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
	mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/5x5" "$srcdir/squashfs-root/usr/share/icons/hicolor/1024x1024"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"
	
	# Correct .desktop
	sed -e "s/AppRun/${pkgbin}/g" -i "$srcdir/squashfs-root/$pkgbin.desktop"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
