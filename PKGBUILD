# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
pkgbin=ledger-live-desktop
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=1.2.1
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
makedepends=('gendesk')
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(ab27f6812b28810484bd479eac3dccb223bf5b369993a8541b5d3576d7e0cc2338e6693a4d11424d677709920d1bc3fea82d6486a1cfe0ce26782180844c1317)

prepare() {
	gendesk -f -n \
                --name "Ledger Live" \
                --pkgname "$pkgname" \
                --pkgdesc "$pkgdesc" \
                --categories="Utility;Office"
}

package() {

	# Extract files
	chmod +x "$srcdir/$package"
	`$srcdir/$package --appimage-extract`
	# Clean old build dir files
	rm -rf $srcdir/$pkgbin
	mv -f "$srcdir/squashfs-root" "$srcdir/$pkgbin"

	# Install Icon
	install -Dm644 "$srcdir/$pkgbin/usr/share/icons/hicolor/0x0/apps/ledger-live-desktop.png" "$pkgdir/usr/share/pixmaps/$pkgbin.png"

	install -d "$pkgdir/opt/$pkgbin"
	cp -a "$srcdir/$pkgbin/." "$pkgdir/opt/$pkgbin/"
	chmod -R +rx "$pkgdir/opt/$pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgbin/app/ledger-live-desktop" "$pkgdir/usr/bin/$pkgbin"
	# Provided .desktop file tries to run "AppRun" instead of ledger-live-desktop
	sed -e 's/AppRun/ledger-live-desktop/g' -i $srcdir/$pkgbin/$pkgbin.desktop
	install -Dm644 "$srcdir/$pkgbin/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
}
