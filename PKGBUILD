# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ffcall
_pkgname=ffcall
pkgver=2.2
pkgrel=1
pkgdesc="C library for implementing foreign function calls in embedded interpreters (mingw-w64)"
arch=('any')
url="http://www.gnu.org/software/libffcall/"
license=('GPL2')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' '!makeflags' 'staticlibs')
source=("https://ftp.gnu.org/gnu/libffcall/lib${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ebfa37f97b6c94fac24ecf3193f9fc829517cf81aee9ac2d191af993d73cb747')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/lib${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lib${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
