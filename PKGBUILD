# Maintainer: curve <curve.platin at gmail.com>
pkgname=mingw-w64-lua513
pkgver=5.1.3
pkgrel=1
pkgdesc='Lua 5.1.3 for MinGW'
arch=('x86_64')
url='http://www.lua.org/'
depends=('mingw-w64-crt')
makedepends=("mingw-w64-gcc")
license=('MIT')
options=(!strip !buildflags staticlibs)
source=("http://www.lua.org/ftp/lua-$pkgver.tar.gz"
  luacpp.patch)

sha256sums=('6b5df2edaa5e02bf1a2d85e1442b2e329493b30b0c0780f77199d24f087d296d'
            '567158c21eef699f2cffc01dae3bfda3afa929c385ab5e447b396ff2fc090b8b'
            )

_targets="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  for _target in ${_targets}; do
    mkdir -p ${srcdir}/lua51-build-${_target} && cd ${srcdir}/lua51-build-${_target}
    cp -R $srcdir/lua-$pkgver/* .
    cd src
    patch -p1 -i "$srcdir/luacpp.patch"
    cd ..
    sed -e 's:llua:llua5.1:' -e 's:/include:/include/lua5.1:' -i etc/lua.pc
    sed -r -e '/^LUA_(SO|A|T)=/ s/lua/lua5.1/' -e '/^LUAC_T=/ s/luac/luac5.1/' -i src/Makefile
    make -j1  AR="${_target}-ar rcu" RANLIB="${_target}-ranlib" STRIP="${_target}-strip" CC="${_target}-g++" mingw
  done
}

package() {
  for _target in ${_targets}; do
    cd ${srcdir}/lua51-build-${_target}
    make -j1 \
        TO_BIN="lua.exe luac.exe lua51.dll" \
        TO_LIB="liblua5.1.a" \
        INSTALL_TOP="${pkgdir}/usr/${_target}" \
        INSTALL_INC="${pkgdir}/usr/${_target}/include/lua5.1" \
        INSTALL_MAN="${pkgdir}/usr/${_target}/share/man/man1" \
        install
    install -D -m644 etc/lua.pc "${pkgdir}/usr/${_target}/lib/pkgconfig/lua5.1.pc"
    # fixups
    cd "${pkgdir}/usr/${_target}/bin"
    mv lua.exe lua51.exe
    mv luac.exe luac51.exe
    cp -p lua51.dll "${pkgdir}/usr/${_target}/lib/liblua5.1.dll"
    rm -rf "${pkgdir}/usr/${_target}/share"
  done
}

# vim:set ts=4 sw=4 et:
