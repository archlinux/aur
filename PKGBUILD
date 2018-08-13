# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=owl
pkgdesc='Parser generator for visibly pushdown languages.'
pkgver=2
pkgrel=1
url='https://github.com/ianh/owl'
arch=(x86_64)
license=(custom)
depends=(glibc)
makedepends=(make lowdown)
source=("${url}/archive/${pkgname}.v${pkgver}.tar.gz")
sha512sums=('396dfbba4d44e95422349b96d51943af7af2b31619511e4a34a831c50cc17364072fedffa23e9ba8539230445ca9bcbff4892ac573ae3cd9aba009f95e9f48ca')

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
