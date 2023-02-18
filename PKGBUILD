# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgname=mingw-w64-uvwasi
_pkgname=uvwasi
pkgver=0.0.14
pkgrel=4
pkgdesc="WASI syscall API built atop libuv (mingw-w64)"
arch=('any')
url="https://github.com/nodejs/uvwasi"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-libuv=1.44.2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nodejs/uvwasi/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "cmake_install.patch")
sha512sums=('7e18ab10bb3a8cbfffca7c025a05784b92dde6785cd5251766e07dc683adee671195f15e168596a99e2654ed837ab835777c1f06bee0f0504497c609a1716965'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch CMakeLists.txt ../cmake_install.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -B . -S .. \
	-DWITH_SYSTEM_LIBUV=1 \
	-DCMAKE_INSTALL_INCLUDEDIR:PATH=include \
	-DCMAKE_INSTALL_BINDIR:PATH=bin \
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
