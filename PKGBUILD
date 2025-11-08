# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=d99kris
_pkgname=stackusage
pkgname=${_pkgname}
pkgver=1.20
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Measure stack usage in Linux applications"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('cmake' 'binutils')
depends=('gcc-libs' 'glibc' 'bash' 'libelf')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9db4c1e32b3deaee3670f2962d398c5f19745f760afc25887cd950e01823c63f')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	sed -i -e 's/cmake_minimum_required(VERSION 3.0 FATAL_ERROR)/cmake_minimum_required(VERSION 3.5 FATAL_ERROR)/g' ./CMakeLists.txt
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	cmake \
		-S ./ \
		-B ./build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev

	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	DESTDIR="${pkgdir}" cmake --install ./build

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
