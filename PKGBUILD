pkgname=mingw-w64-gdb
pkgver=9.2
pkgrel=1
pkgdesc="The GNU Debugger (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/gdb/"
license=('LGPL')
depends=('mingw-w64-dlfcn' 'mingw-w64-expat' 'mingw-w64-zlib' 'mingw-w64-readline')
makedepends=('mingw-w64-configure' 'texinfo')
options=('staticlibs' '!buildflags' '!strip')
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('360cd7ae79b776988e89d8f9a01c985d0b1fa21c767a4295e5f88cb49175c555')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/gdb-$pkgver"
  # gdbserver.exe: undefined ref to dlopen
  sed -i "s|GDBSERVER_LIBS = @GDBSERVER_LIBS@|GDBSERVER_LIBS = -ldl @GDBSERVER_LIBS@|g" gdb/gdbserver/Makefile.in
}

build() {
  cd "$srcdir/gdb-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
                 --enable-lto \
                 --disable-source-highlight \
                 --with-system-readline \
                 --with-expat ..
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
