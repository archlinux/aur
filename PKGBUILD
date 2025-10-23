# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=libloot
_pkgname=loot
# https://github.com/loot/libloot/releases
pkgver=0.28.3
pkgrel=1
pkgdesc="A library for the Load Order Optimisation Tool for Starfield, The Elder Scrolls (Morrowind and later) and Fallout (3 and later) games"
arch=('x86_64')
url="https://loot.github.io"
license=('GPL-3.0-only')
depends=(
	'gcc-libs'
)
makedepends=(
	'git'
	'cmake'
	'rust'
	#'doxygen' # docs
	#'python-breathe' # docs
	#'python-sphinx' # docs
	#'uv' # docs
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5becb26d1f84a22f58772fbf840f3688468274e11cb7895fa79af730b57df242')
build() {
	# Build docs - Doxygen needs to be installed for C++
	# They are half a gig, so they are disabled
	#cd "${srcdir}/${pkgname}-${pkgver}/docs"
	#cargo doc
	#uv run -- sphinx-build -b html . build/html

	cd "${srcdir}/${pkgname}-${pkgver}/cpp"

	# https://github.com/loot/libloot/tree/master/cpp#build
	cmake -B build . \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
	cmake --build build --target loot
}

package() {
	# Docs - they are half a gig, so they are disabled
	#_builddir="${srcdir}/${pkgname}-${pkgver}/target/doc"
	#cp -r "${_builddir}/." "${pkgdir}/usr/share/doc/${pkgname}/rust"
	#_builddir="${srcdir}/${pkgname}-${pkgver}/cpp/build"
	#install -d "${pkgdir}/usr/share/doc/${pkgname}/rust"
	#cp -r "${_builddir}/docs/." "${pkgdir}/usr/share/doc/${pkgname}/"

	# Lib
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
