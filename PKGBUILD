# Submitter: Christian Schritt <christian@devseed.de>
# Maintainer: gee

pkgname=defi-app-bin
pkgdesc='DefiChain Wallet AppImage'
_pkgbin=defi-wallet
license=('MIT')
url='https://github.com/BirthdayResearch/defichain-app'
pkgver=v4.0.8
pkgrel=2
arch=('x86_64')
_package="DeFi-Wallet-${pkgver#v}.AppImage"
provides=('defi-app')
conflicts=('defi-app')
source=("${url}/releases/download/${pkgver}/${_package}"{,.SHA256})
sha256sums=('12c414f6e3e0450bfe0bea5414180e9a8a4baa31b063b56d9d9207166aef4ced'
            '0c0d8dc0f8c91c250501d63d6088142aab33fd3a554e67103c82d54ff4d7769d')
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

