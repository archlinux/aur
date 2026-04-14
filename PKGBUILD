# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgbase=luagobject
pkgbase=lua-luagobject-git
pkgname=$pkgbase
pkgver=0.10.5.r0.g63c8099
pkgrel=1
pkgdesc='Use GObject-based libraries from Lua'
arch=(i686 x86_64)
url='https://github.com/vtrlx/LuaGObject'
license=('custom:MIT')
depends=('glibc' 'glib2' 'libffi' 'lua' 'gobject-introspection-runtime')
makedepends=('git' 'gobject-introspection')
replaces=('lgi' 'lua-lgi')
conflicts=('lgi' 'lua-lgi')
provides=('lua-luagobject')
source=('git+https://github.com/vtrlx/LuaGObject.git')
md5sums=('SKIP')
_LUA_VER=5.5
_pkgdir=LuaGObject

pkgver() {
    cd $_pkgdir
    git describe --tags --long | sed 's/-/.r/; s/-/./'
}

build() {
    cd $_pkgdir
    make LUA_INCDIR=/usr/include/lua${_LUA_VER}/ \
        LUA_CFLAGS="$(pkg-config --cflags lua${_LUA_VER}) -O2"
}

package() {
    cd $_pkgdir
    make \
        LUA_LIBDIR=/usr/lib/lua/${_LUA_VER} \
        LUA_SHAREDIR=/usr/share/lua/${_LUA_VER} \
        DESTDIR="$pkgdir/" install

    # dump typelib tool
    install -Dm755 tools/dump-typelib.lua \
        "$pkgdir/usr/bin/dump-typelib"

    # docs
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 docs/* \
        "$pkgdir/usr/share/doc/$pkgname"

    # samples
    install -d "$pkgdir/usr/share/$pkgname/samples/gtk-demo"
    install -Dm644 samples/*.lua \
        "$pkgdir/usr/share/$pkgname/samples"
    install -Dm644 samples/gtk-demo/* \
        "$pkgdir/usr/share/$pkgname/samples/gtk-demo"

    # license
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
