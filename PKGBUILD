# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
pkgname=macintosh.js-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="A virtual Apple Macintosh with System 8, running in Electron"
arch=('x86_64')
url="https://github.com/felixrieseberg/macintosh.js"
license=('custom')
depends=('gtk3' 'nss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'macintosh-js-bin')
replaces=('macintosh-js-bin')
source=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb"
        "https://github.com/felixrieseberg/${pkgname%-bin}/raw/v$pkgver/CREDITS.md")
sha256sums=('b5d7c0b2024963e9325186a801f403072b6a38803490a4836c836f269603a385'
            '6a221f623fa4f773ea6ba81c8a1731ff0d680cc7e8f20c68488c31b0f13e3dec')

package() {
	tar -xvf data.tar.xz -C "$pkgdir"

	install -Dm644 "$srcdir/CREDITS.md" -t \
		"$pkgdir/usr/share/licenses/${pkgname%-bin}"

	# Move files to proper directories
	install -d "$pkgdir/opt/${pkgname%-bin}"
	mv "$pkgdir/usr/lib/${pkgname%-bin}" "$pkgdir/opt"
	mv "$pkgdir/usr/share/doc/${pkgname%-bin}/copyright" \
		"$pkgdir/usr/share/licenses/${pkgname%-bin}"

	# Remove unneeded directories
	rm -rf "$pkgdir"/usr/{lib,share/{doc,lintian}}
	rm -rf "$pkgdir/opt/${pkgname%-bin}/resources/app/.github"

	# Replace symlink
	rm "$pkgdir/usr/bin/${pkgname%-bin}"
	ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" \
		"$pkgdir/usr/bin/${pkgname%-bin}"
}
