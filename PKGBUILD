# Maintainer: Hugo Hromic <hhromic@gmail.com>
# Contributor: edub4rt <edub4rt@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Daurnimator <daurnimator@archlinux.org>
pkgname=mingw-w64-luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=97813fb924edf822455f91a5fbbdfdb349e5984f
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1727870382
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('any')
url='https://luajit.org/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('gcc-libs' 'lib32-gcc-libs' 'mingw-w64-gcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('cbf1647acbd340c62b9c342dae43290762efa1b26d8bf8457f143fabf8ed86c7')
options=('!strip' '!buildflags' staticlibs)

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _target in ${_targets}; do
    if [ ! -d ${srcdir}/LuaJIT-build-${_target} ]; then
      cp -R $srcdir/LuaJIT-${_commit} ${srcdir}/LuaJIT-build-${_target}
    fi
    cd ${srcdir}/LuaJIT-build-${_target}/src

    _host_cc="gcc -m64"
    if [ "$_target" == "i686-w64-mingw32" ]; then
      _host_cc="gcc -m32"
    fi

    # TARGET_STRIP below avoids early stripping

    make clean
    make amalg PREFIX=/usr/$_target BUILDMODE=dynamic HOST_CC="$_host_cc" CROSS=${_target}- TARGET_STRIP=" @:" TARGET_SYS=Windows
    cp lua51.dll ../

    make clean
    make amalg PREFIX=/usr/$_target BUILDMODE=static HOST_CC="$_host_cc" CROSS=${_target}- TARGET_STRIP=" @:" TARGET_SYS=Windows
  done
}

check() {
  for _target in ${_targets}; do
    cd ${srcdir}/LuaJIT-build-${_target}

    # Make sure that _ct was updated
    test "${_ct}" == "$(cat .relver)"
  done
}

package() {
  for _target in ${_targets}; do
    cd ${srcdir}/LuaJIT-build-${_target}
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

    sed -e "s|^prefix=.*|prefix=/usr/${_target}|" \
        -e "s|^relver=.*|relver=$(cat .relver)|" \
        -i "$pkgdir"/usr/${_target}/lib/pkgconfig/luajit.pc
  done
}
