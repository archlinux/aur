# Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Maintainer: Jan-Tarek Butt <tarek at ring0 dot de>

pkgbase=bootstrap-studio
pkgname=bootstrap-studio
pkgver=4.5.3
pkgrel=2
pkgdesc='A powerful desktop app for creating responsive websites using the Bootstrap framework.'
url='https://bootstrapstudio.io/'
arch=('x86_64')
depends=('gconf')
source=($pkgname-$pkgver.deb::'https://bootstrapstudio.io/releases/desktop/4/Bootstrap%20Studio%204%20(64bit).deb')

prepare() {
	# Extract files
	tar --xz -xf "$srcdir"/data.tar.xz

	# Fix desktop entry
	sed -i "s|Exec=.*|Exec=/usr/bin/$pkgname %F|" \
		"$srcdir"/usr/share/applications/bootstrapstudio.desktop

	sed -i "s|Path=.*|Path=/usr/bin/|" \
		"$srcdir"/usr/share/applications/bootstrapstudio.desktop
}

package() {
	# Create directory
	install -d "$pkgdir"/usr/{lib,bin}

	# Install license
	install -Dm644 "$srcdir"/usr/share/doc/bootstrapstudio/copyright \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 "$srcdir"/opt/bootstrapstudio/LICENSES.chromium.html \
		"$pkgdir"/usr/share/licenses/$pkgname/LICENSES.chromium.html

	# Remove unnecessary files
	rm -rf "$srcdir"/usr/share/doc

	# Install files and binary
	cp -rT "$srcdir"/usr "$pkgdir"/usr
	cp -rT "$srcdir"/opt/bootstrapstudio "$pkgdir"/usr/lib/$pkgname

	# Symlink binary
	ln -s /usr/lib/$pkgname/'Bootstrap Studio' "$pkgdir"/usr/bin/$pkgname

	# Fix permission
	chmod -R go-w "$pkgdir"
}

sha512sums=('9d4be450de5db91cffd4cbc3b14adbb9083c5f95ba141478281344732e57b1655c35ec2625f9e80ab9d140c1c68d2960b209f130baa3252919f7bfc8b4b05c4a')
