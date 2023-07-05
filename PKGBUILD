# Maintainer:
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

_pkgname='libgweather'
pkgname="$_pkgname-git"
pkgver=4.2.0.r27.g93127506
pkgrel=1
pkgdesc='Location and timezone database and weather-lookup library'
url='https://gitlab.gnome.org/GNOME/libgweather'
arch=(x86_64)
license=(LGPL)

depends=(
  'dconf'
  'geocode-glib-2'
  'json-glib'
  'libsoup3'
  'libxml2'
)
makedepends=(
  'gi-docgen'
  'git'
  'gobject-introspection'
  'meson'
  'python-gobject'
  'vala'
)

provides=(
  'libgweather'
  'libgweather-4'
)
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgname" build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  provides+=(
    'libgweather-4.so'
  )

  meson install -C build --destdir "$pkgdir"
}
