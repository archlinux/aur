# Contributor: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se3

pkgname=mingw-w64-lua
pkgver=5.3.5
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw-w64)" 
arch=('any')
url="http://www.lua.org/" 
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
license=('MIT')
source=("$url/ftp/lua-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
sha256sums=('0c2eed3f960446e1a3e4b9a1ca2f3ff893b6ce41942cf54d5dd59ab4b3b058ac')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/lua-$pkgver
  # dont strip
  sed -i 's|"RANLIB=strip --strip-unneeded"|"RANLIB=ls"|g' src/Makefile
  # build import lib
  sed -i 's|-shared -o|-shared -Wl,--out-implib,liblua53.dll.a -o|g' src/Makefile
}

package () {
  for _arch in ${_architectures}; do
    cp -r "$srcdir"/lua-$pkgver "$srcdir"/build-${_arch} && pushd "$srcdir"/build-${_arch}
    make -j1 CC=${_arch}-gcc \
      MYCFLAGS="-D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4" \
      AR="${_arch}-ar rcu" \
      RANLIB="${_arch}-ranlib" \
      STRIP="${_arch}-strip" \
      CC="${_arch}-gcc" \
      INSTALL_TOP="${pkgdir}"/usr/${_arch} \
      TO_BIN="lua.exe luac.exe lua53.dll" \
      mingw install
    install -m644 src/liblua*.dll.a "$pkgdir"/usr/${_arch}/lib/
    rm -r "${pkgdir}"/usr/${_arch}/{share,man,lib/lua}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

