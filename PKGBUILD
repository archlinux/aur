pkgname=mingw-w64-mcfgthread-git
pkgver=r528.6af5465
pkgrel=1
pkgdesc="An efficient Gthread implementation for GCC (mingw-w64)"
arch=(any)
url="https://github.com/lhmouse/mcfgthread"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'git')
options=(!strip !buildflags staticlibs)
source=("git+https://github.com/lhmouse/mcfgthread.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/mcfgthread"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/mcfgthread"
  autoreconf -vfi
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS="-fno-exceptions" ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/mcfgthread/build-${_arch}
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
