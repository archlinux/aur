# Maintainer: Adrián Pérez de Castro
pkgdesc='Flexible terminal-based text editor'
pkgname=mle-git
pkgver=r379.af76670
pkgrel=1
arch=(x86_64)
url='https://github.com/adsr/mle'
depends=(pcre termbox lua)
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

	# The source code uses <lua5.3/lua.h>; and the Arch Linux "lua" package
	# places the headers directly under /usr/include, so let's just use a
	# symlink to provide the headers at the expected include location.
	ln -snf /usr/include lua5.3
}

build () {
	cd "${pkgname}"
	make prefix=/usr
}

package () {
	cd "${pkgname}"
	make prefix=/usr DESTDIR="${pkgdir}" install
}
