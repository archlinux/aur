# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Martin Minka <https://github.com/k2s>
# Contributor: migerh <https://github.com/migerh>
# Contributor: hollunder <murks at tuxfamily dot org>

pkgname=wxlua-svn
pkgver=252
pkgrel=3
pkgdesc="A set of bindings to the wxWidgets library for the Lua programming language - svn version"
arch=('i686' 'x86_64' 'armv7h' 'armv8')
url="http://wxlua.sourceforge.net"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk' 'lua52')
makedepends=('subversion' 'cmake')
provides=('wxlua' 'wxstedit')
conflicts=('wxlua' 'wxstedit')
source=("wxlua::svn+http://svn.code.sf.net/p/${pkgname%-svn}/svn/trunk"
        "wxlstate.patch")
md5sums=('SKIP'
         'd4bdd1ccbb3a33abf4e7e33776811038')

pkgver() {
    cd ${pkgname%-svn}
    local ver="$(svnversion)"
    printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd ${pkgname%-svn}

    sed -i -e 's/Exec=wxluaedit/Exec=wxLuaEdit/' wxLua/distrib/autopackage/wxlua.desktop

    # wxstedit doc folder fix
    sed -i -e 's|doc/|share/&|' wxLua/modules/wxstedit/CMakeLists.txt

    # fix segfault
    cd wxLua
    svn patch "$srcdir/wxlstate.patch"
}

build() {
    cd ${pkgname%-svn}/wxLua/

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config \
        -DwxLua_LUA_INCLUDE_DIR=/usr/include/lua5.2 \
        -DwxLua_LUA_LIBRARY=/usr/lib/liblua.so.5.2 \
        -DwxLua_LUA_LIBRARY_USE_BUILTIN=0 \
        -DwxLua_LUA_LIBRARY_VERSION=5.2 \
        -DwxWidgets_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DwxLuaBind_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DBUILD_SHARED_LIBS=TRUE
    make
}

package() {
    cd ${pkgname%-svn}/wxLua/build
    make DESTDIR="$pkgdir/" install

    # mv lua module
    install -d "$pkgdir/usr/lib/lua/5.2"
    mv "$pkgdir/usr/lib/libwx.so" "$pkgdir/usr/lib/lua/5.2/wx.so"

    cd ..

    install -Dm644 distrib/autopackage/wxlua.desktop \
        "$pkgdir/usr/share/applications/wxlua.desktop"

    install -Dm644 art/wxlualogo.xpm \
        "$pkgdir/usr/share/icons/wxlualogo.xpm"

    install -Dm644 distrib/autopackage/wxlua.xml \
        "$pkgdir/usr/share/mime/packages/wxlua.xml"

    install -Dm 644 docs/licence.txt \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
