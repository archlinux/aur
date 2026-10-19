# Maintainer: Jimmy <jimmy@somewm.org>
pkgname=somewm-git
pkgver=2.0.1.r67.g54cda57
pkgrel=1
pkgdesc="AwesomeWM configs on a Wayland compositor"
arch=('x86_64')
url="https://github.com/trip-zip/somewm"
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'lcms2'
    'libdisplay-info'
    'libffi'
    'libinput'
    'libliftoff'
    'librsvg'
    'libxcb'
    'libxkbcommon'
    'lua51-lgi'
    'luajit'
    'mesa'
    'pam'
    'pango'
    'seatd'
    'wayland'
    'xcb-util-errors'
    'xcb-util-renderutil'
    'xcb-util-wm'
)
makedepends=(
    'git'
    'hwdata'
    'meson'
    'ninja'
    'wayland-protocols'
    'xorg-xwayland'
)
optdepends=(
    'xorg-xwayland: X11 application support'
)
provides=('somewm')
conflicts=('somewm')
source=(
    "${pkgname}::git+https://github.com/trip-zip/somewm.git"
    'wlroots-0.20.2.tar.gz::https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.20.2/downloads/wlroots-0.20.2.tar.gz'
)
sha256sums=(
    'SKIP'
    '80c567d2ed4efb2cfa6b077f22c7a710d9c78ba4e185a75e8694001114af0733'
)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p "$srcdir/$pkgname/subprojects/packagecache"
    ln -sf "$srcdir/wlroots-0.20.2.tar.gz" \
        "$srcdir/$pkgname/subprojects/packagecache/wlroots-0.20.2.tar.gz"
}

build() {
    cd "$pkgname"
    arch-meson build \
        -Db_sanitize=none \
        -Dwerror=false
    meson compile -C build
}

package() {
    cd "$pkgname"
    meson install -C build --destdir "$pkgdir" --skip-subprojects
}
