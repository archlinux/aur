pkgname=mingw-w64-lua
pkgver=5.4.7
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw-w64)"
arch=('any')
url="http://www.lua.org/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
license=('MIT')
source=("$url/ftp/lua-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('9fbf5e28ef86c69858f6d3d34eccc32e911c1a28b4120ff3e84aaa70cfbf1e30')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/lua-$pkgver
  # build import lib
  sed -i 's|$(CC) -shared|$(CC) -shared -Wl,--out-implib,liblua.dll.a|g' src/Makefile
}

build () {
  for _arch in ${_architectures}; do
    rm -rf "$srcdir"/build-${_arch}
    cp -r "$srcdir"/lua-$pkgver "$srcdir"/build-${_arch} && pushd "$srcdir"/build-${_arch}
    make mingw \
      CC=${_arch}-gcc \
      AR="${_arch}-ar rcs" \
      RANLIB="${_arch}-ranlib" \
      STRIP="${_arch}-strip" \
      MYCFLAGS="-O2 -pipe -fno-plt -fexceptions"
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    make install INSTALL_TOP="${pkgdir}"/usr/${_arch} TO_BIN="lua.exe luac.exe lua54.dll" TO_LIB="liblua.a liblua.dll.a"
    rm -r "${pkgdir}"/usr/${_arch}/{share,man,lib/lua}
    ${_arch}-strip --strip-all "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
