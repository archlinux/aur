# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libsquish
pkgname=mingw-w64-$_pkgname
pkgver=1.15.2
pkgrel=1
_obcmake_version='v0.4.0.2'
pkgdesc='DXT compression library (mingw-w64)'
arch=(any)
url='https://oblivioncth.github.io/libsquish/'
license=('MIT')
makedepends=('mingw-w64-cmake' 'ninja' 'git')
#checkdepends=('mingw-w64-wine')
depends=('mingw-w64-libpng')
options=(!strip !buildflags staticlibs !debug)
source=(
	"https://github.com/oblivioncth/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"git+https://github.com/oblivioncth/OBCMake.git#tag=${_obcmake_version}"
	'obcmake-runtime-deps-mingw.patch'
)
sha256sums=('b4e4900a6a88c7709983e6b280389835d6c0780503202a36102a7e74fba27f58'
            '1323b476df3f44ebc5093796e48027e91eb454122af36940829b973e761232b6'
            '766e09d98e852594fc3e918deb890c3cd92a2416ab4dea32be76283ecb64a32e')

_srcdir="${_pkgname}-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"
_flags=( -Wno-dev
	-DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DNO_VERBOSE_VERSION=ON
	-DLIBSQUISH_DOCS=OFF )

prepare() {
	cd "${_srcdir}"
	ln -sf '../OBCMake' 'OBCMake'
	sed -i 's|"https://github.com/oblivioncth/OBCMake"|"${CMAKE_SOURCE_DIR}/OBCMake"|' 'cmake/FetchOBCMake.cmake'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DLIBSQUISH_TESTS=OFF \
			-DLIBSQUISH_EXTRAS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=ON \
			-DLIBSQUISH_TESTS=OFF \
			-DLIBSQUISH_EXTRAS=ON
		# GET_RUNTIME_DEPENDENCIES not supported on mingw: https://gitlab.kitware.com/cmake/cmake/-/work_items/20753
		patch -d "build-${_arch}/_deps/obcmake-src" -Np1 -i "${srcdir}/obcmake-runtime-deps-mingw.patch" || true
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DLIBSQUISH_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
