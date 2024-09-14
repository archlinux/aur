# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

# https://github.com/loot/libloot/issues/95
# Maybe add doxgen for /docs, but then we get the following error as `spdlog`` will be pulled:
#   In file included from /build/libloot/src/libloot-0.24.0/src/api/metadata/yaml/plugin_metadata.h:40,
#                    from /build/libloot/src/libloot-0.24.0/src/api/api_database.cpp:32:
#   /build/libloot/src/libloot-0.24.0/src/api/metadata/yaml/message.h:29:10: fatal error: spdlog/fmt/bundled/args.h: No such file or directory
#      29 | #include <spdlog/fmt/bundled/args.h>
#         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~

pkgname=libloot
_pkgname=loot
# https://github.com/loot/libloot/releases
pkgver=0.24.0
pkgrel=3
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games."
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('tbb' 'icu')
makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust') # 'doxygen' 'python-breathe' 'python-sphinx'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f7d868fb5f5a658c98ba45bb3b0735905c5a12fbf267b61057b91554c5515aed')
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
	ls -lah "${_builddir}"
#	install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/libloot.s"*
	install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/libloot.so.${pkgver}"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so.0"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so"

	install -d "${pkgdir}/usr/include"
	cp -r "${_builddir}/../include"/* "${pkgdir}/usr/include"
}
