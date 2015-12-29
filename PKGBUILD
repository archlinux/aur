# Contributor: Daniel Kirchner <daniel AT ekpyron DOT org>

pkgname=mingw-w64-libpng
pkgver=1.6.20
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw-w64)"
depends=('mingw-w64-zlib' 'mingw-w64-crt')
makedepends=('mingw-w64-configure')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/project/libpng-apng/libpng16/$pkgver/libpng-$pkgver-apng.patch.gz")
md5sums=('3968acb7c66ef81a9dab867f35d0eb4b'
         'b2186d5e7853890e25b34b03c7f2ddde')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libpng-$pkgver"

  # Add animated PNG (apng) support
  # see http://sourceforge.net/projects/libpng-apng/
  patch -p1 -i "${srcdir}/libpng-$pkgver-apng.patch"
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
    rm -rf "${pkgdir}"/usr/${_arch}/share
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
  install -D -m644 "${srcdir}/libpng-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

