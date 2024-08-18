# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgname=mingw-w64-uvwasi
_pkgname=uvwasi
pkgver=0.0.21
pkgrel=1
pkgdesc="WASI syscall API built atop libuv (mingw-w64)"
arch=('any')
url="https://github.com/nodejs/uvwasi"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-libuv')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nodejs/uvwasi/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a5bd3bc0b1a17b1a69939d52cbdb23a4126c7bb5b3d1f3da93bb5ab3f72e926a13c83f5710dbba76d76ca5a4fa70fc8db382fbcbf164d191381637b79018696f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -B . -S .. \
	-DWITH_SYSTEM_LIBUV=1 \
	-DUVWASI_BUILD_TESTS=0
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
