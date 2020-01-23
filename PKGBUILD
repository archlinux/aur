pkgname=mingw-w64-laszip
pkgver=3.4.3
pkgrel=1
pkgdesc='ASPRS LAS lossless compression library (mingw-w64)'
arch=('any')
url='https://laszip.org'
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/LASzip/LASzip/releases/download/${pkgver}/laszip-src-${pkgver}.tar.gz")
sha512sums=('52033d4e271a75f77de9f112e034ff080e476c0d117010136088b255323e4542550c0fa4f87d86521959787919ca3c7e49ef8c8975ba8f8239799a4d7f34d53f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/laszip-src-${pkgver}"
    for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/laszip-src-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
