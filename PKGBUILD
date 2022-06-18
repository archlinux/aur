# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=qbe-git
pkgdesc='Small embeddable C compiler backend'
pkgver=r1265.cd778b4
pkgrel=1
url='http://c9x.me/compile/'
license=(custom:MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(git)
provides=(qbe)
conflicts=(qbe)
source=("${pkgname}::git://c9x.me/qbe.git")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	make
}

check () {
	cd "${pkgname}"
	make check
}

package (){
	cd "${pkgname}"
	install -Dm755 qbe "${pkgdir}/usr/bin/qbe"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m755 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.txt
}
