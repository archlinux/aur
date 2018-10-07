# Contributor:  Jan de Groot <jgc@archlinux.org>
# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=gnome-calendar-no-evolution
_pkgbase=gnome-calendar
pkgver=3.30.0
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
_commit="63ed4c48c84291ca70c747d6078090f8263088bf"  # tags/3.28.2^0
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
  arch-meson $_pkgbase build \
    --buildtype=debugoptimized \
    -D documentation=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}