# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Albert Kugel (Lastebil) <lastebilaur@trebel.org>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Eric Forgeot <http://ifiction.free.fr>
# Contributor: favardin

pkgname=wxlua
pkgver=3.0.0.8
pkgrel=2
pkgdesc="Lua bindings for wxWidgets (Lua 5.3 compatible fork)"
arch=('i686' 'x86_64')
url="https://github.com/pkulchenko/$pkgname"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk2' 'lua')
optdepends=('webkit2gtk')
makedepends=('cmake')
checkdepends=('cppcheck')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pkulchenko/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('85d5182eec6e7cbb8428b9c144ef7fbe364f4fed6411aafcead648893e5b6fa0')

build() {
    cd "$pkgname-$pkgver/wxLua/build"
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
    cd "$pkgname-$pkgver/wxLua"
    pushd "build"
    make DESTDIR="$pkgdir/" install
    rm -f "$pkgdir"/usr/bin/lua{,c}
    popd

    install -d "$pkgdir/usr/lib/lua/5.3"
    mv "$pkgdir"/usr/lib/{lib,lua/5.3/}wx.so

    install -Dm 644 docs/licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    pushd distrib/autopackage
    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$pkgname.xml" -t "$pkgdir/usr/share/mime/packages/"
}
