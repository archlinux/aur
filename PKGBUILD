# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='scc-git'
pkgdesc='The Suckless C Compiler'
pkgver=r2448.c6dd2da
pkgrel=1
arch=('x86_64')
depends=('qbe-git' 'sh')
license=('custom:ISC')
url='http://git.suckless.org/scc/'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

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
	sed -i 's^/libexec/scc/^/lib/scc/^' Makefile driver/posix/scc.c
}

build () {
	cd "${pkgname}"
	make PREFIX=/usr
}

package () {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
