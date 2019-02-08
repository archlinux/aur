# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=deacme-git
pkgver=r195.754892b
pkgrel=1
license=(custom:BSD)
pkgdesc='Fork of acme-client using libcurl and openssl'
url='https://git.sr.ht/~sircmpwn/deacme'
arch=(x86_64)
provides=(deacme)
conflicts=(deacme)
depends=(curl)
makedepends=(git meson ninja)
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

build () {
	cd "${pkgname}"
	rm -rf build
	arch-meson build
	ninja -C build
}

package () {
	cd "${pkgname}"
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 Linux-seccomp.md "${pkgdir}/usr/share/doc/${pkgname}/Linux-seccomp.md"
}
