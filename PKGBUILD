# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=d99kris
_pkgname=hush
pkgname=${_pkgname}
pkgver=1.03
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Suppress stdout for commands executed successfully on Linux"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('BSD-3-Clause')

provides=("${_pkgname}" "faketty")

makedepends=('cmake' 'binutils')
depends=('glibc' 'libgcc' 'libstdc++' 'bash')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f792e274da659ca833a24a66a53ec6be8c769fcdf4ac11194ad2d397a78d674')


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
