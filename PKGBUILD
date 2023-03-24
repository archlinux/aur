# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.18.1
pkgrel=3
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=(x86_64)
license=(GPL)
depends=(
  gcr
  libgoa
  libsoup
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  meson
  vala
)
_commit=eb7db048e5445ad567817dced344c47a20c6ea6b  # tags/0.18.1^0
source=("git+https://gitlab.gnome.org/GNOME/libgdata.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd libgdata
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

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
