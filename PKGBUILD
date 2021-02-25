# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

pkgname=libgweather-git
_pkgname=libgweather
pkgver=40.beta.r12.g7a94017f
pkgrel=1
pkgdesc="Location and timezone database and weather-lookup library"
url="https://wiki.gnome.org/Projects/LibGWeather"
arch=(x86_64)
license=(LGPL)
depends=(libsoup gtk3 geocode-glib dconf)
makedepends=(python-gobject gobject-introspection vala git gtk-doc glade meson)
provides=(libgweather-3.so libgweather)
conflicts=(libgweather)
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
