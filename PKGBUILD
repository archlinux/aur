# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libuv
_pkgname=libuv
pkgver=1.27.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('42dfb7bee21f3f875ae5e6e4531aff52cff59d4c000f9cee1bde1b12c127beb7adefd6d6a11c6f0180868ee5ef15351a21a36c10b1be0aa7bedc15f0c50f87e0')

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
