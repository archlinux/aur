pkgname=('mingw-w64-gd')
pkgver=2.3.3
pkgrel=1
pkgdesc='Library for the dynamic creation of images by programmers (mingw-w64)'
url='https://libgd.github.io/'
arch=('any')
license=('custom')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libgd/libgd/archive/gd-${pkgver}.tar.gz")
sha256sums=('24429f9d0dbe0f865aaa4b1a63558242396ba9134e6cfd32ca5e486a84483350')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libgd-gd-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgd-gd-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    rm "${pkgdir}"/usr/${_arch}/bin/bdftogd
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
