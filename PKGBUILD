# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=thrill
pkgname=${_pkgname}-git
pkgver=12c5b59bc
pkgrel=2
pkgdesc="Thrill is an EXPERIMENTAL C++ framework for algorithmic distributed Big Data batch computations on a cluster of machines."
arch=('x86_64')
url="https://github.com/thrill/thrill"
license=('BSD')
depends=('cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=("${_pkgname}::git+https://github.com/thrill/thrill.git" "foxxll_CMakeLists.txt.patch")
sha256sums=(
	'SKIP'
	'd6fae47a05ee842dbc68568f2da22de01d3f7035a2993bde54cd3dd8486750b4'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -p1 < foxxll_CMakeLists.txt.patch
	cd "${srcdir}/${_pkgname}"
	git submodule update --init --recursive
	mkdir -p build
	cd build
	cmake -DTHRILL_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_INCLUDE_DIR=/usr/include ..
}

build() {
	cd "${srcdir}/${_pkgname}"
	cd build
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
