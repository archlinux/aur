# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libhandy-git
pkgver=1.1.90.r20.gfdbf15c
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones"
url="https://gitlab.gnome.org/GNOME/libhandy"
license=(LGPL)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk3)
makedepends=(git glade gobject-introspection meson vala)
checkdepends=(xorg-server-xvfb)
provides=(libhandy libhandy-1.so)
conflicts=(libhandy)
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
    cd libhandy
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson libhandy build -Dgtk_doc=true -Dexamples=false
    meson compile -C build
}

check() {
    dbus-run-session xvfb-run \
        -s '-screen 0 1920x1080x24 -nolisten local' \
        meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
