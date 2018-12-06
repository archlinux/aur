# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-luajit-2.1
pkgver=2.1.0.beta3
pkgfile=${pkgver/.beta/-beta}
pkgrel=2
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc)
conflicts=('mingw-w64-luajit')
provides=('mingw-w64-luajit')
source=(http://luajit.org/download/LuaJIT-${pkgfile}.tar.gz)
options=(!strip !buildflags staticlibs)
sha256sums=('1ad2e34b111c802f9d0cdf019e986909123237a28c746b21295b63c9e785d9c3')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _target in ${_targets}; do
    mkdir -p ${srcdir}/luajit-build-${_target} && cd ${srcdir}/luajit-build-${_target}
    cp -R $srcdir/LuaJIT-$pkgfile/* .
    cd src

    sed -i 's/^BUILDMODE= [a-z]*$/BUILDMODE= dynamic/' Makefile
    make clean
    if [ "$_target" == "i686-w64-mingw32" ]; then
        make PREFIX=/usr/$_target HOST_CC="gcc -m32" CROSS=${_target}- TARGET_SYS=Windows lua51.dll
    else
        make PREFIX=/usr/$_target HOST_CC="gcc -m64" CROSS=${_target}- TARGET_SYS=Windows lua51.dll
    fi
    cp lua51.dll ../

    sed -i 's/^BUILDMODE= [a-z]*$/BUILDMODE= static/' Makefile
    make clean
    if [ "$_target" == "i686-w64-mingw32" ]; then
        make PREFIX=/usr/$_target HOST_CC="gcc -m32" CROSS=${_target}- TARGET_SYS=Windows amalg
    else
        make PREFIX=/usr/$_target HOST_CC="gcc -m64" CROSS=${_target}- TARGET_SYS=Windows amalg
    fi
  done
}

package() {
  for _target in ${_targets}; do
      cd ${srcdir}/luajit-build-${_target}
      mkdir -p $pkgdir/usr/${_target}/lib
      mkdir -p $pkgdir/usr/${_target}/include/luajit-2.1
      cp lua51.dll $pkgdir/usr/${_target}/lib/luajit-2.1.dll
      cp src/libluajit.a $pkgdir/usr/${_target}/lib/
      cp src/{lauxlib.h,lua.h,lua.hpp,luaconf.h,luajit.h,lualib.h} $pkgdir/usr/$_target/include/luajit-2.1/
      ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/lib/*.dll
      ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
  done
}
