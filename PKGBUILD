# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
pkgbin=ledger-live-desktop
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=2.3.2
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
depends=('ledger-udev')
optdepends=('lib32-gtk2')
makedepends=('gendesk')
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(aacfdd9b1c22c55d6254b40728e54ae0240d8fedf9e4ca3bc05b7fd42257582d18830036a9d44a5a26299f5b46c6bf46eb32bf720ad90e5581aaba92d8b0f220)

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
	$srcdir/$package --appimage-extract
	# Clean old build dir files
	rm -rf $srcdir/$pkgbin
	mv -f "$srcdir/squashfs-root" "$srcdir/$pkgbin"

	# Install Icon
	install -Dm644 "$srcdir/$pkgbin/usr/share/icons/hicolor/5x5/apps/ledger-live-desktop.png" "$pkgdir/usr/share/pixmaps/$pkgbin.png"

	install -d "$pkgdir/opt/$pkgbin"
	cp -a "$srcdir/$pkgbin/." "$pkgdir/opt/$pkgbin/"
	chmod -R +rx "$pkgdir/opt/$pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgbin/ledger-live-desktop" "$pkgdir/usr/bin/$pkgbin"
	# Provided .desktop file tries to run "AppRun" instead of ledger-live-desktop
	sed -e 's/AppRun/ledger-live-desktop/g' -i $srcdir/$pkgbin/$pkgbin.desktop
	install -Dm644 "$srcdir/$pkgbin/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
}
