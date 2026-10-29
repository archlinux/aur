# Maintainer: Jimmy <jimmy@somewm.org>
pkgname=somewm
pkgver=1.4.7
pkgrel=1
pkgdesc="AwesomeWM ported to Wayland - 100% Lua API compatible"
arch=('x86_64')
url="https://github.com/trip-zip/somewm"
license=('GPL-3.0-or-later')

# Lua version. Default is LuaJIT. To build against another Lua, install
# its lgi package first, then set SOMEWM_LUA when you install:
#   sudo pacman -S lua54-lgi
#   SOMEWM_LUA=5.4 yay -S somewm
case "${SOMEWM_LUA:-luajit}" in
    luajit) _lua=('luajit' 'lua51-lgi'); _lua_pkg=luajit ;;
    5.1)    _lua=('lua51' 'lua51-lgi');  _lua_pkg=lua5.1 ;;
    5.3)    _lua=('lua53' 'lua53-lgi');  _lua_pkg=lua5.3 ;;
    5.4)    _lua=('lua54' 'lua54-lgi');  _lua_pkg=lua5.4 ;;
    5.5)    _lua=('lua' 'lua-lgi');      _lua_pkg=lua5.5 ;;
    *) echo "SOMEWM_LUA must be luajit, 5.1, 5.3, 5.4 or 5.5" >&2; exit 1 ;;
esac
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'libinput'
    'libxcb'
    'libxkbcommon'
    "${_lua[@]}"
    'pam'
    'pango'
    'wayland'
    'wlroots0.20'
    'xcb-util-wm'
)
makedepends=(
    'meson'
    'ninja'
    'wayland-protocols'
)
optdepends=(
    'xorg-xwayland: X11 application support'
)
provides=('somewm')
conflicts=('somewm-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trip-zip/somewm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9e2b7f2e3f23c4c2ac96fdfe838365dc1f5f6674440376bf932a3c403b17a3d')

build() {
    cd "$pkgname-$pkgver"
    arch-meson build \
        --wrap-mode=default \
        -Db_sanitize=none \
        -Dwerror=false \
        -Dlua_pkg="$_lua_pkg"
    meson compile -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir "$pkgdir" --skip-subprojects
}
