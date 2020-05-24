# Maintainer: Michael Kuc <michaelkuc6 at gmail dot com>
_pkgname=t2b
pkgname=${_pkgname}-git
pkgver=1.0.0.r26.g2aa5c32
pkgrel=1
pkgdesc="A wicked-powerful text macro language for building binary files."
arch=('x86_64')
url="https://thosakwe.github.io/t2b/index.html"
license=()
depends=()
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=()
epoch=1
source=("${_pkgname}::git+https://github.com/thosakwe/t2b.git#commit=2aa5c328dfe48dacdd97e4a09ce35783552b2476" # HEAD breaks compilation.
	'CMakeLists.txt.patch')
sha256sums=('SKIP'
	'4879b124e17eb49dfc1944a41affb4c27676adfebdb7f183a433dcb7318b7795')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"
	(cd "${_pkgname}" && patch -p0 < ../CMakeLists.txt.patch)
	mkdir -p build
	cd build
	cmake -G 'Unix Makefiles' -DCMAKE_INSTALL_PREFIX=/usr "../${_pkgname}"
}

build() {
	cd "${srcdir}/build"
	cmake --build .
}

package() {
	cd "${srcdir}/build"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
