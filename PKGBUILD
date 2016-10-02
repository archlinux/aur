# Maintainer: Frantic1048 <archer@frantic1048.com>
pkgdesc="Lua binding of google's snappy compressor."
pkgname='lua51-snappy-git'
pkgver=r14.6b4f3f6
pkgrel=1
makedepends=('git')
depends=('lua51')
conflicts=('lua51-snappy')
provides=('lua51-snappy')
arch=('x86_64' 'i686')
url='https://github.com/forhappy/lua-snappy'
license=('custom')
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
	cd "${srcdir}/${pkgname}"

	# append Lua 5.1 headers and libs
	sed -i "/^CCFLAGS=/ s/$/ -I\/usr\/include\/lua5.1 -llua5.1/" Makefile
	sed -i "/^LDFLAGS=/ s/$/ -I\/usr\/include\/lua5.1 -llua5.1/" Makefile
}

build () {
	cd "${pkgname}"
	make
}

package () {
	cd "${pkgname}"

	install -d "${pkgdir}/usr/lib/lua/5.1/"
	install -m755 snappy.so "${pkgdir}/usr/lib/lua/5.1/"
}
