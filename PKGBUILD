# Maintainer: Jacob Parnell <aur@jakepenguins.xyz>
_pkgbin=internxt-drive
pkgname=internxt-drive-bin
provides=('internxt-drive')
pkgver=2.4.0
pkgrel=1
pkgdesc="Internxt Drive sync client GUI"
package="Internxt-Drive-${pkgver}.AppImage"
arch=('x86_64')
url='https://internxt.com'
license=('AGPL3')
source=("${package}::https://github.com/internxt/drive-desktop-linux/releases/download/v${pkgver}/${package}")
sha256sums=('d918a6cef5416c17d01ceb18d779277b15a1c5153151c8b2fb4f593ac7514060')

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
