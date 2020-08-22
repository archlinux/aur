# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Martin Minka <https://github.com/k2s>
# Contributor: migerh <https://github.com/migerh>
# Contributor: hollunder <murks at tuxfamily dot org>

pkgname=wxlua-git
_pkgname=${pkgname/%-git}
pkgver=3.0.0.8.r22.gdfd9963
pkgrel=1
epoch=1
pkgdesc="Lua bindings for wxWidgets (Lua 5.3 compatible fork)"
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/$_pkgname"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk2' 'lua')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
checkdepends=('cppcheck')
source=("git://github.com/pkulchenko/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --tags --match "v[0-9\.]*" origin/master | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}/wxLua/build"
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxLua_LUA_LIBRARY_USE_BUILTIN=FALSE \
        -DwxLua_LUA_LIBRARY_BUILD_SHARED=TRUE \
        -DwxLua_LUA_LIBRARY="/usr/lib/liblua.so" \
        -DwxLua_LUA_INCLUDE_DIR="/usr/include/" \
        -DCMAKE_BUILD_TYPE=Release \
        -DwxWidgets_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DwxLuaBind_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DBUILD_SHARED_LIBS=TRUE
    make
}

package() {
    cd "${pkgname%-git}/wxLua/build"
    make DESTDIR="$pkgdir/" install
    rm -f "$pkgdir"/usr/bin/lua{,c}

    install -d "$pkgdir/usr/lib/lua/5.4"
    mv "$pkgdir/usr/lib/libwx.so" "$pkgdir/usr/lib/lua/5.4/wx.so"

    pushd ..

    install -Dm644 distrib/autopackage/wxlua.desktop \
        "$pkgdir/usr/share/applications/wxlua.desktop"

    install -Dm644 art/wxlualogo.xpm \
        "$pkgdir/usr/share/icons/wxlualogo.xpm"

    install -Dm644 distrib/autopackage/wxlua.xml \
        "$pkgdir/usr/share/mime/packages/wxlua.xml"

    install -Dm 644 docs/licence.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
