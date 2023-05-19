# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgname=mingw-w64-uvwasi
_pkgname=uvwasi
pkgver=0.0.18
pkgrel=1
pkgdesc="WASI syscall API built atop libuv (mingw-w64)"
arch=('any')
url="https://github.com/nodejs/uvwasi"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt' 'mingw-w64-libuv=1.44.2')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nodejs/uvwasi/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "cmake_install.patch")
sha512sums=('e0624489166836d7909030e037fe5b302695e02c61fe3fdeed8db771266907302b005b2b5108dcfc9af6361f95f28f477b706f9e2fc31f629b934571843a0089'
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
