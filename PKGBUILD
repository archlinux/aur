# Maintainer: Jacob Parnell <aur at jakepenguins dot xyz>
_pkgbin=internxt
pkgname=internxt-bin
provides=('internxt')
replaces=("internxt-drive-bin")
pkgver=2.4.8
pkgrel=1
pkgdesc="Internxt cloud storage client"
_package="Internxt-${pkgver}.AppImage"
arch=('x86_64')
url='https://internxt.com'
license=('AGPL3')
source=("${_package}::https://github.com/internxt/drive-desktop-linux/releases/download/v${pkgver}/${_package}")
sha256sums=('ec2bb09af4d5f245f746e8683b048fef2d4ff4bfd403a895c8c7b2deb131b136')

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
