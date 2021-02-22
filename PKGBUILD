# Maintainer: Christian Schritt <christian@devseed.de>

pkgname=defi-app-bin
pkgdesc='DefiChain Wallet AppImage'
_pkgbin=defi-app
license=('MIT')
url='https://github.com/DeFiCh/app'
pkgver=2.1.17
pkgrel=0
arch=('x86_64')
_package="defi-app-${pkgver}.AppImage"
options=(!strip)
provides=('defi-app')
conflicts=('defi-app')
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('e042a6fae936cbd4f92ea2e5b893a5d20f432c96c2b6adf5ee790af7cb22cdd63f92a937b40f4955349df95aeb8df3e2af84b73084dd380a71bfedad9979945f'
)

build() {
	# Extract files
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract
}


package() {
	install -d "$pkgdir/opt/$pkgbin"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$pkgbin/"
	chmod -R +rx "$pkgdir/opt/$pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgbin/$pkgbin" "$pkgdir/usr/bin/$pkgbin"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
}

