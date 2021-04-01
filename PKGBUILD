# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-desktop-wallet
_pkgname=cro-chain-desktop
pkgname=cro-chain-desktop-bin
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-com/chain-desktop-wallet'
pkgver=0.1.3
pkgrel=1
arch=('x86_64')
package="chain-desktop-wallet-${pkgver}-${arch}.AppImage"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
  "LICENSE"
)
sha512sums=('83630e4bd38f48be133852cae278361ee51c577de7d53d932d0bba356a88bcb7427d031934529809abc3eadb9cc6cdedb2e285b6f39a475bae839d3042389492'
            'cd660ca9bc594ae6476c54e50d49c7e886c2f7dbaffb1876ef866c4a6dd219f734996f42361a4d958688b04e3b6188f0384bcf0690060a1e46306448bb70ca09')

build() {
	# Extract files
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract

	# Correct .desktop, icon
	mv -f "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0" "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512"
	sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
	install -d "$pkgdir/opt/$_pkgname"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgname/"
	chmod -R +rx "$pkgdir/opt/$_pkgname"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgname/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
