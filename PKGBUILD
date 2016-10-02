# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc='A package to read and write CSV. Provides high-level database-like handlers.'
pkgname='lua51-csvigo-git'
pkgver=1.0.0.r23.g3996129
pkgrel=1
makedepends=('git')
depends=('torch7-git>=r819')
conflicts=('lua51-csvigo')
provides=('lua51-csvigo')
arch=('x86_64' 'i686')
url='https://github.com/clementfarabet/lua---csv'
license=('unknown')
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

build () {
	cd "${pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package () {
	cd "${pkgname}"

	make DESTDIR="${pkgdir}" install

	# Move Lua C module
	mkdir -p "${pkgdir}/usr/lib/lua/5.1"
	mv "${pkgdir}/usr/lib/libcsvigo.so" "${pkgdir}/usr/lib/lua/5.1/"

	# Move pure Lua modules
	mkdir -p "${pkgdir}/usr/share/lua/5.1"
	mv "${pkgdir}/usr/lua/csvigo" "${pkgdir}/usr/share/lua/5.1/"
	rm -rf "${pkgdir}/usr/lua"
}
