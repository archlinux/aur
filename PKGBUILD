# Contributor:  Jan de Groot <jgc@archlinux.org>
# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=gnome-calendar-no-evolution
_pkgname=gnome-calendar
pkgver=3.32.0
pkgrel=1
pkgdesc="Gnome's calender application, now featuring nearly 100% less unnecessary gnome evolution"
url="https://wiki.gnome.org/Apps/Calendar"
arch=(x86_64)
license=(GPL)
depends=(evolution-data-server gsettings-desktop-schemas libdazzle)
makedepends=(python appstream-glib git meson gtk-doc)
optdepends=("evolution: to allow importing .ics files"
            "gnome-control-center: Online services calendar integration")
conflicts=("gnome-calendar")
_commit=f1b5d70be3d1cddb2683346834b49b3c74ed77d7  # tags/3.30.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
        null-icaltime.diff)
sha256sums=('SKIP'
            'c1aa738a4ff275f725d0aa5406312600503b2b59270448a9e6b30b82a924dc27')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../null-icaltime.diff
}

build() {
  arch-meson $_pkgname build \
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