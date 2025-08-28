# Maintainer: Martin Rys <https://rys.rs/contact>

# TODO: Build and ship the docs

pkgname=libloot
_pkgname=loot
# https://github.com/loot/libloot/releases
pkgver=0.27.0
pkgrel=1
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games"
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('tbb' 'icu' 'fmt' 'spdlog')
makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust' 'doxygen' 'python-breathe' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bf3f419dcf63e5d9f0766c174b52aa2a669396ed8da2809ec3a77f2e4773bdf3')
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
	# https://github.com/loot/libloot?tab=readme-ov-file#cmake-variables
	# built-in yaml-cpp hack due to https://github.com/loot/loot/issues/2076#issuecomment-2729508538
	cmake .. \
		-DCMAKE_DISABLE_FIND_PACKAGE_yaml-cpp=ON \
		-DCMAKE_SKIP_RPATH=TRUE
		# -DLIBLOOT_INSTALL_DOCS=OFF
	make loot
}

package() {
	_builddir="${srcdir}/${pkgname}-${pkgver}/build"
	install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/libloot.so.${pkgver}"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so.0"
	ln -s "libloot.so.${pkgver}" "${pkgdir}/usr/lib/libloot.so"

	install -d "${pkgdir}/usr/include"
	cp -r "${_builddir}/../include"/* "${pkgdir}/usr/include"
	install -d "${pkgdir}/usr/lib/cmake/${pkgname}"
	install -Dm644 "${_builddir}/liblootConfig.cmake" "${pkgdir}/usr/lib/cmake/${pkgname}/liblootConfig.cmake"
	install -Dm644 "${_builddir}/liblootConfigVersion.cmake" "${pkgdir}/usr/lib/cmake/${pkgname}/liblootConfigVersion.cmake"
	cp "${_builddir}/CMakeFiles/Export/"*"/"*".cmake" "${pkgdir}/usr/lib/cmake/${pkgname}/" # two liblootTarget*.cmake files
}
