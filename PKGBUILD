_pkgname="cppast"
pkgname="${_pkgname}-git"
pkgver=436.b155d6a
pkgrel=2
pkgdesc="Library to parse and work with the C++ AST"
arch=('x86_64')
url="https://github.com/foonathan/cppast"
license=('MIT')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/foonathan/cppast.git"
	"CMakeLists.txt.patch")

pkgver() {
	cd "${_pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	patch -p0 < CMakeLists.txt.patch
	cd "${_pkgname}"
	mkdir -p build
	cd build
	cmake -G "Unix Makefiles" ..
}

build() {
	cd "${_pkgname}/build"
	make
}

check() {
	: #Do nothing
}

package() {
	cd "${_pkgname}/build"
	make PREFIX=/usr DESTDIR="$pkgdir/" install

	install -m644 -D "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	rsync -a --chmod 755 "${srcdir}/${_pkgname}/include" "${pkgdir}/usr/"
}

sha256sums=('SKIP'
	'3bb8d82d3258a6800b672d7c7adc50331b26b3b1dd12926d0402c91ff5ddd293')
