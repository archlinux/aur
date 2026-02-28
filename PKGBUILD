# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.18.1
pkgrel=5
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcr
  glib2
  glibc
  json-glib
  libgcc
  libgoa
  libsoup
  libxml2
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  vala
)
source=("git+https://gitlab.gnome.org/Archive/libgdata.git#tag=$pkgver")
b2sums=('6d1304109657a56640404b491fc712b22e673a3ec96bcff7198735e072973bca58f806f45f4de44eec840f2dae7f6d7e85b2eaa61f71a988e827ec1c468aaad3')

prepare() {
  cd libgdata
}

build() {
  local meson_options=(
    # needs uhttpmock with libsoup 2
    -D always_build_tests=false

    -D gtk_doc=true
    -D man=true
  )

  arch-meson libgdata build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libsoup-2.4.so)
  provides+=(libgdata.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
