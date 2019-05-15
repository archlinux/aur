# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libuv
_pkgname=libuv
pkgver=1.29.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('19f1f25ffdb287a755f773488e3da5fd5b5b43c333e3dfb019bbac430ccd77456da96dbf60c38b97c87880f90f08438366e29bbcc8d81a28f777f39fca8af529')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
