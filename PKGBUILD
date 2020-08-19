pkgname=gnome-color-manager-git
_pkgname=gnome-color-manager
pkgver=3.36.0+6+g589d24a4
pkgrel=1
pkgdesc="GNOME Color Profile Tools"
url="https://gitlab.gnome.org/GNOME/gnome-color-manager"
arch=(x86_64)
license=(GPL2)
depends=('shared-color-targets' 'colord' 'gtk3' 'lcms2')
makedepends=('yelp-tools' 'git' 'appstream-glib' 'meson' 'docbook-utils' 'docbook-sgml' 'perl-sgmls')
checkdepends=('xorg-server-xvfb')
provides=('gnome-color-manager')
conflicts=('gnome-color-manager')
source=("git+https://gitlab.gnome.org/GNOME/gnome-color-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_COLOR_MANAGER_//;s/_/./g;s/-/+/g'
}

build() {
  arch-meson $_pkgname build
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

# vim:set sw=2 et:
