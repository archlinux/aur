pkgname=mingw-w64-libelf-lfg-win32
pkgver=1.1.0
pkgrel=1
pkgdesc='Subset of FreeBSD modified to compile libelf on Windows (mingw-w64)'
arch=('any')
url="https://github.com/LagFreeGames/libelf-lfg-win32"
license=('BSD')
makedepends=('mingw-w64-meson')
depends=('mingw-w64-crt')
provides=('mingw-w64-libelf')
conflicts=('mingw-w64-libelf')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/LagFreeGames/libelf-lfg-win32/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ce0278792a7800eae2e66e6fefb863a9610bc97b3d2dd7c1fb26d7c8bc973281')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libelf-lfg-win32-${pkgver}"
  curl -L https://github.com/LagFreeGames/libelf-lfg-win32/pull/3.patch | patch -p1
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Db_lto=false
    ninja -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/"libelf-lfg-win32-${pkgver}
    DESTDIR="$pkgdir" meson install -C build-${_arch}
    #install -d "$pkgdir"/usr/${_arch}/include/sys
    #install -m644 contrib/elftoolchain/libelf/libelf.h contrib/elftoolchain/libelf/gelf.h "$pkgdir"/usr/${_arch}/include
    #install -m644 sys/sys/elf32.h sys/sys/elf64.h sys/sys/elf_common.h "$pkgdir"/usr/${_arch}/include/sys
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
