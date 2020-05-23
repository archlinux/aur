# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-luajit-2.1
pkgver=2.1.0.beta3
pkgfile=${pkgver/.beta/-beta}
pkgrel=3
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('i686' 'x86_64')
url='http://luajit.org/'
license=('MIT')
depends=(mingw-w64-crt)
makedepends=(mingw-w64-gcc patch)
conflicts=('mingw-w64-luajit')
provides=('mingw-w64-luajit')
source=(https://luajit.org/download/LuaJIT-${pkgfile}.tar.gz
        001-make-import-library.patch
        002-fix-pkg-config-file.patch)
options=(!strip !buildflags staticlibs)
sha256sums=('1ad2e34b111c802f9d0cdf019e986909123237a28c746b21295b63c9e785d9c3'
            '89a044f2da887036e84e843f5e5fc491fcf7ee6fccea407a4607ac3b3f344937'
            '4df486e82b0bbeead01dcf6001e90c51477a3a8ac18611d60d7067f2c7013428')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/LuaJIT-$pkgfile"
  patch -b -p1 -i ${srcdir}/001-make-import-library.patch
  patch -b -p1 -i ${srcdir}/002-fix-pkg-config-file.patch
}

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
      mkdir -p $pkgdir/usr/${_target}/{bin,lib}
      mkdir -p $pkgdir/usr/${_target}/include/luajit-2.1
      mkdir -p $pkgdir/usr/${_target}/lib/pkgconfig
      cp lua51.dll $pkgdir/usr/${_target}/bin/luajit-2.1.dll
      cp src/libluajit.a $pkgdir/usr/${_target}/lib/
      cp src/libluajit-5.1.dll.a $pkgdir/usr/${_target}/lib/libluajit-2.1.dll.a
      cp src/{lauxlib.h,lua.h,lua.hpp,luaconf.h,luajit.h,lualib.h} $pkgdir/usr/$_target/include/luajit-2.1/
      cp etc/luajit.pc "$pkgdir"/usr/${_target}/lib/pkgconfig/
      ${_target}-strip --strip-unneeded "$pkgdir"/usr/${_target}/bin/*.dll
      ${_target}-strip -g "$pkgdir"/usr/${_target}/lib/*.a
  done
}
