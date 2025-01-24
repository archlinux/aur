# Maintainer: Alex Curtis <AlexDotJDotCurtisAtProtonDotMe>

pkgbase=limo
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.1
pkgrel=1
pkgdesc='General video game mod manager with LOOT and Nexus Mods integration'
arch=('x86_64')
url="https://github.com/limo-app/${pkgbase}"
license=('GPL-3.0-only')
depends=(
	'cpr'
	'gcc-libs'
	'glibc'
	'hicolor-icon-theme'
	'jsoncpp'
	'libarchive'
	'libloot'
	'libunrar'
	'lz4'
	'openssl'
	'pugixml'
	'qt5-base'
	'zlib'
	'zstd'
)
makedepends=(
	'cmake'
	'doxygen'
	'graphviz'
	'qt5-svg'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('4a98f4632e7786fc346ff86c19ab1ef49cca640024bdbe025e3686f9b43d914d3cb730e47df8bae921a01c65981aa4bc787cb213739abae3ad42bce724b95684')

build() {
	cd "${pkgbase}-${pkgver}" || return
	cmake \
		-B build \
		-DCMAKE_BUILD_TYPE:STRING=None \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DLIMO_INSTALL_PREFIX:PATH=/usr \
		-DUSE_SYSTEM_LIBUNRAR:BOOL=ON \
		-Wno-dev
	cmake --build build
	doxygen src/lmm_Doxyfile
}

_package() {
	install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_limo() {
	cd "${pkgbase}-${pkgver}" || return
	DESTDIR="${pkgdir}" cmake --install build
	_package
}

package_limo-docs() {
	depends=()
	pkgdesc='API documentation for Limo mod manager'
	arch=('any')
	cd "${pkgbase}-${pkgver}" || return
	local _docpath="${pkgdir}/usr/share/doc/${pkgbase}"
	install -dvm755 "${_docpath}"
	mv -fvt "${_docpath}" doc/*
	_package
}
