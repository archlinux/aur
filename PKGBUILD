pkgname=mingw-w64-udis86
pkgver=1.7.2
pkgrel=2
pkgdesc="A minimalistic disassembler library"
arch=('i686' 'x86_64')
url="http://udis86.sourceforge.net/"
license=("BSD")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config python)
depends=()
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/udis86/udis86-${pkgver}.tar.gz")
sha1sums=('f55dec2d5319aac9d0a7ae2614ddcc7aa73d3744')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    "${srcdir}"/udis86-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch}
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
