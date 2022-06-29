pkgname=mingw-w64-libde265
pkgver=1.0.8
pkgrel=1
pkgdesc="Open h.265 video codec implementation (mingw-w64)"
arch=('any')
url="https://github.com/strukturag/libde265"
license=('LGPL3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=(https://github.com/strukturag/libde265/releases/download/v$pkgver/libde265-$pkgver.tar.gz)
sha256sums=('24c791dd334fa521762320ff54f0febfd3c09fc978880a8c5fbc40a88f21d905')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/libde265-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package ()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/libde265-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
