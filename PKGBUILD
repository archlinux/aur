# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-srt
pkgver=1.4.3
pkgrel=1
pkgdesc="Secure Reliable Transport library (mingw-w64)"
url="https://www.srtalliance.org/"
arch=('any')
license=(MPL2)
depends=(mingw-w64-openssl)
makedepends=(mingw-w64-cmake)
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/Haivision/srt/archive/v${pkgver}.tar.gz")
sha256sums=('c06e05664c71d635c37207a2b5a444f2c4a95950a3548402b3e0c524f735b33d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir/srt-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
  	${_arch}-cmake \
			-DCMAKE_INSTALL_BINDIR=/usr/${_arch}/bin \
			-DCMAKE_INSTALL_INCLUDEDIR=/usr/${_arch}/include \
			..
		make
		popd
	done	
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/srt-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2:
