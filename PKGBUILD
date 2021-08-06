pkgname=mingw-w64-fcgi
pkgver=2.4.2
pkgrel=1
pkgdesc='FASTCgi (fcgi) is a language independent, high performant extension to CGI (mingw-w64)'
arch=('any')
license=('custom')
options=('!makeflags')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
url='http://www.fastcgi.com/'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FastCGI-Archives/fcgi2/archive/${pkgver}.tar.gz")
sha256sums=('1fe83501edfc3a7ec96bb1e69db3fd5ea1730135bd73ab152186fd0b437013bc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/fcgi2-${pkgver}"
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fcgi2-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
