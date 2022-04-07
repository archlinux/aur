# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

pkgname=libgweather-git
_pkgname=libgweather
pkgver=4.0.0.r8.g6a1f91a6
pkgrel=1
pkgdesc="Location and timezone database and weather-lookup library"
url="https://wiki.gnome.org/Projects/LibGWeather"
arch=(x86_64)
license=(LGPL)
depends=(libsoup gtk3 geocode-glib dconf)
makedepends=(gobject-introspection vala git gi-docgen glade meson python-gobject)
provides=(libgweather libgweather-4)
conflicts=(libgweather libgweather-4)
source=("git+https://gitlab.gnome.org/GNOME/libgweather.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
  meson compile -C build
}

check() {
  # Test fails without fr_FR.UTF-8 locale
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
