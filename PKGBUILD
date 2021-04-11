pkgname=mingw-w64-lua
pkgver=5.4.3
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw-w64)"
arch=('any')
url="http://www.lua.org/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
license=('MIT')
source=("$url/ftp/lua-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('f8612276169e3bfcbcfb8f226195bfc6e466fe13042f1076cbde92b7ec96bbfb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/lua-$pkgver
  # build import lib
  sed -i 's|$(AR) $@ $(BASE_O)|$(CC) -shared -Wl,--out-implib,liblua54.dll.a -o $@ $(BASE_O) $(LIBS)|g' src/Makefile
}

build () {
  for _arch in ${_architectures}; do
    rm -rf "$srcdir"/build-${_arch}
    cp -r "$srcdir"/lua-$pkgver "$srcdir"/build-${_arch} && pushd "$srcdir"/build-${_arch}
    make generic \
      ALL=lua54.dll \
      LUA_A="lua54.dll" \
      LUA_T="lua.exe" \
      CC=${_arch}-gcc \
      RANLIB="ls" \
      MYCFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
      SYSCFLAGS="-DLUA_BUILD_AS_DLL" \
      LIBS="-lssp"
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    make install INSTALL_TOP="${pkgdir}"/usr/${_arch} TO_BIN="lua54.dll" TO_LIB="liblua54.dll.a"
    rm -r "${pkgdir}"/usr/${_arch}/{share,man,lib/lua}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
