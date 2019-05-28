# Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>
# Maintainer: Jan-Tarek Butt <tarek at ring0 dot de>

pkgbase=bootstrap-studio
pkgname=bootstrap-studio
pkgver=4.4.4
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

sha512sums=('ddcfcf6e19de5e1a02931829f6f25982c9cabc6e3995cf133f2fbceaef9736b8ce88af234029ea46a59fa46e886887f2489347778ae71d475edee3c1704a475d')
