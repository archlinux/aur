# Maintainer: Alex Curtis <AlexDotJDotCurtisAtProtonDotMe>

# shellcheck disable=SC2034

pkgbase=limo
pkgname=("${pkgbase}" "${pkgbase}-docs")
pkgver=1.0.9
pkgrel=1
pkgdesc='General video game mod manager with LOOT and Nexus Mods integration'
arch=('x86_64')
url="https://github.com/limo-app/${pkgbase}"
license=('GPL-3.0-only')
makedepends=(
	'cpr'
	'cmake'
	'doxygen'
	'graphviz'
	'hicolor-icon-theme'
	'jsoncpp'
	'libarchive'
	'libloot'
	'libunrar'
	'pugixml'
	'qt5-svg'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

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
	# shellcheck disable=SC2128,SC2154
	install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

package_limo() {
	# PKGBUILD vars
	depends=(
		'cpr'
		'gcc-libs'
		'glibc'
		'hicolor-icon-theme'
		'jsoncpp'
		'libarchive'
		'libloot'
		'libunrar'
		'openssl'
		'pugixml'
		'qt5-base'
	)
	optdepends=('limo-docs: API documentation')

	cd "${pkgbase}-${pkgver}" || return
	DESTDIR="${pkgdir}" cmake --install build
	_package
}

package_limo-docs() {
	# PKGBUILD vars
	pkgdesc='API documentation for Limo mod manager'
	arch=('any')

	cd "${pkgbase}-${pkgver}" || return
	local _docpath="${pkgdir}/usr/share/doc/${pkgbase}"
	install -dvm755 "${_docpath}"
	mv -fvt "${_docpath}" doc/*
	_package
}
