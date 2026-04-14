# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgbase=luagobject
pkgbase=lua-luagobject-git
pkgname=(lua-luagobject-git lua51-luagobject-git lua53-luagobject-git lua54-luagobject-git)
pkgver=0.10.5.r0.g63c8099
pkgrel=1
pkgdesc='Use GObject-based libraries from Lua'
arch=(i686 x86_64)
url='https://github.com/vtrlx/LuaGObject'
license=('custom:MIT')

depends=('glibc' 'glib2' 'libffi' 'gobject-introspection-runtime')
makedepends=('git' 'gobject-introspection' 'lua' 'lua51' 'lua53' 'lua54')

source=('git+https://github.com/vtrlx/LuaGObject.git')
md5sums=('SKIP')

_pkgdir=LuaGObject

pkgver() {
    cd $_pkgdir
    git describe --tags --long | sed 's/-/.r/; s/-/./'
}

prepare() {
    cd $_pkgdir
    cd ..

    cp -a $_pkgdir ${_pkgdir}-51
    cp -a $_pkgdir ${_pkgdir}-53
    cp -a $_pkgdir ${_pkgdir}-54
}

build() {
    make -C $_pkgdir LUA_INCDIR=/usr/include/lua5.5 \
        LUA_CFLAGS="$(pkg-config --cflags lua) -O2"

    make -C ${_pkgdir}-51 LUA_INCDIR=/usr/include/lua5.1 \
        LUA_CFLAGS="$(pkg-config --cflags lua5.1) -O2"

    make -C ${_pkgdir}-53 LUA_INCDIR=/usr/include/lua5.3 \
        LUA_CFLAGS="$(pkg-config --cflags lua5.3) -O2"

    make -C ${_pkgdir}-54 LUA_INCDIR=/usr/include/lua5.4 \
        LUA_CFLAGS="$(pkg-config --cflags lua5.4) -O2"
}

package_lua-luagobject-git() {
    pkgdesc='Use GObject-based libraries from Lua'
    depends+=(lua)
    provides=('lua-luagobject')
    conflicts=('lua-luagobject')

    cd $_pkgdir

    make LUA_LIBDIR=/usr/lib/lua/5.5 \
        LUA_SHAREDIR=/usr/share/lua/5.5 \
        DESTDIR="$pkgdir/" install

    install -Dm755 tools/dump-typelib.lua \
        "$pkgdir/usr/bin/dump-typelib"

    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/* \
        "$pkgdir/usr/share/doc/$pkgname"

    # samples
    install -d "$pkgdir/usr/share/$pkgname/samples/gtk-demo"

    install -Dm644 samples/*.lua \
        "$pkgdir/usr/share/$pkgname/samples"

    install -Dm644 samples/gtk-demo/* \
        "$pkgdir/usr/share/$pkgname/samples/gtk-demo"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-luagobject-git() {
    pkgdesc='Use GObject-based libraries from Lua (Lua 5.1)'
    depends+=(lua51)

    cd ${_pkgdir}-51

    make LUA_LIBDIR=/usr/lib/lua/5.1 \
        LUA_SHAREDIR=/usr/share/lua/5.1 \
        DESTDIR="$pkgdir/" install

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luagobject-git() {
    pkgdesc='Use GObject-based libraries from Lua (Lua 5.3)'
    depends+=(lua53)

    cd ${_pkgdir}-53

    make LUA_LIBDIR=/usr/lib/lua/5.3 \
        LUA_SHAREDIR=/usr/share/lua/5.3 \
        DESTDIR="$pkgdir/" install

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua54-luagobject-git() {
    pkgdesc='Use GObject-based libraries from Lua (Lua 5.4)'
    depends+=(lua54)

    cd ${_pkgdir}-54

    make LUA_LIBDIR=/usr/lib/lua/5.4 \
        LUA_SHAREDIR=/usr/share/lua/5.4 \
        DESTDIR="$pkgdir/" install

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
