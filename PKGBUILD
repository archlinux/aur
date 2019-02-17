pkgname=mingw-w64-gdb
pkgver=8.2.1
pkgrel=1
pkgdesc="The GNU Debugger (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/gdb/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-expat' 'mingw-w64-zlib' 'mingw-w64-readline')
makedepends=('mingw-w64-gcc' 'texinfo')
options=('staticlibs' '!buildflags' '!strip')
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/gdb-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} \
                 --host=${_arch} \
                 --target=${_arch} \
                 --enable-lto \
                 --with-system-readline \
                 --with-expat
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/gdb-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -rf "$pkgdir"/usr/${_arch}/share/{man,info,locale}
    rm -rf "$pkgdir"/usr/${_arch}/lib
    rm -rf "$pkgdir"/usr/${_arch}/include
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/gdb.exe
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/gdbserver.exe
  done
}
