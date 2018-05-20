# Contributor:  Jan de Groot <jgc@archlinux.org>
# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=gnome-calendar-no-evolution
_pkgbase=gnome-calendar
pkgver=3.28.2
pkgrel=1
pkgdesc="Gnome's calender application, now featuring nearly 100% less unnecessary gnome evolution"
url="https://wiki.gnome.org/Apps/Calendar"
arch=("x86_64")
license=("GPL")
depends=("evolution-data-server" "gsettings-desktop-schemas" "gnome-control-center" "libdazzle")
optdepends=("evolution: to allow importing .ics files")
makedepends=("python" "appstream-glib" "git" "meson" "gtk-doc")
conflicts=("gnome-calendar")
groups=("gnome")
_commit="c4d1f984758e77787ef97b71fe2dede8477809c2"  # tags/3.28.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
        "null-icaltime.diff")
sha256sums=("SKIP"
            "c1aa738a4ff275f725d0aa5406312600503b2b59270448a9e6b30b82a924dc27")

pkgver() {
    cd $_pkgbase
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd $_pkgbase
    patch -Np1 -i ../null-icaltime.diff
}

build() {
    arch-meson $_pkgbase build -D gtk_doc=true
    ninja -C build
}

check() {
    cd build
    meson test
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}