# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

pkgname=mingw-w64-libpng
pkgver=1.6.30
_apngver=$pkgver
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw-w64)"
depends=('mingw-w64-zlib' 'mingw-w64-crt')
makedepends=('mingw-w64-configure')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/project/apng/libpng/libpng16/libpng-$_apngver-apng.patch.gz")
sha1sums=('b6f8ac4d83116a87d8e10e15ec360dab8a898f5c'
          '8d535c21b24154e35d7fb10a6ac7b627b1170e0a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libpng-$pkgver"

  # Add animated PNG (apng) support
  # see http://sourceforge.net/projects/libpng-apng/
  patch -p0 -i "${srcdir}/libpng-$_apngver-apng.patch"
}

build() {
  cd "$srcdir/libpng-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libpng-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
  install -D -m644 "${srcdir}/libpng-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
