# Maintainer: Alex Curtis <AlexDotJDotCurtisAtProtonDotMe>

pkgbase=limo
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.2
pkgrel=1
pkgdesc='General video game mod manager with LOOT and Nexus Mods integration'
arch=('x86_64')
url="https://github.com/limo-app/${pkgbase}"
license=('GPL-3.0-only')
_depends=(
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
	"${_depends[@]}"
	'cmake'
	'doxygen'
	'graphviz'
	'qt5-svg'
	'zlib'
	'zstd'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('68ef34d89a552d786330ceb37c5a8f4f1c4d41eb7d5d0e0861576cc3b72818f4071c8aaa944870c09d61c43de55215f17a2cb44bf45897e8909cc9d15857191f')

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
	depends=("${_depends[@]}")
	cd "${pkgbase}-${pkgver}" || return
	DESTDIR="${pkgdir}" cmake --install build
	_package
}

package_limo-docs() {
	pkgdesc='API documentation for Limo mod manager'
	arch=('any')
	cd "${pkgbase}-${pkgver}" || return
	local _docpath="${pkgdir}/usr/share/doc/${pkgbase}"
	install -dvm755 "${_docpath}"
	mv -fvt "${_docpath}" doc/*
	_package
}
