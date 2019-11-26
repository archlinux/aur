# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.4.2
pkgrel=1
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
conflicts=(mle-git)
depends=(pcre termbox lua)
makedepends=(uthash)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('4fe292065c64f3cbe255647804ba6314681bd82cbba8ef04e94bd3175b1b284c26d2c92de8d2e41c16b8f35f6df26d18a915c6f14affb73868637b0cfface376')

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
