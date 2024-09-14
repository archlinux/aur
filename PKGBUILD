# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

# Problems as of 0.24.0:
#   libloot W: ELF file ('usr/lib/libloot/libloot.so') lacks GNU_PROPERTY_X86_FEATURE_1_SHSTK.

pkgname=libloot
_pkgname=loot
# https://github.com/loot/loot/releases
pkgver=0.24.0
pkgrel=1
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('tbb' 'icu')

makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f7d868fb5f5a658c98ba45bb3b0735905c5a12fbf267b61057b91554c5515aed')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	cmake .. \ -DCMAKE_SKIP_RPATH=TRUE
	make loot

	mkdir -p pkg/lib
	cp libloot.so ./pkg/lib/libloot.so
	cp -r ../include/ ./pkg/
	tar -zcf "${pkgname}-${pkgver}.tar.gz" ./pkg/
}

package() {
	_builddir="${srcdir}/${pkgname}-${pkgver}/build"
	install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" "${_builddir}/libloot.so"
}
