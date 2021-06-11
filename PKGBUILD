pkgname=mingw-w64-libuargp-git
pkgver=r19.1f92296
pkgrel=1
pkgdesc='libuargp extracted from uclibc (mingw-w64)'
arch=('any')
url="https://sourceware.org/elfutils/"
license=('LGPL3' 'GPL3')
makedepends=('mingw-w64-gcc' 'git')
depends=('mingw-w64-gettext')
provides=('mingw-w64-libuargp')
conflicts=('mingw-w64-libuargp')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/xhebox/libuargp.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/libuargp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch} && cp -r libuargp build-${_arch} && pushd build-${_arch}
    make CROSS_COMPILE=${_arch}- CC=${_arch}-gcc SHLIB_EXT=.dll LDFLAGS="-lintl -Wl,--out-implib,libargp.dll.a" 
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -d "$pkgdir"/usr/${_arch}/{include,lib,bin}
    install argp*.h -m644 "$pkgdir"/usr/${_arch}/include
    install *.a -m644 "$pkgdir"/usr/${_arch}/lib
    install *.dll -m755 "$pkgdir"/usr/${_arch}/bin
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
