# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=rexgen-git
pkgver=2.1.3.r2.g585e86d
pkgrel=2
pkgdesc="A tool to create words based on regular expressions"
arch=('i686' 'x86_64')
url="https://github.com/teeshop/rexgen"
license=('GPL')
depends=('git')
makedepends=('gcc' 'cmake' 'flex' 'bison' 'clang')
source=("${pkgname}::git+${url}" "fix-include-stdexcept.patch")
sha256sums=('SKIP'
            '097d0adb6b380794ec73c279839250f37d24e153ab990f0a2ab399deca9f9412')

pkgver() {
	cd "${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	patch -Np1 -i "${srcdir}/fix-include-stdexcept.patch"
}

build() {
	cd "${srcdir}/${pkgname}"

	mkdir -p build
	cd build

	export CC=clang CXX=clang++
	cmake -Wno-dev .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr

	make ${MAKEFLAGS} all
}

package() {
	cd "${srcdir}/${pkgname}"

	cd build
	make DESTDIR="${pkgdir}" install
}
