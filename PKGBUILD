# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-srt
pkgver=1.3.1
pkgrel=1
pkgdesc="Secure Reliable Transport library (mingw-w64)"
url="https://www.srtalliance.org/"
arch=(x86_64)
license=(MPL2)
depends=(mingw-w64-openssl)
makedepends=(mingw-w64-cmake)
source=("https://github.com/Haivision/srt/archive/v${pkgver}.tar.gz"
	"1a975a47cf1985d716fec8b9cb3f29bb3481c85e.patch"
	"8d1ed9a9646b31ff00bb3509e3d628656482f38a.patch"
	"9711665bc0a552d2fcf9b236c3b17e8a9e7c4958.patch"
	"0001-cmake-fix-link-with-MinGW.patch"
)
sha256sums=('f202801d9e53cd8854fccc1ca010272076c32c318396c8f61fb9a61807c3dbea'
	'3e3caa0097f4167b9c87adfe853338804fa150674f217aa0d533daaf810ee090'
	'1cb8c574e11261fd09df1aeb2b92788000b31bc838bdea59a8abddae6068a5f4'
	'750b7f44974dbc89f9ba575ebdb8b6a0cee432c6fb2db46fa09b4665762e67a5'
	'9f3afbfe4867dcc93e4b35bf0d5af3bb1f3281482593917e886cb1ceb2f64f08'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/srt-${pkgver}"
	patch -Np1 -i "$srcdir/1a975a47cf1985d716fec8b9cb3f29bb3481c85e.patch"
	patch -Np1 -i "$srcdir/8d1ed9a9646b31ff00bb3509e3d628656482f38a.patch"
	patch -Np1 -i "$srcdir/9711665bc0a552d2fcf9b236c3b17e8a9e7c4958.patch"
	patch -Np1 -i "$srcdir/0001-cmake-fix-link-with-MinGW.patch"
}

build() {
	unset LDFLAGS
	cd "$srcdir/srt-${pkgver}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
  	${_arch}-cmake \
			-DENABLE_CXX11=OFF \
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
