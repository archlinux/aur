
pkgname=mingw-w64-libgnurx
pkgver=2.5.1
pkgrel=5
arch=(any)
pkgdesc="regex functionality from glibc (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL')
url="http://mingw.sourceforge.net/"
source=("http://download.sourceforge.net/mingw/Other/UserContributed/regex/mingw-regex-${pkgver}/mingw-libgnurx-${pkgver}-src.tar.gz"
        "mingw-w64-libgnurx-honor-destdir.patch")
md5sums=('35c8fed3101ca1f253e9b6b1966661f6'
         '2d87c59177adf5ec13dbcc02acc4a450')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

prepare()
{
  cd "$srcdir/mingw-libgnurx-${pkgver}"
  patch -Np0 -i ../mingw-w64-libgnurx-honor-destdir.patch
}

build()
{
  cd "$srcdir/mingw-libgnurx-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
  
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/mingw-libgnurx-${pkgver}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/include
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir"/usr/${_arch}/man
  done
}

