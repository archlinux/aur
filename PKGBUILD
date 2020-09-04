# Maintainer: Mufeed Ali <fushinari@protonmail.com>

pkgname=libhandy1
_author=GNOME
_gitname=libhandy
pkgver=0.91.0
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones (1.0, can be installed alongside 0.0)"
url="https://gitlab.gnome.org/GNOME/libhandy"
license=(LGPL2.1)
arch=(i686 x86_64 armv7h aarch64)
depends=(gtk3)
makedepends=(git glade gobject-introspection meson vala)
checkdepends=(xorg-server-xvfb)
provides=(libhandy-1.so)
conflicts=(libhandy-git)
source=("https://gitlab.gnome.org/$_author/$_gitname/-/archive/$pkgver/$_gitname-$pkgver.tar.gz")
sha256sums=('e4793db03374c70a6bab34044d00b46d5cbb3a0ff85d71d7cb732291769df2aa')

build() {
    arch-meson $_gitname-$pkgver build -Dgtk_doc=true -Dexamples=false
    ninja -C build
}

check() {
    dbus-run-session xvfb-run \
        -s '-screen 0 1920x1080x24 -nolisten local' \
        meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
