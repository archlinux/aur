# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='runes-git'
pkgver=r316.7f3b17b
pkgrel=1
pkgdesc='A modern terminal client'
arch=('x86_64')
depends=('libuv' 'libx11' 'cairo')
url='https://github.com/doy/runes'
source=("${pkgname}::git+${url}" "libvt100::git://github.com/doy/libvt100")
sha512sums=('SKIP' 'SKIP')

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
	git config submodule.libvt100.url "${srcdir}/libvt100"
	git submodule update
}

build () {
	cd "${pkgname}"
	make
}

package () {
	cd "${pkgname}"
	install -Dm755 runes "${pkgdir}/usr/bin/runes"
	install -Dm755 libvt100/libvt100.so "${pkgdir}/usr/lib/libvt100.so"
}
