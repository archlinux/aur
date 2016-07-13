
pkgname=mingw-w64-mcfgthread
pkgver=a0.9
pkgrel=1
pkgdesc="An efficient Gthread implementation for GCC (mingw-w64)"
arch=(any)
url="https://github.com/lhmouse/mcfgthread"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("https://github.com/lhmouse/mcfgthread/archive/alpha-0.9.tar.gz")
md5sums=('bbd2e4497255b314f5adf78a83063aad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/mcfgthread-alpha-0.9"
  autoreconf -vfi
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-fno-exceptions" ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/mcfgthread-alpha-0.9/build-${_arch}
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
