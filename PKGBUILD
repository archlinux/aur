# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=bcl
pkgname="${_pkgname}-git"
pkgver=r189.a1df887
pkgrel=1
pkgdesc="The Berkeley Container Library: a C++ library of distributed data structures with interfaces similar to those in STL containers."
arch=('any')
url="https://github.com/berkeley-container-library/bcl"
license=('BSD')
depends=()
makedepends=('cmake' 'openmpi')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/berkeley-container-library/bcl.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake ..
	cmake --build .
}

check() {
	cd "${srcdir}/${_pkgname}/build"
	ctest -R 'global_ptr|hello_world|insert_find'
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -dm 755 "${pkgdir}/usr/include"
	cp -r bcl "${pkgdir}/usr/include/"
}
