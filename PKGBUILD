# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.3
pkgrel=2
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
depends=(pcre termbox lua)
makedepends=(uthash)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('52a7d1ed231b340fc0141d55068823dcf74aae800362afcb86b4f98d01f5b17b7872b38756b989b892bac84290744555049e5f4fd46424539a7b6aa7dedfc2f8')

prepare () {
	cd "${pkgname}-${pkgver}"

	# The source code uses <lua5.3/lua.h>; and the Arch Linux "lua" package
	# places the headers directly under /usr/include, so let's just use a
	# symlink to provide the headers at the expected include location.
	ln -snf /usr/include lua5.3
}

build () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr
}

check () {
	cd "${pkgname}-${pkgver}"
	make test
}

package () {
	cd "${pkgname}-${pkgver}"
	make prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 mle.1 "${pkgdir}/usr/share/man/man1/mle.1"
}
