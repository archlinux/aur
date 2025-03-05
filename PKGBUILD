# Submitter: Christian Schritt <christian@devseed.de>
# Maintainer: gee

pkgname=defi-app-bin
pkgdesc='DefiChain Wallet AppImage'
_pkgbin=defi-wallet
license=('MIT')
url='https://github.com/BirthdayResearch/defichain-app'
pkgver=v4.2.5
pkgrel=1
arch=('x86_64')
_package="DeFi-Wallet-${pkgver#v}.AppImage"
provides=('defi-app')
conflicts=('defi-app')
source=("${url}/releases/download/${pkgver}/${_package}"{,.SHA256})
sha256sums=('9b7433d047362aa368d1cf6c63e3b78c80d2bcee31188156c4b78594cea85c23'
            'db9355d147b3c14485cd3e5f55be3721f68362fb5d854b5ec0f9e739da7186aa')
OPTIONS=(!strip)

prepare() {
    # Verify the checksum from the .sha256 file
    sha256sum -c ${_package}.SHA256 || return 1
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

