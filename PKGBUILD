# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Albert Kugel (Lastebil) <lastebilaur@trebel.org>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Eric Forgeot <http://ifiction.free.fr>
# Contributor: favardin

pkgname=wxlua
pkgver=3.0.0.9
pkgrel=2
pkgdesc="Lua bindings for wxWidgets (Lua 5.3+ compatible fork)"
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/$pkgname"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk2' 'lua')
optdepends=('webkit2gtk')
makedepends=('cmake')
checkdepends=('cppcheck')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulchenko/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('28c54297824d6691273a6470f0330a5c6dd6c977e30fb533aaf3350d995ec994')

build() {
    cd "$pkgname-$pkgver/wxLua"
    cmake -S . -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DwxLua_LUA_LIBRARY_USE_BUILTIN=FALSE \
        -DwxLua_LUA_LIBRARY_BUILD_SHARED=TRUE \
        -DwxLua_LUA_LIBRARY="/usr/lib/liblua.so" \
        -DwxLua_LUA_INCLUDE_DIR="/usr/include" \
        -DCMAKE_BUILD_TYPE=Release \
        -DwxWidgets_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DwxLuaBind_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DBUILD_SHARED_LIBS=TRUE
    make -C build
}

package() {
    cd "$pkgname-$pkgver/wxLua"
    make -C build DESTDIR="$pkgdir/" install
    rm -f "$pkgdir"/usr/bin/lua{,c}

    install -d "$pkgdir/usr/lib/lua/5.4"
    mv "$pkgdir/usr/lib/"{lib,lua/5.4/}wx.so

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" docs/licence.txt
    install -Dm644 -t "$pkgdir/usr/share/icons/" art/wxlualogo.xpm

    pushd distrib/autopackage
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$pkgname.xml" -t "$pkgdir/usr/share/mime/packages/"
}
