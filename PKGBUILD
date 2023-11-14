# Maintainer:
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

_pkgname="libgweather"
pkgname="$_pkgname-git"
pkgver=4.4.0.r8.g57a116bf
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

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgsrc" build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package() {
  provides+=(
    "libgweather-4=${pkgver%%.r*}"
    "libgweather-4.so"
  )
  conflicts=(
    'libgweather-4'
  )

  meson install -C build --destdir "${pkgdir:?}"
}
