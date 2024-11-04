# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

# TODO: Build and ship the docs

pkgname=libloot
_pkgname=loot
# https://github.com/loot/libloot/releases
pkgver=0.24.5
pkgrel=1
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('tbb' 'icu' 'fmt' 'spdlog')
makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust' 'doxygen' 'python-breathe' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('d3f5a2e979aec5264b13e4687e1d240c7109552025e9995d1d2a54cbcb3eb8d3')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	# https://github.com/loot/libloot?tab=readme-ov-file#cmake-variables
	cmake .. -DCMAKE_SKIP_RPATH=TRUE # -DLIBLOOT_INSTALL_DOCS=OFF
	make loot
}

package() {
	_builddir="${srcdir}/${pkgname}-${pkgver}/build"
#	install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/libloot.s"*
	install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/libloot.so.${pkgver}"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so.0"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so"

	install -d "${pkgdir}/usr/include"
	cp -r "${_builddir}/../include"/* "${pkgdir}/usr/include"
}
