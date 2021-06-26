# Maintainer: Christian Schritt <christian@devseed.de>

pkgname=polkadot-js-desktop-bin
pkgdesc='Polkadot-js Desktop App'
_pkgbin=polkadot-apps
license=('MIT')
url='https://github.com/polkadot-js/apps'
pkgver=v0.93.1 # github-releases/polkadot-js/apps
pkgrel=0
arch=('x86_64')
_package="Polkadot-JS-Apps-${pkgver#v}.AppImage"
options=(!strip)
provides=($_pkgbin)
conflicts=($_pkgbin)
source=("${_package}::${url}/releases/download/${pkgver}/${_package}")
sha256sums=('4da7bdb6701f258b80fce8368a8780709ebdb0110a79201a69dfd0f5f544c2ff')

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

