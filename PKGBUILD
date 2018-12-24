# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-cmake-shared-git
pkgver=r23.4fc7099
pkgrel=1
pkgdesc="Additional macros and functions for CMake"
arch=('any')
url='https://liri.io'
license=('BSD')
depends=('extra-cmake-modules')
makedepends=('git')
conflicts=('liri-cmake-shared')
replaces=('liri-cmake-shared')
provides=('liri-cmake-shared')
groups=('liri-git')

_gitroot="git://github.com/lirios/cmake-shared.git"
_gitbranch=develop
_gitname=cmake-shared
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install

	mkdir -p $pkgdir/usr/share/licenses/${pkgname}
	cp ../${_gitname}/LICENSE.BSD $pkgdir/usr/share/licenses/${pkgname}
}
