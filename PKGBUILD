# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=assimp
pkgname=mingw-w64-${_pkgname}
pkgver=5.2.5
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner (mingw-w64)"
arch=('any')
license=('BSD')
depends=('mingw-w64-zlib' 'mingw-w64-boost' 'mingw-w64-minizip')
makedepends=('mingw-w64-cmake')
url='http://www.assimp.org/'
source=("$_pkgname-$pkgver.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
options=('!strip' '!buildflags' 'staticlibs' '!lto')
sha256sums=('b5219e63ae31d895d60d98001ee5bb809fb2c7b2de1e7f78ceeb600063641e1a')
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DASSIMP_BUILD_SAMPLES=OFF )
_srcdir="${_pkgname}-${pkgver}"

prepare ()
{
	cd "${_srcdir}"
	sed -i 's/fprintf(pFile, this->szPlainText.c_str());/std::fputs(this->szPlainText.c_str(), pFile);/' 'tools/assimp_view/LogWindow.cpp'
	sed -i 's/set(LIBRARY_SUFFIX/#nope/' 'code/CMakeLists.txt'
	sed -i 's/TARGET_LINK_LIBRARIES ( assimp_viewer/#nope/' 'code/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'tools/assimp_cmd/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'tools/assimp_view/CMakeLists.txt'
	sed -i 's/LINK_DIRECTORIES/#nope/' 'test/CMakeLists.txt'
}

build()
{
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DASSIMP_BUILD_TESTS=OFF -DASSIMP_BUILD_ASSIMP_TOOLS=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DASSIMP_BUILD_TESTS=OFF -DASSIMP_BUILD_ASSIMP_TOOLS=ON
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DASSIMP_BUILD_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package () {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
