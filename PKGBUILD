
pkgname=mingw-w64-glpk
pkgver=4.65
pkgrel=1
pkgdesc="GNU Linear Programming Kit : solve LP, MIP and other problems. (mingw-w64)"
arch=('any')
url="http://www.gnu.org/software/glpk/glpk.html"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://ftp.gnu.org/gnu/glpk/glpk-${pkgver}.tar.gz)
sha256sums=('4281e29b628864dfe48d393a7bedd781e5b475387c20d8b0158f329994721a10')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/glpk-${pkgver}"
}

build() {
  cd "${srcdir}/glpk-${pkgver}"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    CPPFLAGS="-D__WOE__" ${_arch}-configure
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

