# Maintainer: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

_pkgname="libgweather"
pkgname="$_pkgname-git"
pkgver=4.2.0.r26.g9dd18c95
pkgrel=1
pkgdesc="Location and timezone database and weather-lookup library"
url="https://wiki.gnome.org/Projects/LibGWeather"
arch=(x86_64)
license=(LGPL)
depends=(
  'geocode-glib-2'
  'dconf'
)
makedepends=(
  'gobject-introspection'
  'vala'
  'git'
  'gi-docgen'
  'glade'
  'meson'
  'python-gobject'
)
provides=(
  'libgweather'
  'libgweather-4')
conflicts=(${provides[@]})
source=("git+https://gitlab.gnome.org/GNOME/libgweather.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  meson compile -C build
}

check() {
  # Test fails without fr_FR.UTF-8 locale
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
