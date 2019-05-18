# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=owl
pkgdesc='Parser generator for visibly pushdown languages.'
pkgver=4
pkgrel=1
url='https://github.com/ianh/owl'
arch=(x86_64)
license=(custom)
depends=(glibc)
makedepends=(make lowdown)
source=("${url}/archive/${pkgname}.v${pkgver}.tar.gz")
sha512sums=('13fb588bf015827fd9311e5e115c861b875e4eefa0723e410e665c530b0a2f2922f0951debd5f378a2f7e9b39de65e942b5d2cc0c50acd957e8bf609059b0611')

build () {
	cd "${pkgname}-${pkgname}.v${pkgver}"
	make PREFIX=/usr LDFLAGS="${LDFLAGS}" CFLAGS="${CFLAGS} -std=c11"

	local mdfile
	for mdfile in doc/*.md *.md ; do
		echo "Rendering ${mdfile}..."
		lowdown -e autolink -e fenced -e strike -e tables -E smarty \
			-s -o "${mdfile%.md}.html" "${mdfile}"
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
