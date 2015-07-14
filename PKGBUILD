# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Malina Salina <bluesilence@hotmail.co.uk>
pkgname='reop-git'
pkgrel=1
pkgver=184.8b6f63a
pkgdesc='Utility to create and verifies cryptographic signatures'
url='https://github.com/tedu/reop/'
license=('MIT')
arch=('arm' 'i686' 'x86_64')
depends=('libsodium')
conflicts=('reop')
provides=('reop')
options=('zipman')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')


prepare () {
	cd "${pkgname}"
	sed -e '1,/\*\//{p}' -e d reop.c > COPYING
}

pkgver () {
	cd "${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${pkgname}"
	sh ./configure
	make reop
}

check () {
	cd "${pkgname}/tests"
	sh ./test.sh
}

package () {
	cd "${pkgname}"
	install -Dm755 reop "${pkgdir}/usr/bin/reop"
	install -Dm644 reop.1 "${pkgdir}/usr/share/man/man1/reop.1"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	for doc in README spec.txt devnotes.txt ; do
	    install -Dm644 "${doc}" "${pkgdir}/usr/share/doc/${pkgname}/${doc}"
	done
}
