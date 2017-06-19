# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=lumail
pkgver=3.0
pkgrel=1
pkgdesc="A console-based mail-client with integrated Lua scripting support"
url="https://lumail.org/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('lua52' 'gmime' 'file' 'ncurses')
source=(https://github.com/lumail/lumail/archive/release-${pkgver}.tar.gz)
sha1sums=('343ee78a4422eddaa5631f398565eecdb795595b')

build() {
	cd ${pkgname}-release-${pkgver}

	make LUA_FLAGS=-I/usr/include/lua5.2 LUA_LIBS=-llua5.2 VERSION=${pkgver}
}

check() {
	cd ${pkgname}-release-${pkgver}

	make test LUA_FLAGS=-I/usr/include/lua5.2 LUA_LIBS=-llua5.2 VERSION=${pkgver}
}

package() {
	cd ${pkgname}-release-${pkgver}

	# easier to reimplement install target than to use existing one.
	install -d ${pkgdir}/usr/bin/ ${pkgdir}/etc/lumail2/{lib,perl.d}
	install -m755 lumail2 ${pkgdir}/usr/bin/
	install -m644 lumail2.lua ${pkgdir}/etc/lumail2/
	# see https://github.com/lumail/lumail/issues/312
	install -m644 lib/*.lua ${pkgdir}/etc/lumail2/lib/
	install -m644 perl.d/*.pm ${pkgdir}/etc/lumail2/perl.d/
	install -m755 perl.d/imap-proxy ${pkgdir}/etc/lumail2/perl.d/
}
