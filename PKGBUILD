# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=imrsh-git
pkgdesc='Interactive POSIX shell based on mrsh'
pkgver=r28.da592a3
pkgrel=1
url=https://git.sr.ht/~sircmpwn/imrsh
arch=(x86_64)
license=(GPL3)
conflicts=(imrsh)
provides=(imrsh)
depends=(libtickit mrsh)
makedepends=(meson ninja git)
source=("${pkgname}::git+${url}")
install=imrsh-git.install
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
	rm -rf build
	arch-meson -Dstrip=true build "${pkgname}"
	ninja -C build
}

check () {
	meson test -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C build install
}
