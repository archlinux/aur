# Maintainer: Ruben Kelevra <cyrond@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_pkgname=libadwaita
pkgbase=libadwaita-testing
pkgname=(libadwaita-testing libadwaita-testing-docs libadwaita-testing-demos)
pkgver=1.4.1
pkgrel=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita/"
arch=(x86_64)
license=(LGPL)
depends=(gtk4 appstream)
makedepends=(git meson gi-docgen sassc gobject-introspection vala libgtk-4.so)
checkdepends=(weston)
options=(debug)
_commit=b7e835df75cba85eced19ccde3b7d9727c104e24  # tags/1.4.1^0
source=("git+https://gitlab.gnome.org/GNOME/libadwaita.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname
  
  # Support appstream 1.0
  git cherry-pick -n 3e3967d5f69180644519936991cad10136e84ca9
  git cherry-pick -n 282b2a3445296da98b7e438d938bdcf590e00d3f
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
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

  _pick docs usr/share/doc

  _pick demo usr/bin/adwaita-1-demo
  _pick demo usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick demo usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick demo usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml
}

package_libadwaita-testing-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  conflicts=($_pkgname-docs)

  mv docs/* "$pkgdir"
}

package_libadwaita-testing-demos() {
  pkgdesc+=" (demo applications)"
  depends=($_pkgname-testing)
  conflicts=($_pkgname-demos)

  mv demo/* "$pkgdir"
}
