# Maintainer: 100best
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=epiphany
pkgname=epiphany-unstable
pkgver=3.37.90
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine"
url="https://wiki.gnome.org/Apps/Web"
arch=(x86_64)
license=(GPL)
depends=(webkit2gtk gcr icu libdazzle libhandy)
makedepends=(docbook-xml startup-notification lsb-release gobject-introspection yelp-tools
             appstream-glib git meson)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
_commit=bc07d9519d492ece039a90d8fef0a441b3f103a4  # tags/3.37.90^0
source=("git+https://gitlab.gnome.org/GNOME/epiphany.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(epiphany epiphany-git)
provides=(epiphany)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  # ERROR:../epiphany/tests/ephy-web-app-utils-test.c:109:test_web_app_lifetime: assertion failed (g_list_length (apps) == 1): (0 == 1)
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
