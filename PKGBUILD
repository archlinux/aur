# Maintainer: Hugo Hromic <hhromic@gmail.com>
# Contributor: edub4rt <edub4rt@gmail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Daurnimator <daurnimator@archlinux.org>

# LuaJIT has a "rolling release" where the HEAD ref of the 'v2.1' branch should be followed.
# The patch version in this package corresponds to the timestamp of the HEAD ref.
# The latest HEAD ref hash and its timestamp can be retrieved via:
#   $ curl -s https://api.github.com/repos/LuaJIT/LuaJIT/commits/v2.1 | jq -r '.sha,(.commit.committer.date | fromdate)'
_commit=7152e15489d2077cd299ee23e3d51a4c599ab14f

pkgname=mingw-w64-luajit
pkgver=2.1.1765228720
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1'
arch=('any')
url='https://luajit.org/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('gcc-libs' 'lib32-gcc-libs' 'mingw-w64-gcc')
source=("LuaJIT-${_commit}.tar.gz::https://github.com/LuaJIT/LuaJIT/archive/${_commit}.tar.gz")
sha256sums=('2103f2c9526d158259a627d51799de8016e2a2c6d89f6ef25f9d89b92c597511')
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

    # Make sure that pkgver matches packaged commit
    local _ct=${pkgver##*.}
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
