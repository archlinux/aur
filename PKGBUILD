# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-xerces-c-icu
provides=("mingw-w64-xerces-c")
conflicts=("mingw-w64-xerces-c")
pkgver=3.2.3
pkgrel=6
pkgdesc="A validating XML parser written in a portable subset of C++. (ICU) (mingw-w64)"
arch=("any")
url="http://xerces.apache.org/xerces-c/"
license=("APACHE")
makedepends=('mingw-w64-wine' 'mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-icu')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/apache/xerces-c/archive/v${pkgver}.tar.gz")
sha256sums=("a7cf582d618c048ef6a4684457a641940179c446e5f02c81f582f5952755a76a")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	for f in $(find "xerces-c-${pkgver}" -type f -name "*.cpp"); do sed -i -r 's/<Windows.h>/<windows.h>/' "$f"; done
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -Dtranscoder=icu )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "xerces-c-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}
