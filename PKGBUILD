# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=libadwaita-git-pkgs
_pkgname=libadwaita
pkgname=(libadwaita-docs-git libadwaita-demos-git)
pkgver=1.0.1.3.gfddc56f7
pkgrel=1
epoch=1
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita/"
arch=(x86_64)
license=(LGPL)
depends=(gtk4)
makedepends=(git meson gi-docgen sassc gobject-introspection vala)
checkdepends=(weston)
source=("git+https://gitlab.gnome.org/GNOME/libadwaita.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/\./g'
}

prepare() {
  cd $_pkgname
}

build() {
  arch-meson $srcdir/$_pkgname build -D gtk_doc=true
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

package_libadwaita-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(libadwaita-docs)
  conflicts=(libadwaita-docs)
  mv docs/* "$pkgdir"
}

package_libadwaita-demos-git() {
  pkgdesc+=" (demo applications)"
  depends=(libadwaita)
  provides=(libadwaita-demos)
  conflicts=(libadwaita-demos)
  mv demo/* "$pkgdir"
}

# vim:set sw=2 et:
