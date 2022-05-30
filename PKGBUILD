# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgdesc='Flexible terminal-based text editor'
pkgname=mle
pkgver=1.5.0
pkgrel=1
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
conflicts=(mle-git)
depends=(pcre lua)
makedepends=(uthash)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b96462dee4212a006a7e93c76954315bb0ead2f28be5e206e3918d9dae2cece6ebf76e6531468f178eb551cd23840ff4c8a77cbedde18808e1c8fd80f25fef49')

prepare () {
    cd "${pkgname}-${pkgver}"
    # Avoid locale-dependent assertion
    # See https://github.com/adsr/mle/commit/e4dc4314b02a324701d9ae9873461d34cce041e5
    sed -i '/0wv/d' tests/unit/test_bline_insert.c

	# The Arch Linux Lua package does not have an include/lua5.4 subdir,
	# per-version subdirs are only available for the older releases; but
	# mle.h wants to use lua5.4/lua*.h nevertheless.
	ln -snf /usr/include lua5.4
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
