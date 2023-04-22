pkgname=mingw-w64-gdb
pkgver=13.1
pkgrel=1
pkgdesc="The GNU Debugger (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/gdb/"
license=('LGPL')
depends=('mingw-w64-dlfcn' 'mingw-w64-expat' 'mingw-w64-zlib' 'mingw-w64-readline' 'mingw-w64-mpfr')
makedepends=('mingw-w64-configure' 'texinfo')
options=('staticlibs' '!buildflags' '!strip')
source=("http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.xz")
sha256sums=('115ad5c18d69a6be2ab15882d365dda2a2211c14f480b3502c6eba576e2e95a0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/gdb-$pkgver"
  # https://sourceware.org/bugzilla/show_bug.cgi?id=27657
  sed -i "s|\$(WIN32LIBS) \$(LIBGNU)|\$(WIN32LIBS) \$(LIBGNU) -lbcrypt|g" gdb/Makefile.in
}

build() {
  cd "$srcdir/gdb-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CXXFLAGS="${CXXFLAGS} -Wno-format-security" ${_arch}-configure \
                 --enable-lto \
                 --disable-source-highlight \
                 --disable-tui \
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
    rm -r "$pkgdir"/usr/${_arch}/share/{man,info,locale}
    rm -r "$pkgdir"/usr/${_arch}/{lib,include}
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
