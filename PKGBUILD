# Maintainer: Adrián Pérez de Castro
pkgdesc='Flexible terminal-based text editor'
pkgname=mle-git
pkgver=r365.157724d
pkgrel=1
arch=(x86_64)
url='https://github.com/adsr/mle'
depends=(pcre2)
source=("${pkgname}::git+${url}"
		git+https://github.com/lua/lua
        git+https://github.com/adsr/mlbuf
        git+https://github.com/nsf/termbox
        git+https://github.com/troydhanson/uthash
)
sha512sums=(SKIP SKIP SKIP SKIP SKIP)

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
	git submodule init
	local m
	for m in mlbuf termbox uthash ; do
		git config "submodule.${m}.url" "${srcdir}/${m}"
	done
	git submodule update
}

build () {
	cd "${pkgname}"
	make prefix=/usr
}

package () {
	cd "${pkgname}"
	make prefix=/usr DESTDIR="${pkgdir}" install
}
