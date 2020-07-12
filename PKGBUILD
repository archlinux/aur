# Maintainer: Les De Ridder <aur@lesderid.net>

pkgname=gdb-msvc-git
pkgver=9.2+0.1.r0.g23a86f4
pkgrel=1
pkgdesc="The GNU Debugger (compiled to debug target mingw-w64, with MSVC patches)"
arch=('i686' 'x86_64')
url="https://github.com/lesderid/gdb-msvc"
license=('GPL3')
depends=('ncurses' 'expat' 'xz' 'readline' 'source-highlight' 'radare2-git' 'llvm')
makedepends=('gcc' 'texinfo' 'radare2-git' 'llvm')
conflicts=('cross-mingw-w64-gdb')
provides=('cross-mingw-w64-gdb')
options=('staticlibs' '!buildflags')
source=("git+https://github.com/lesderid/gdb-msvc")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/gdb-msvc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/gdb-msvc"
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
    cd "$srcdir"/gdb-msvc/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -rf "$pkgdir"/usr/share/{info,locale,gdb}
    rm -f  "$pkgdir"/usr/share/man/man1/*-w64-mingw32-gdbserver.1*
    rm -rf "$pkgdir"/usr/share/man/man5
    rm -rf "$pkgdir"/usr/lib
    rm -rf "$pkgdir"/usr/include
  done
}
