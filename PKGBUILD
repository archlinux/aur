# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Albert Kugel (Lastebil) <lastebilaur@trebel.org>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Eric Forgeot <http://ifiction.free.fr>
# Contributor: favardin

pkgname=wxlua
pkgver=2.8.12.3
pkgrel=4
pkgdesc="A set of bindings to the wxWidgets library for the Lua programming language."
arch=('i686' 'x86_64')
url="http://wxlua.sourceforge.net"
license=('custom:wxWindows')
depends=('lua52' 'desktop-file-utils' 'wxgtk2.8' 'webkitgtk2')
optdepends=('webkit2gtk')
makedepends=('cmake')
provides=('wxstedit')
conflicts=('wxstedit')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname/$pkgver/wxLua-$pkgver-src.tar.gz")
md5sums=('e0a28904d046400713c07d7c4c9515ef')

prepare() {
  cd wxLua-$pkgver-src
  [ -d b ] || mkdir b

  # wxstedit doc folder fix
  sed -i 's|doc/|share/&|' modules/wxstedit/CMakeLists.txt

  # right shebang for wxluafreeze.lua
  sed -i 's| \..*/|/usr/bin/env |;1s||$|' apps/wxluafreeze/wxluafreeze.lua
}

build() {
  cd wxLua-$pkgver-src/b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-2.8 \
           -DwxLua_LUA_INCLUDE_DIR=/usr/include \
           -DwxLua_LUA_LIBRARY=/usr/lib/liblua.so.5.2 \
           -DwxLua_LUA_LIBRARY_USE_BUILTIN=0 \
           -DwxLua_LUA_LIBRARY_VERSION=5.2
  make
}

package() {
  cd wxLua-$pkgver-src/b
  make DESTDIR="$pkgdir/" install

  # mv lua module
  install -d "$pkgdir/usr/lib/lua/5.2"
  mv "$pkgdir/usr/lib/libwx.so" "$pkgdir/usr/lib/lua/5.2/wx.so"

  # desktop file
  install -Dm644 ../distrib/autopackage/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # mime file
  install -Dm644 ../distrib/autopackage/$pkgname.xml \
    "$pkgdir/usr/share/mime/packages/$pkgname.xml"

  # license
  install -Dm 644 ../docs/licence.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
