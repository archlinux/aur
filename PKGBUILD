# Maintainer: Jimmy <your-email@example.com>
pkgname=somewm-git
pkgver=0.5.0.r91.gc9921b6
pkgrel=1
pkgdesc="AwesomeWM ported to Wayland - 100% Lua API compatible"
arch=('x86_64')
url="https://github.com/trip-zip/somewm"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'libdisplay-info'
    'libdrm'
    'libinput'
    'libliftoff'
    'libxcb'
    'libxkbcommon'
    'lua51-lgi'
    'luajit'
    'pango'
    'pixman'
    'seatd'
    'vulkan-icd-loader'
    'wayland'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'git'
    'glslang'
    'hwdata'
    'meson'
    'ninja'
    'vulkan-headers'
    'wayland-protocols'
    'xcb-util'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: X11 application support'
)
provides=('somewm')
conflicts=('somewm')
source=("${pkgname}::git+https://github.com/trip-zip/somewm.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    arch-meson build \
        --wrap-mode=default \
        -Db_sanitize=none \
        -Dwerror=false
    meson compile -C build
}

package() {
    cd "$pkgname"
    meson install -C build --destdir "$pkgdir" --skip-subprojects wlroots
}
