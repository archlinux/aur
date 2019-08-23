# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=sblg
pkgdesc='simple off-line blog utility'
pkgver=0.5.4
pkgrel=1
url='https://kristaps.bsd.lv/sblg'
source=("${url}/snapshots/${pkgname}-${pkgver}.tar.gz" makefile-ldflags.patch)
depends=(expat)
makedepends=(gawk)
license=(custom:ISC)
arch=(x86_64)
sha512sums=('6d4eafb1c2c0ebbc6d6dc82bbc79d5a6d40d12baff21f49d891eae490625aa1c7bced7f3cfa59b026b592dfe1abde226ef56537c86a38927cc6c2d7edd4b9517'
            '33593b6d744c57dfbb40bd51a1cbe923f73960dc5632184325486ffb920f4404947257408faa29a4ea9fa7fe3bcb1edf131a87fa9e786ac0d5012a70a4319151')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/makefile-ldflags.patch"
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure PREFIX=/usr MANDIR=/usr/share/man
	cat >> Makefile.configure <<-EOF
	CFLAGS += ${CFLAGS}
	LDFLAGS += ${LDFLAGS}
	EOF
	make
	awk '/^\/\*/,/\*\// { print }' main.c > COPYING
}

package () {
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
