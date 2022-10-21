# Maintainer: Jacob Parnell <aur@jakepenguins.xyz>
_pkgbin=internxt-drive
pkgname=internxt-drive-bin
pkgver=1.9.4
pkgrel=1
pkgdesc="Internxt Drive sync client GUI"
package="Internxt-Drive-${pkgver}.appimage"
arch=('x86_64')
url='https://internxt.com'
license=('AGPL3')
source=("${package}::https://github.com/internxt/drive-desktop/releases/download/v${pkgver}/${package}")
sha256sums=('07409e732d1b5beb755cad9d7981ee614aeeba7227f1f7ab02edf67ea151c55e')

build() {
	# Extract files from AppImage
	chmod +x "$srcdir/$package"
	$srcdir/$package --appimage-extract

	# Correct .desktop exec command
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
}
