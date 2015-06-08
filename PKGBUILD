
pkgname=mingw-w64-muparser
pkgver=2.2.4
pkgrel=1
pkgdesc="A fast math parser library (mingw-w64)"
arch=('any')
url="http://muparser.sourceforge.net/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
license=('MIT')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://docs.google.com/uc?export=download&id=0BzuB-ydOOoduejdwdTQwcF9JLTA")
md5sums=('ab5d86af1c75e3946314e76e6018f78d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/muparser_v${pkgver//./_}

  # if defined, MUPARSER_DLL macro results in unresolved symbols in dll
  sed -i "/DMUPARSER_DLL/d" Makefile.in

  #sed -i "s|//#define MUP_USE_OPENMP|#define MUP_USE_OPENMP|g" include/muParserDef.h

  # configure is not executable
  chmod a+x configure
}


build() {
  cd "$srcdir"/muparser_v${pkgver//./_}
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-configure --disable-shared \
      --disable-samples
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-static \
      --disable-samples
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/muparser_v${pkgver//./_}/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/muparser_v${pkgver//./_}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/muparser.dll "$pkgdir"/usr/${_arch}/bin/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  cd "$srcdir/muparser_v${pkgver//./_}"
  install -D -m644 License.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

