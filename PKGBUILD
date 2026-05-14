pkgname=mingw-w64-muparser
pkgver=2.3.5
pkgrel=1
pkgdesc="A fast math parser library (mingw-w64)"
arch=('any')
url="http://muparser.sourceforge.net/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
license=('custom')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/beltoforion/muparser/archive/v${pkgver}.tar.gz")
sha256sums=('20b43cc68c655665db83711906f01b20c51909368973116dfc8d7b3c4ddb5dd4')

_architectures=${MINGW_W64_QT6_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "$srcdir"/muparser-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DENABLE_SAMPLES=OFF -DBUILD_TESTING=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir"/muparser-${pkgver}
  for _arch in ${_architectures}; do  
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

