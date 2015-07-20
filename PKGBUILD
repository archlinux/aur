# Maintainer: Daniel Kirchner <daniel AT ekpyron DOT org>

pkgname=mingw-w64-libpng
pkgver=1.6.16
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw-w64)"
depends=('mingw-w64-zlib' 'mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.xz"
        "http://downloads.sourceforge.net/project/libpng-apng/libpng16/$pkgver/libpng-$pkgver-apng.patch.gz")
md5sums=('23b7286b5d4a86de950fd2ffc5cac742'
         '52de72a29e5d0428a0e527be74b99c24')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libpng-$pkgver"

  # Add animated PNG (apng) support
  # see http://sourceforge.net/projects/libpng-apng/
  patch -p1 -i "${srcdir}/libpng-$pkgver-apng.patch"

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libpng-${pkgver}/build-${_arch}"
    cd "${srcdir}/libpng-${pkgver}/build-${_arch}"
    ${_arch}-configure
    make
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libpng-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/usr/${_arch}/share/man"
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done

  install -D -m644 "${srcdir}/libpng-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
