# Maintainer: Jiří Klimeš <blueowl@centrum.cz>

pkgbase=lua-gl
pkgname=('lua-gl' 'lua51-gl' 'lua52-gl' 'lua53-gl')
pkgver=1.11
pkgrel=2
pkgdesc="Lua bindings for OpenGL"
arch=('x86_64')
url="http://luagl.sourceforge.net"
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'glu')
source=("https://sourceforge.net/projects/luagl/files/${pkgver}/Docs%20and%20Sources/luagl-${pkgver}_Sources.tar.gz"
        "https://sourceforge.net/projects/luagl/files/${pkgver}/Docs%20and%20Sources/luagl-${pkgver}_Docs_html.tar.gz"
        "tecmake-use-lua54.patch"
)
sha256sums=('5898433a32c5ff7e36dcbf1a6b638f7af1e5ff8c4731ba17d5f109c4a8db981e'
            '3d23be0aac7d11232eaad76a6e327066b2fe4aa821af1244db7ccd37b82b0045'
            '6249a95238a53c57c1326f71133c46a116cfcc44597cf635b65763fa03960eba')

prepare() {
  # Add RUN_PATH variable to be able to set DT_RUNPATH
  sed 's/$(ECHO)$(LD)/& $(RUN_PATH)/' -i "$srcdir"/luagl/tecmake.mak

  # Make tecmake.mak Lua 5.4 aware
  patch -p1 < "$srcdir"/tecmake-use-lua54.patch
}

build() {
  cd "$srcdir"/luagl
  echo 'Building with Lua 5.4'
  make USE_LUA54=Yes RUN_PATH="-Wl,-rpath=/usr/lib/lua/5.4,--enable-new-dtags,--as-needed"

  echo 'Building with Lua 5.1'
  make USE_LUA51=Yes RUN_PATH="-Wl,-rpath=/usr/lib/lua/5.1,--enable-new-dtags,--as-needed"

  echo 'Building with Lua 5.2'
  make USE_LUA52=Yes RUN_PATH="-Wl,-rpath=/usr/lib/lua/5.2,--enable-new-dtags,--as-needed"

  echo 'Building with Lua 5.3'
  make USE_LUA53=Yes RUN_PATH="-Wl,-rpath=/usr/lib/lua/5.3,--enable-new-dtags,--as-needed"
}

_package_helper() {
  _lua_ver=$1
  _lua_ver_nodot=`echo $1 | cut -c1,3`

  _linux_ver="Linux$(uname -r | awk -v FS='.' -v OFS='' {'print $1,$2'})_64"

  install -m755 -d "$pkgdir"/usr/lib/lua/${_lua_ver}
  install -m755 "$srcdir"/luagl/lib/${_linux_ver}/Lua${_lua_ver_nodot}/*.so "$pkgdir"/usr/lib/lua/${_lua_ver}
  install -Dm644 "$srcdir"/luagl/COPYRIGHT "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -m755 -d "$pkgdir"/usr/share/doc/$pkgname/html
  install -Dm644 "$srcdir"/luagl/html/*.* "$pkgdir"/usr/share/doc/$pkgname/html
  install -m755 -d "$pkgdir"/usr/share/doc/$pkgname/html/examples
  install -Dm644 "$srcdir"/luagl/html/examples/* "$pkgdir"/usr/share/doc/$pkgname/html/examples
}

package_lua-gl() {
  pkgdesc="Lua 5.4 bindings for OpenGL"
  depends=('lua' 'glu')

  _package_helper "5.4"
}

package_lua51-gl() {
  pkgdesc="Lua 5.1 bindings for OpenGL"
  depends=('lua51' 'glu')

  _package_helper "5.1"
}

package_lua52-gl() {
  pkgdesc="Lua 5.2 bindings for OpenGL"
  depends=('lua52' 'glu')

  _package_helper "5.2"
}

package_lua53-gl() {
  pkgdesc="Lua 5.3 bindings for OpenGL"
  depends=('lua53' 'glu')

  _package_helper "5.3"
}


# vim:set ts=2 sw=2 et:
