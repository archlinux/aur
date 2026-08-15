# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=d99kris
_pkgname=heapusage
pkgname=${_pkgname}
pkgver=2.39
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Find memory leaks in Linux applications"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgname}")

makedepends=('cmake' 'binutils')
depends=('glibc' 'libgcc' 'libstdc++' 'libelf' 'bash')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f45c5997e84e993d24bd2375bb8d0e77c0af5a11ba1db90a7080decc7a1ee979')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}" || exit

	sed -i -e 's/cmake_minimum_required(VERSION 3.0...3.22 FATAL_ERROR)/cmake_minimum_required(VERSION 3.5 FATAL_ERROR)/g' ./CMakeLists.txt
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
