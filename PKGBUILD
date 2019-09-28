pkgname=cross-mingw-w64-gdb
pkgver=8.3.1
pkgrel=1
pkgdesc="The GNU Debugger (compiled to debug target mingw-w64)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('LGPL')
depends=('ncurses' 'expat' 'xz' 'readline' 'source-highlight')
makedepends=('gcc' 'texinfo')
options=('staticlibs' '!buildflags')
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('1e55b4d7cdca7b34be12f4ceae651623aa73b2fd640152313f9f66a7149757c4')

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

# vim: set expandtab tabstop=4 :
