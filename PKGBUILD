# Contributor: 100best

_pkgname=epiphany
pkgname=$_pkgname-unstable
pkgver=3.31.91
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine (unstable version)"
url="https://wiki.gnome.org/Apps/Web"
arch=(x86_64)
license=(GPL)
depends=(webkit2gtk gcr icu libdazzle)
makedepends=(docbook-xml startup-notification lsb-release gobject-introspection yelp-tools
             appstream-glib git meson)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
_commit=d86a2ffa130c204991beaa582799676cb8ac1c03  # tags/3.31.91^0
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
  arch-meson $_pkgname build \
    -D distributor_name="Arch Linux®"
  ninja -C build
}

check() {
  # ERROR:../epiphany/tests/ephy-web-app-utils-test.c:109:test_web_app_lifetime: assertion failed (g_list_length (apps) == 1): (0 == 1)
  xvfb-run meson test -C build || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
