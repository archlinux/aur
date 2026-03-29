# Maintainer: Adrián Pérez de Castro
pkgdesc='Extensible Shell derived from Plan9 rc'
pkgname=es
pkgver=0.10.0
pkgrel=1
arch=(x86_64)
url=http://wryun.github.io/es-shell/
depends=(readline termcap)
makedepends=(bison)
conflicts=(es-shell es-shell-git)
license=('custom:Public Domain')
install=es.install
source=("https://github.com/wryun/es-shell/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('e871a2f3dcf0fec5f9e667da1a142ab453f4da40079704b60c3b1f6d48d8b640c23b0f040a54cd9f83ba2dbbdea983a4bb0dbe89f68c19a9a06a2a9d9dc39207')

build () {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-readline
	make
}

package () {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	# Documentation and examples.
	install -D -m644 README.md \
		"${pkgdir}/usr/share/licenses/${pkgname}/README.md"
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		doc/ERRATA doc/usenix-w93.ps doc/es-list.gz
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" \
		examples/*.*
	cp -r examples/friedman "${pkgdir}/usr/share/doc/${pkgname}/examples"
}

check () {
	# FIXME: Some test cases fail due to permissions when building in a chroot,
	#        which is a relatively common setup when building Arch packages, so
	#        skip running the tests for now.
	return

	cd "$pkgname-$pkgver"
	make test
}
