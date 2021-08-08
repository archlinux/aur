# Maintainer: Adrián Pérez de Castro
pkgdesc='An UNIX shell with a simplified Scheme syntax'
pkgname=esh
pkgver=0.8.5
pkgrel=2
license=(GPL2)
arch=(x86_64)
depends=(readline)
install=esh.install
source=("http://distfiles.gentoo.org/distfiles/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2473cc2418f70533136305f47dfe59bee560206a8b58c080e2113297dd82483e867937bda1b015069a7220552b4d03346a3b71026a24a2795b0b499e355490a0')

prepare () {
	cd "${pkgname}"
	make clean -k || true
	sed -i \
		-e 's|-g ||' \
		-e 's|-DMEM_DEBUG ||' \
		-e 's|^CFLAGS|&+|g' \
		-e 's|$(CC) |&$(CFLAGS) $(LDFLAGS) |g' \
		-e 's:-ltermcap::' \
		Makefile
}

build () {
	cd "${pkgname}"
	make CFLAGS="${CFLAGS} -I/usr/include/readline" LDFLAGS="${LDFLAGS}"
}

package () {
	cd "${pkgname}"
	install -D -m755 esh "${pkgdir}/usr/bin/esh"
	install -D -m644 doc/esh.info "${pkgdir}/usr/share/info/esh.info"
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
		CHANGELOG CREDITS GC_README HEADER READLINE-HACKS TODO
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/html" \
		doc/*.html
	install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}/examples" \
		examples/*
}
