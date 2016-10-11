# Maintainer: Martin Minka <https://github.com/k2s>
# Contributor: migerh <https://github.com/migerh>
# Submitter: hollunder <murks at tuxfamily dot org>

pkgname=wxlua-svn
_pkgname=wxlua
pkgver=252
pkgrel=1
pkgdesc="A set of bindings to the wxWidgets library for the Lua programming language - svn version"
arch=('i686' 'x86_64')
url="http://wxlua.sourceforge.net"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk' 'webkitgtk2' 'lua52')
makedepends=('subversion' 'cmake')
provides=('wxlua' 'wxstedit')
conflicts=('wxlua' 'wxstedit')
source=("wxlua::svn+http://svn.code.sf.net/p/wxlua/svn/trunk"
        "wxlstate.patch")
md5sums=('SKIP'
         'd4bdd1ccbb3a33abf4e7e33776811038')

pkgver() {
  cd "$srcdir/$_pkgname"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$_pkgname/wxLua/"

  # wxstedit doc folder fix
  sed -i 's|doc/|share/&|' modules/wxstedit/CMakeLists.txt

  # fix segfault
  svn patch "$srcdir/wxlstate.patch"
}

build() {
  cd "$srcdir/$_pkgname/wxLua/"

  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
           -DwxLua_LUA_INCLUDE_DIR=/usr/include/lua5.2 \
           -DwxLua_LUA_LIBRARY=/usr/lib/liblua.so.5.2 \
           -DwxLua_LUA_LIBRARY_USE_BUILTIN=0 \
           -DwxLua_LUA_LIBRARY_VERSION=5.2 \
           -DBUILD_SHARED_LIBS=TRUE
  make
}

package() {
  cd "$srcdir/wxlua/wxLua/build"
  make DESTDIR="$pkgdir/" install

  # mv lua module
  install -d "$pkgdir/usr/lib/lua/5.2"
  mv "$pkgdir/usr/lib/libwx.so" "$pkgdir/usr/lib/lua/5.2/wx.so"

  # desktop file
  install -Dm644 ../distrib/autopackage/wxlua.desktop \
    "$pkgdir/usr/share/applications/wxlua.desktop"

  # mime file
  install -Dm644 ../distrib/autopackage/wxlua.xml \
    "$pkgdir/usr/share/mime/packages/wxlua.xml"

  # license
  install -Dm 644 ../docs/licence.txt \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
