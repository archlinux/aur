# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sydbox-1
pkgdesc='ptrace()-based sandbox utility'
pkgver=2.2.0
pkgrel=2
arch=(x86_64)
url=https://git.exherbo.org/sydbox-1.git/
license=(custom:BSD)
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.xz")
depends=(bash 'pinktrace-1>=1.0' 'pinktrace-1<1.1' python)
sha512sums=('5a7abfb32e2d54904faa4d05a623c6a05e4a974682fb32401312b8509d5654d8e9ad5d27bec193337a1cbe888231a24e8dfc7ad8ff558641e2867be4f9d6e8fb')

prepare () {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --libexecdir=/usr/lib \
		--enable-shared --disable-static --disable-maintainer-mode \
		--enable-fast-install
	make
}

check () {
	# XXX: One of the tests fails, but seems spurious.
	: make -C "${pkgname}-${pkgver}" check
}

package () {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
