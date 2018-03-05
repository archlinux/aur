# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='scc-git'
pkgdesc='The Suckless C Compiler'
pkgver=r2688.f75308d
pkgrel=1
arch=('x86_64')
depends=('qbe-git' 'sh')
license=('custom:ISC')
url='https://git.2f30.org/scc'
source=("${pkgname}::${url/https:/git:}")
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
	sed -i 's^/libexec/^/lib/^' Makefile driver/posix/scc.c
}

build () {
	cd "${pkgname}"
	for i in config.mk dep all ; do
		make PREFIX=/usr $i
	done
}

package () {
	cd "${pkgname}"
	mkdir -p "${pkgdir}/usr/lib"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Workaround quirk in "install" target.
	ln -s ../libexec/scc "${pkgdir}/usr/lib/scc"

	make PREFIX=/usr DESTDIR="${pkgdir}" install

	# Move things around.
	rm "${pkgdir}/usr/lib/scc"
	mkdir -p "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/libexec/scc" "${pkgdir}/usr/lib"
	rmdir "${pkgdir}/usr/libexec"
	mkdir -p "${pkgdir}/usr/share/man"
	mv "${pkgdir}/man1" "${pkgdir}/usr/share/man/"
}
