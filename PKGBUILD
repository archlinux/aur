# Maintainer: Serge K <arch@phnx47.net>
# Contributor: Stephen Argent <steve [at] tuxcon [dot] com>

# Repository for PR: https://gitlab.com/phnx47-aur/ledger-live-bin

_pkgbin=ledger-live-desktop
pkgname=ledger-live-bin
pkgdesc='Ledger Live - Desktop'
license=('MIT')
url='https://github.com/LedgerHQ/ledger-live-desktop'
pkgver=2.24.0
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
sha512sums=('f86d1ba409400fc6fbf5c3d6f12dee5078c9749b0da9269081a9b521051ffe3f51bae8897b8cd438e803bde4e7be1948458eec2765d9867b656e579522a41d8a'
            '0e76943ab7d3849ee569a30a46dec494658b8de9937965a81d043ad957116bf9c8bdb9bb9aee20e2f00fb15b736df90bbe6144dc2088a968ced2cc7b8e2de07f')

build() {
	# Extract files
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract

	# Correct .desktop
	sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
	install -d "$pkgdir/opt/$_pkgbin"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"
	chmod -R +rx "$pkgdir/opt/$_pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
