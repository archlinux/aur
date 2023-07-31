# Maintainer:
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>

_pkgbase="libgweather"
pkgbase="$_pkgbase-git"

case "${_srcinfo::1}" in
  't'|'y'|1)
    pkgname=(
      "libgweather-git"
      "libgweather-4-git"
    )
    ;;
  *)
    pkgname=(
      "libgweather-4-git"
    )
    ;;
esac

pkgver=4.2.0.r28.g1c3dfe68
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

source=("$_pkgbase"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_pkgbase" build -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || true
}

package_libgweather-git() {
  pkgdesc='metapackage to track broken dependencies'
  depends=('libgweather-4-git')

  provides+=(
    'libgweather'
  )
  conflicts=(${provides[@]})
}

package_libgweather-4-git() {
  provides+=(
    'libgweather-4'
    'libgweather-4.so'
  )
  conflicts=(
    'libgweather-4'
  )

  meson install -C build --destdir "$pkgdir"
}
