# Maintainer: Christian Schritt <christian@devseed.de>

pkgname=defi-app-bin
pkgdesc='DefiChain Wallet AppImage'
_pkgbin=defi-wallet
license=('MIT')
url='https://github.com/DeFiCh/app'
pkgver=v2.6.0 # github-releases/DeFiCh/app
pkgrel=0
arch=('x86_64')
_package="DeFi-Wallet-${pkgver#v}.AppImage"
options=(!strip)
provides=('defi-app')
conflicts=('defi-app')
source=("${_package}::${url}/releases/download/${pkgver}/${_package}")
sha256sums=('c321e7cbfb62a4dd5d709ca87bc1764b60de5a4dce8d5e86ff56ad4ccb1b7157')

build() {
	# Extract files
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract

        # Correct .desktop
	sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"

        # remove obsolete binaries
        rm -rf $srcdir/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm* 
        rm -rf $srcdir/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/linux/ia32 
        rm -rf $srcdir/squashfs-root/resources/app.asar.unpacked/node_modules/7zip-bin/mac
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

