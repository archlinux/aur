# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
_pkgname=delance-runtime
pkgname=delance-langserver
pkgver="2024.3.101"
pkgrel=5
pkgdesc="A spear to the Python language server built with black magic"
arch=(any)
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(nodejs)
makedepends=(npm)
source=("https://git.sr.ht/~self/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6e2d83a398f8a3f147d204bcb32da813c0619d53269861de5d6dd7c477e88c6b')

build() {
	cd "$_pkgname-v$pkgver"

	npm install --cache "${srcdir}/npm-cache"
}

package() {
	cd "$_pkgname-v$pkgver"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	cp -r "dist/v${pkgver}-"*/ "${pkgdir}/usr/share/${pkgname}"
	cd "${pkgdir}/usr/share/${pkgname}"

	rm browser.*.LICENSE.txt

	local _licenses=(*.LICENSE.txt)
	install -Dm644 "${_licenses[@]}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	rm "${_licenses[@]}"

	install -dm755 "${pkgdir}/usr/bin/"
	install -Dm755 /dev/stdin "${pkgdir}/usr/share/${pkgname}/langserver.cjs" <<"EOF"
#!/usr/bin/node

require('./server.bundle.js');
EOF

	ln -s "/usr/share/${pkgname}/langserver.cjs" "${pkgdir}/usr/bin/${pkgname}"
}
