# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-srt
pkgver=1.3.3
pkgrel=1
pkgdesc="Secure Reliable Transport library (mingw-w64)"
url="https://www.srtalliance.org/"
arch=(x86_64)
license=(MPL2)
depends=(mingw-w64-openssl)
makedepends=(mingw-w64-cmake)
source=("https://github.com/Haivision/srt/archive/v${pkgver}.tar.gz")
sha256sums=('fb2e50c027ebcf32f8ebf6525a29a15e765c7a94efb52ccc3c770a0384b1fbaf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	unset LDFLAGS
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
