# Maintainer: Jacob Parnell <jparnell@mailfence.com>
_pkgbin=internxt-drive
pkgname=internxt-drive-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="Internxt Drive client UI"
package="internxt-drive-${pkgver}_x86_64.AppImage"
arch=('x86_64')
url='https://internxt.com'
license=('AGPL3')
source=("${package}::https://github.com/internxt/drive-desktop/releases/download/v${pkgver}/${package}")
sha256sums=('54e474de28c6cc5b9d6c4147d6238c72b6e670ae5239ffed37854dec0fff1000')

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
