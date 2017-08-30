# Contributor: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se3

pkgname=mingw-w64-lua
pkgver=5.3.4
pkgrel=1
pkgdesc="A powerful light-weight programming language designed for extending applications. (mingw-w64)" 
arch=('any')
url="http://www.lua.org/" 
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
license=('MIT')
source=("$url/ftp/lua-$pkgver.tar.gz")
options=(!strip !buildflags staticlibs)
md5sums=('53a9c68bcc0eda58bdc2095ad5cdfc63')

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
      MYCFLAGS="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4" \
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

