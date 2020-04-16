# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=ledger-live-bin
pkgdesc='Ledger Hardware Wallet management software'
pkgbin=ledger-live-desktop
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=2.2.3
pkgrel=1
arch=('x86_64')
package="ledger-live-desktop-${pkgver}-linux-${arch}.AppImage"
depends=('ledger-udev' 'gconf')
optdepends=('lib32-gtk2')
makedepends=('gendesk')
options=(!strip)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${package}"
)
sha512sums_x86_64=(750cc8ef95dd72dba513e667fc7cdc0915e6db7c28c579a21d0f505831b6adf7b28707ff472037ef31d820e456fcf3516e70a7e762dc9087131306c6ccf62d83)

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
