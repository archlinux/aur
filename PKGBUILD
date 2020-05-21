# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openexr
pkgver=2.5.1
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake' 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/AcademySoftwareFoundation/openexr/archive/v${pkgver}.tar.gz")
sha256sums=('11f806bf256453e39fc33bd1cf1fa576a54f144cedcdd3e6935a177e5a89d02e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S openexr-${pkgver} -B build-${_arch} -DCMAKE_BUILD_TYPE=Release \
			-DBUILD_TESTING=OFF -DINSTALL_OPENEXR_DOCS=OFF -DINSTALL_OPENEXR_EXAMPLES=OFF -DOPENEXR_BUILD_UTILS=OFF
		make -C build-${_arch}
	done
}

package() {
  for _arch in ${_architectures}; do
    make DESTDIR="${pkgdir}" -C build-${_arch} install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
