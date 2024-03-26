# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
_pkgname=delance-runtime
pkgname=delance-langserver
# upstream version number can't trigger vercmp, so use publish date + ISO 8601 format
pkgver=2024_03_25
_pkgver="2024.3.2"
pkgrel=1
epoch=2
pkgdesc="A spear to the Python language server built with black magic"
arch=(any)
url="https://sr.ht/~self/delance/"
license=('0BSD')
depends=(nodejs)
makedepends=(npm)
source=("https://git.sr.ht/~self/${_pkgname}/archive/v${_pkgver}.tar.gz")
sha256sums=('791d99864ddb3a376687c2baafc9b73863713f1cd6e3ea2818b31d5515f05c8c')

build() {
	cd "$_pkgname-v$_pkgver"

	npm install --cache "${srcdir}/npm-cache"
}

package() {
	cd "$_pkgname-v$_pkgver"

	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	cp -r "dist/v${_pkgver}-"*/ "${pkgdir}/usr/share/${pkgname}"
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
