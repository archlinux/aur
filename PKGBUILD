# Maintainer: edub4rt <edub4rt@gmail.com>
pkgname=mingw-w64-lua51
pkgver=5.1.5
pkgrel=2
pkgdesc='LUA 5.1'
arch=('x86_64')
url='http://www.lua.org/'
depends=('mingw-w64-crt')
makedepends=("mingw-w64-gcc")
license=('MIT')
options=(!strip !buildflags staticlibs)
source=("http://www.lua.org/ftp/lua-$pkgver.tar.gz"
  luacpp.patch)

md5sums=('2e115fe26e435e33b0d5c022e4490567'
         '71a8472a0116a7639ce6c157b7f13d57')

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
