# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xerces-c-icu
provides=('mingw-w64-xerces-c')
conflicts=('mingw-w64-xerces-c')
pkgver=3.2.3
pkgrel=7
pkgdesc='A validating XML parser written in a portable subset of C++ (ICU) (mingw-w64)'
arch=('any')
url='http://xerces.apache.org/xerces-c/'
license=("APACHE")
makedepends=('mingw-w64-wine' 'mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-icu')
options=('!strip' '!buildflags' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/apache/xerces-c/archive/v${pkgver}.tar.gz")
sha256sums=('a7cf582d618c048ef6a4684457a641940179c446e5f02c81f582f5952755a76a')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
	cd "xerces-c-${pkgver}"
	for f in $(find . -type f -name '*.cpp'); do sed -i -r 's/<Windows.h>/<windows.h>/' "$f"; done
	#sed -i -r 's/COMMAND/COMMAND "${CMAKE_CROSSCOMPILING_EMULATOR}"/' 'cmake/RunTest.cmake'
	#sed -i -r 's/COMMAND "\$\{CMAKE_COMMAND\}"/COMMAND x86_64-w64-mingw32-cmake/' 'cmake/XercesTest.cmake'
	#sed -i -r 's/-DNLS_HOME=/-DNLS_HOME=Z:/' 'cmake/XercesTest.cmake'
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' -Dtranscoder=icu )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "xerces-c-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
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
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
