# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Marco Melorio <marco.melorio@protonmail.com>
# Contributor: Bakasura <bakasura@protonmail.ch>
# Contributor: mazharhussain <realmazharhussain@gmail.com>
# Contributor: Herman Rimm <herman_rimm@pm.me>
# Contributor: huyz

_pkgname="libadwaita"
pkgbase=libadwaita-git
pkgname=(libadwaita-git libadwaita-docs-git libadwaita-demos-git)
pkgver=1.6.rc.r16.g6e98d61
pkgrel=2
pkgdesc="Building blocks for modern adaptive GNOME applications"
url="https://gnome.pages.gitlab.gnome.org/libadwaita"
arch=(x86_64 i686 pentium4 aarch64 armv7h)
license=(LGPL-2.1-or-later)
depends=(
  appstream
  fribidi
  glib2
  glibc
  graphene
  gtk4-git
  pango
)
makedepends=(
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  sassc
  vala
)
checkdepends=(weston)

source=(git+https://gitlab.gnome.org/GNOME/libadwaita.git)
sha256sums=(SKIP)

pkgver() {
  cd "libadwaita"
  #git describe --tags | sed 's/-/+/g'
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  arch-meson libadwaita build "${meson_options[@]}"
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

package_libadwaita-git() {
  depends+=(libgtk-4.so)
  provides=(libadwaita)
  conflicts=(libadwaita)
  provides+=(libadwaita-1.so)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick demo usr/bin/adwaita-1-demo
  _pick demo usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick demo usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick demo usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml

  _pick docs usr/share/doc
}

package_libadwaita-demos-git() {
  pkgdesc+=" (demo applications)"
  depends=(
    glib2
    glibc
    gtk4
    hicolor-icon-theme
    libadwaita
  )
  provides=(libadwaita-demos)
  conflicts=(libadwaita-demos)
  mv demo/* "$pkgdir"
}

package_libadwaita-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=(libadwaita-docs)
  conflicts=(libadwaita-docs)
  mv docs/* "$pkgdir"
}
