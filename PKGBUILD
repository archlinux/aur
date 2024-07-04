pkgname=cross-mingw-w64-gdb
pkgver=14.2
pkgrel=1
pkgdesc="The GNU Debugger (compiled to debug target mingw-w64)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('LGPL')
depends=('ncurses' 'expat' 'xz' 'readline' 'source-highlight')
makedepends=('gcc' 'texinfo')
options=('staticlibs' '!buildflags')
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('2d4dd8061d8ded12b6c63f55e45344881e8226105f4d2a9b234040efa5ce7772')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/gdb-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure --prefix=/usr \
                 --target=${_arch} \
                 --enable-lto \
                 --disable-nls \
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
    rm -rf "$pkgdir"/usr/share/{info,locale,gdb}
    rm -f  "$pkgdir"/usr/share/man/man1/*-w64-mingw32-gdbserver.1*
    rm -rf "$pkgdir"/usr/share/man/man5
    rm -rf "$pkgdir"/usr/lib
    rm -rf "$pkgdir"/usr/include
  done
}
