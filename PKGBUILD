# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
pkgbin=ledger-live-desktop
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
depends=('ledger-udev')
optdepends=('gconf' 'lib32-gtk2')
makedepends=('gendesk')
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(0f1877ec1a74e48a143348d89d929b9860a5aa805414989af1c3d991ae8fa0cfd1042e8c4b52aa6e4dfb6f727b97b00114f6eda6ef8f1deb81007616bc4ab758)

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
