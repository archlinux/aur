# Maintainer: Martin Rys <https://rys.rs/contact>

# TODO: Build and ship the docs

pkgname=libloot
_pkgname=loot
# https://github.com/loot/libloot/releases
pkgver=0.28.2
pkgrel=1
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games"
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=('tbb' 'icu' 'fmt' 'spdlog')
makedepends=('git' 'boost' 'cbindgen' 'cmake' 'rust' 'doxygen' 'python-breathe' 'python-sphinx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c39bae45541dcb56743ce1276854f52fe188394ce427b02539444d84fad56c2d')
build() {
	# Rust components, not sure if we should be shipping this
	#cd "${srcdir}/${pkgname}-${pkgver}"
	#cargo build --release

	cd "${srcdir}/${pkgname}-${pkgver}/cpp"
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
	# Rust components, not sure if we should be shipping this
	#_builddir="${srcdir}/${pkgname}-${pkgver}/target/release"
	#install -Dm755 -t "${pkgdir}/usr/lib" "${_builddir}/liblibloot.rlib"

	_builddir="${srcdir}/${pkgname}-${pkgver}/cpp/build"
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
