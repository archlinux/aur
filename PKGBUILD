# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Karro <karolina.lindqvist@kramnet.se>

pkgbase=libcd
pkgname=('libcd' 'lua-cd' 'lua51-cd' 'lua52-cd')
pkgdesc="Canvas Draw - 2D vector graphics library"
pkgver=5.12
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.tecgraf.puc-rio.br/cd/"
makedepends=('glu' 'lsb-release' 'lua' 'lua51' 'lua52' 'lua-im' 'lua51-im' 'lua52-im')
license=('MIT')
_ftglver=2.1.5
source=(
  "https://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Sources.tar.gz"
  "https://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/ftgl-${_ftglver}_Sources.tar.gz"
  "https://downloads.sourceforge.net/project/canvasdraw/${pkgver}/Docs%20and%20Sources/cd-${pkgver}_Docs.pdf"
)
md5sums=('578d4609719cb8060b3b7f722ec8f7e4'
         '2874f6a26c86757894a20d2189f91fde'
         '05e5c870d00a6f5a58e242b1fb6d1ead')

prepare() {
  # Statically link internal ftgl library. It contains Tecgraf's extensions needed by libcdgl.so
  sed '/LIBS += ftgl/{ N; s/.*/SLIB += $(FTGL_LIB)\/libftgl.a/; }' -i "$srcdir"/cd/tecmake.mak
}

build() {
  msg2 'Building libcd'
  cd "$srcdir"/ftgl
  make

  cd "$srcdir"/cd/src
  make cd cd_pdflib cdpdf cdgl cdim cdcontextplus \
    IM_INC=/usr/include/im \
    IM_LIB=/usr/lib \
    USE_FTGL=Yes

  msg2 'Building Lua 5.3 bindings'
  make cdlua5 cdluapdf5 cdluagl5 cdluacontextplus5 cdluaim5 \
    STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.3,--enable-new-dtags,--as-needed" \
    IM_INC=/usr/include/im \
    IM_LIB=/usr/lib \
    IMLUA_LIB=/usr/lib/lua/5.3 \
    USE_LUA53=Yes

  msg2 'Building Lua 5.2 bindings'
  make cdlua5 cdluapdf5 cdluagl5 cdluacontextplus5 cdluaim5 \
    STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.2,--enable-new-dtags,--as-needed" \
    IM_INC=/usr/include/im \
    IM_LIB=/usr/lib \
    IMLUA_LIB=/usr/lib/lua/5.2 \
    LUA_INC=/usr/include/lua5.2 \
    USE_LUA52=Yes

  msg2 'Building Lua 5.1 bindings'
  make cdlua5 cdluapdf5 cdluagl5 cdluacontextplus5 cdluaim5 \
    STDLDFLAGS="-shared -Wl,-rpath=/usr/lib/lua/5.1,--enable-new-dtags,--as-needed" \
    IM_INC=/usr/include/im \
    IM_LIB=/usr/lib \
    IMLUA_LIB=/usr/lib/lua/5.1 \
    LUA_INC=/usr/include/lua5.1 \
    USE_LUA51=Yes
}

package_libcd() {
  pkgdesc="Canvas Draw - 2D vector graphics library"
  depends=('libim' 'glu' 'libxmu' 'gtk3')

  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  install -m755 -d "$pkgdir"/usr/lib
  install -m644 "$srcdir"/cd/lib/${_linux_ver}/lib*.so "$pkgdir"/usr/lib
  install -m755 -d "$pkgdir"/usr/share/$pkgname
  install -m644 "$srcdir"/cd-${pkgver}_Docs.pdf "$pkgdir"/usr/share/$pkgname
  install -m755 -d "$pkgdir"/usr/include/cd
  install -m644 "$srcdir"/cd/include/* "$pkgdir"/usr/include/cd
  install -Dm644 "$srcdir"/cd/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

_lua_cd_package_helper() {
  # $1 ... Lua version ("5.1", "5.2" or "5.3")

  _lua_ver=$1
  _lua_ver_nodot=`echo $1 | cut -c1,3`
  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  install -d "$pkgdir"/usr/lib/lua/${_lua_ver}/
  install -Dm644 "$srcdir"/cd/lib/${_linux_ver}/Lua${_lua_ver_nodot}/*.so "$pkgdir"/usr/lib/lua/${_lua_ver}/
  install -Dm644 "$srcdir"/cd/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # create symlinks required for Lua modules
  for name in \
    cdlua \
    cdluapdf \
    cdluagl \
    cdluaim \
    cdluacontextplus ; do
      _lib=lib${name}${_lua_ver_nodot}.so
      ln -s /usr/lib/lua/${_lua_ver}/${_lib} "$pkgdir"/usr/lib/lua/${_lua_ver}/${name}.so
  done
}

package_lua-cd() {
  pkgdesc="Lua (5.3) bindings for Canvas Draw library"
  depends=('libcd')

  _lua_cd_package_helper "5.3"
}

package_lua52-cd() {
  pkgdesc="Lua (5.2) bindings for Canvas Draw library"
  depends=('libcd')

  _lua_cd_package_helper "5.2"
}

package_lua51-cd() {
  pkgdesc="Lua (5.1) bindings for Canvas Draw library"
  depends=('libcd')

  _lua_cd_package_helper "5.1"
}

# vim:set ts=2 sw=2 et:
