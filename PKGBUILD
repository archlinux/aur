# Maintainer: Alex Curtis <AlexDotJDotCurtisAtProtonDotMe>

pkgbase=limo
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.2.2
pkgrel=1
pkgdesc="General video game mod manager with LOOT and Nexus Mods integration"
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
b2sums=('7bbcecf499cf5095ac8c99fe7a3dfe89907db2e62bf56828f8357daaf3bf492f001b32503be59b9c32355bd55c9980794fe6c7afd10abbf36497ca9f06273dd3')

build() {
	cd "${pkgbase}-${pkgver}"
	
	# Upstream instructs setting CMAKE_BUILD_TYPE=Release, but Arch Linux
	# package guidelines recommend `None` instead.
	# See https://wiki.archlinux.org/title/CMake_package_guidelines#CMake_undesired_behaviors
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

# Code common to both package_* functions
_package() {
	install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_limo() {
	depends=("${_depends[@]}")
	cd "${pkgbase}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build
	_package
}

package_limo-docs() {
	pkgdesc="API documentation for Limo mod manager"
	arch=('any')
	cd "${pkgbase}-${pkgver}"
	local _docpath="${pkgdir}/usr/share/doc/${pkgbase}"
	install -dvm755 "${_docpath}"
	mv -fvt "${_docpath}" doc/*
	_package
}
