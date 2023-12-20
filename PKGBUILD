# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=xerces-c
pkgname=mingw-w64-${_pkgname}-icu
provides=("mingw-w64-${_pkgname}")
conflicts=("mingw-w64-${_pkgname}")
pkgver=3.2.5
pkgrel=1
pkgdesc='A validating XML parser written in a portable subset of C++ (ICU) (mingw-w64)'
arch=('any')
url='http://xerces.apache.org/xerces-c/'
license=("APACHE")
makedepends=('mingw-w64-wine' 'mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-icu')
options=('!strip' '!buildflags' 'staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/apache/xerces-c/archive/v${pkgver}.tar.gz")
sha256sums=('4042f6f11c9eba745dc0e5f8035d98b442097ee4efc69e4853410e4737a987f8')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' -Dtranscoder=icu )

prepare() {
	cd "${_srcdir}"
	#sed -i -r 's/COMMAND/COMMAND "${CMAKE_CROSSCOMPILING_EMULATOR}"/' 'cmake/RunTest.cmake'
	#sed -i -r 's/COMMAND "\$\{CMAKE_COMMAND\}"/COMMAND x86_64-w64-mingw32-cmake/' 'cmake/XercesTest.cmake'
	#sed -i -r 's/-DNLS_HOME=/-DNLS_HOME=Z:/' 'cmake/XercesTest.cmake'
	sed -i 's/if(WIN32)/if(0)/' 'src/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/{bin,share}
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
