# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=owl
pkgdesc='Parser generator for visibly pushdown languages.'
pkgver=4
pkgrel=2
url=https://github.com/ianh/owl
arch=(x86_64)
license=(custom)
depends=(glibc)
makedepends=(make lowdown)
source=("${url}/archive/${pkgname}.v${pkgver}.tar.gz")
b2sums=('f983f229b33f4e0abcb0def610ede958303d88fd6dd05abdf86bee21b766d84bf2d78ce6c1708d995f2d39b179ba02c88b5dec0dbdc5a4ba963e6b08b52eb162')

build () {
	cd "${pkgname}-${pkgname}.v${pkgver}"
	make PREFIX=/usr LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS} -std=c11"

	local mdfile
	for mdfile in doc/*.md *.md ; do
		echo "Rendering ${mdfile}..."
		lowdown -Thtml -s -o "${mdfile%.md}.html" "${mdfile}"
	done
}

package () {
	cd "${pkgname}-${pkgname}.v${pkgver}"

	# Program.
	install -Dm755 -t "${pkgdir}/usr/bin" owl

	# License.
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" COPYING.txt

	# Documentation.
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" doc/*.{html,md} README.{md,html}
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/images/" doc/images/*

	# Examples.
	cp -r example "${pkgdir}/usr/share/doc/${pkgname}/"
}
