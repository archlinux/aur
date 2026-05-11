# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libsquish
pkgname=mingw-w64-$_pkgname
pkgver=1.15.1.3
pkgrel=2
_obcmake_version='v0.3.10'
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
sha256sums=('16acbc13343c2624bc468d1001a060f7a2eeddfbc308ec9dd5ce1eba5a7301bc'
            '4bf1852250dec6422af6fafa304e4cbe0085823ee575d2e2b442e3acd7f334c5'
            '766e09d98e852594fc3e918deb890c3cd92a2416ab4dea32be76283ecb64a32e')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
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
		sed -i 's|_tmpl_if_exist_and_sel \[\[if(EXISTS "${__inclusion}") AND|_tmpl_if_exist_and_sel [[if(EXISTS "${__inclusion}" AND|' "build-${_arch}/_deps/obcmake-src/cmake/module/OB/Project.cmake"
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
