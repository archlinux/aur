
pkgname=mingw-w64-glpk
pkgver=4.55
pkgrel=1
pkgdesc="GNU Linear Programming Kit : solve LP, MIP and other problems. (mingw-w64)"
arch=('any')
url="http://www.gnu.org/software/glpk/glpk.html"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://ftp.gnu.org/gnu/glpk/glpk-${pkgver}.tar.gz)
sha1sums=('893058aada022a8dfc63c675ebcd7e7e86a3a363')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/glpk-${pkgver}"
  sed -i "s|-version-info|-no-undefined -version-info|g" src/Makefile.am
  autoreconf -vfi
}

build() {
  cd "${srcdir}/glpk-${pkgver}"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package(){
  for _arch in ${_architectures}; do
    cd "${srcdir}/glpk-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

