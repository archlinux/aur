pkgname=mingw-w64-libelf-lfg-win32-git
pkgver=r2.5697f67
pkgrel=1
pkgdesc='Subset of FreeBSD modified to compile libelf on Windows (mingw-w64)'
arch=('any')
url="https://github.com/LagFreeGames/libelf-lfg-win32"
license=('BSD')
makedepends=('mingw-w64-meson' 'git')
depends=('mingw-w64-crt')
provides=('mingw-w64-mingw-w64-libelf-lfg-win32')
conflicts=('mingw-w64-mingw-w64-libelf-lfg-win32')
provides=('mingw-w64-libelf')
conflicts=('mingw-w64-libelf')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/LagFreeGames/libelf-lfg-win32.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/libelf-lfg-win32"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/libelf-lfg-win32"
  curl -L https://github.com/LagFreeGames/libelf-lfg-win32/pull/1.patch | patch -p1
}

build() {
  cd "${srcdir}/libelf-lfg-win32"
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Db_lto=false
    ninja -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/"libelf-lfg-win32
    DESTDIR="$pkgdir" meson install -C build-${_arch}
    install -d "$pkgdir"/usr/${_arch}/include/sys
    install -m644 contrib/elftoolchain/libelf/libelf.h contrib/elftoolchain/libelf/gelf.h "$pkgdir"/usr/${_arch}/include
    install -m644 sys/sys/elf32.h sys/sys/elf64.h sys/sys/elf_common.h "$pkgdir"/usr/${_arch}/include/sys
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
