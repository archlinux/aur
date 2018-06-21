# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libthai
pkgver=0.1.27
pkgrel=1
pkgdesc="Thai language support routines (mingw-w64)"
arch=('any')
url="https://linux.thai.net/projects/libthai"
license=('LGPL')
makedepends=('mingw-w64-configure' 'libdatrie')
depends=('mingw-w64-crt' 'mingw-w64-libdatrie')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://linux.thai.net/pub/thailinux/software/libthai/libthai-${pkgver}.tar.xz")
sha256sums=('1659fa1b7b1d6562102d7feb8c8c3fd94bb2dc5761ed7dbaae4f300e1c03eff6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libthai-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libthai-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
