pkgname=mingw-w64-libgnurx
pkgver=2.5.1
pkgrel=6
arch=(any)
pkgdesc="regex functionality from glibc (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
provides=('mingw-w64-regex')
conflicts=('mingw-w64-regex')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL')
url="https://sourceforge.net/projects/mingw/"
source=("http://download.sourceforge.net/mingw/Other/UserContributed/regex/mingw-regex-${pkgver}/mingw-libgnurx-${pkgver}-src.tar.gz"
        mingw-w64-libgnurx-honor-destdir.patch
        stdbool.patch)
sha256sums=('7147b7f806ec3d007843b38e19f42a5b7c65894a57ffc297a76b0dcd5f675d76'
            '7db74e71a2612e1720f68acea7c9bc24873be1d533c1eed4db58c4fd923e1ec1'
            '101add52fa902a99fef470bd6cba26d39eb0a67f59db7706ff710036dcb968c6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

prepare()
{
  cd "$srcdir/mingw-libgnurx-${pkgver}"
  patch -Np0 -i ../mingw-w64-libgnurx-honor-destdir.patch
  patch -p0 -i ../stdbool.patch
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

