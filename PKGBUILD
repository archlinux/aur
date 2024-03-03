# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Ruben Kelevra <cyrond@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>

_pkgname=libadwaita
pkgbase=libadwaita-testing
pkgname=(
  libadwaita-testing
  libadwaita-testing-demos
  libadwaita-testing-docs
)
pkgver=1.4.4
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  appstream
  fribidi
  glib2
  graphene
  gtk4
  pango
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  sassc
  vala
)
checkdepends=(weston)
_commit=f5a021d0ab0eb98455529dd8c055c45897c891df  # tags/1.4.4^0
source=("git+https://gitlab.gnome.org/GNOME/libadwaita.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -r 's/_/./;s/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libadwaita-testing() {
  depends+=(libgtk-4.so)
  provides+=($_pkgname=1:$pkgver libadwaita-1.so)
  conflicts=($_pkgname)
  
  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick demo usr/bin/adwaita-1-demo
  _pick demo usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick demo usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick demo usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml

  _pick docs usr/share/doc
}

package_libadwaita-testing-demos() {
  pkgdesc+=" (demo applications)"
  depends=(
    glib2
    gtk4
    hicolor-icon-theme
    $_pkgname-testing
  )
  conflicts=($_pkgname-demos)
  mv demo/* "$pkgdir"
}

package_libadwaita-testing-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  conflicts=($_pkgname-docs)
  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
