# Maintainer: Adrián Pérez de Castro
pkgdesc='Flexible terminal-based text editor'
pkgname=mle-git
pkgver=r503.e4dc431
pkgrel=1
url='https://github.com/adsr/mle'
license=(Apache)
arch=(x86_64)
depends=(pcre lua)
makedepends=(git uthash)
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
    # Avoid locale-dependent assertion
    # See https://github.com/adsr/mle/commit/e4dc4314b02a324701d9ae9873461d34cce041e5
    sed -i '/0wv/d' tests/unit/test_bline_insert.c

	# The Arch Linux Lua package does not have an include/lua5.4 subdir,
	# per-version subdirs are only available for the older releases; but
	# mle.h wants to use lua5.4/lua*.h nevertheless.
	ln -snf /usr/include lua5.4
}

build () {
	cd "${pkgname}"
	make prefix=/usr
}

check () {
	cd "${pkgname}"
	make test
}

package () {
	cd "${pkgname}"
	make prefix=/usr DESTDIR="${pkgdir}" install
	install -Dm644 mle.1 "${pkgdir}/usr/share/man/man1/mle.1"
}
