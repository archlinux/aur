# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=libgweather-4-precipitation
pkgname=(
  libgweather-4
  libgweather-4-docs
)
pkgver=4.6.0
pkgrel=1
pkgdesc="Location and timezone database and weather-lookup library"
url="https://gitlab.gnome.org/GNOME/libgweather"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  geocode-glib-2
  glib2
  glibc
  gweather-locations
  json-glib
  libgcc
  libsoup3
  libxml2
)
makedepends=(
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-gobject
  vala
)
checkdepends=(python-pylint)
source=(
  "git+https://gitlab.gnome.org/fluhus/libgweather.git#branch=amit"
)
b2sums=('SKIP')
#validpgpkeys=(
#  53EF3DC3B63E2899271BD26322E8091EEA11BBB7 # Emmanuele Bassi (GNOME) <ebassi@gnome.org>
#)

prepare() {
  cd libgweather
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  arch-meson libgweather build "${meson_options[@]}"
  meson compile -C build
}

check() {
  # Excluding metar because it fails over online data.
  meson test -C build --print-errorlogs --exclude metar
}

package_libgweather-4() {
  provides=(libgweather-4.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libgweather-4-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
