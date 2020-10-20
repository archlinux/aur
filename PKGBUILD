# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-srt
pkgver=1.4.2
pkgrel=2
pkgdesc="Secure Reliable Transport library (mingw-w64)"
url="https://www.srtalliance.org/"
arch=('any')
license=(MPL2)
depends=(mingw-w64-openssl)
makedepends=(mingw-w64-cmake)
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/Haivision/srt/archive/v${pkgver}.tar.gz")
sha256sums=('28a308e72dcbb50eb2f61b50cc4c393c413300333788f3a8159643536684a0c4')

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
