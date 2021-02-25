# Maintainer: Christian Schritt <christian@devseed.de>

pkgname=defi-app-bin
pkgdesc='DefiChain Wallet AppImage'
_pkgbin=defi-app
license=('MIT')
url='https://github.com/DeFiCh/app'
pkgver=v2.3.0 # github-releases/DeFiCh/app
pkgrel=3
arch=('x86_64')
_package="defi-app-${pkgver#v}.AppImage"
options=(!strip)
provides=('defi-app')
conflicts=('defi-app')
source=("${_package}::${url}/releases/download/${pkgver#v}/${_package}")
sha512sums=('e042a6fae936cbd4f92ea2e5b893a5d20f432c96c2b6adf5ee790af7cb22cdd63f92a937b40f4955349df95aeb8df3e2af84b73084dd380a71bfedad9979945f')

build() {
	# Extract files
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract

        # Correct .desktop
	sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
	install -d "$pkgdir/opt/$__pkgbin"
	cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"
	chmod -R +rx "$pkgdir/opt/$_pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

	install -d "$pkgdir/usr/share"
	cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

	find "$pkgdir" -type d -exec chmod 755 {} +

	install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
}

