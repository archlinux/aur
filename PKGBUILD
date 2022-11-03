# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=pugixml
pkgname=mingw-w64-${_pkgname}
_majordotminor=1.13
pkgver=${_majordotminor}
pkgrel=1
pkgdesc='Light-weight, simple and fast XML parser for C++ with XPath support (mingw-w64)'
arch=('any')
url='http://pugixml.org/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://github.com/zeux/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe')

_srcdir="${_pkgname}-${_majordotminor}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' )

build() {
  for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
      -DPUGIXML_BUILD_TESTS=OFF -DPUGIXML_BUILD_SHARED_AND_STATIC_LIBS=ON -DBUILD_SHARED_LIBS=ON
		cmake --build "build-${_arch}"
  done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DPUGIXML_BUILD_TESTS=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
