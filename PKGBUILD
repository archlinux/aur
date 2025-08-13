# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: Michel Zou

pkgname=mingw-w64-cfitsio
pkgver=4.6.2
pkgrel=1
pkgdesc="A library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format (mingw-w64)"
arch=('any')
url="https://heasarc.gsfc.nasa.gov/fitsio/"
license=(custom)
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-zlib')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-$pkgver.tar.gz)
sha256sums=('66fd078cc0bea896b0d44b120d46d6805421a5361d3a5ad84d9f397b1b5de2cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd cfitsio-${pkgver}
}

build() {
	cd cfitsio-${pkgver}
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-cmake -DUSE_CURL=OFF ..
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/cfitsio-$pkgver/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}
# vim: set sw=2 ts=2 et:
