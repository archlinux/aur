# Maintainer: Jacob Parnell <aur at jakepenguins dot xyz>
_pkgbin=internxt
pkgname=internxt-bin
provides=('internxt')
replaces=("internxt-drive-bin")
pkgver=2.5.4
pkgrel=1
pkgdesc="Internxt cloud storage client"
_package="Internxt-${pkgver}.AppImage"
arch=('x86_64')
url='https://internxt.com'
license=('AGPL3')
source=("${_package}::https://github.com/internxt/drive-desktop-linux/releases/download/v${pkgver}/${_package}")
sha256sums=('67a33b1a7cfe223c8b98d3c26c550763f41f8d4124886ed5d57b18d0043eb8c2')

build() {
	# Extract files from AppImage
	chmod +x "$srcdir/$_package"
	$srcdir/$_package --appimage-extract

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
