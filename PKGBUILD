# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>

_pkgname="libadapta"
pkgbase=libadapta
pkgname=(libadapta libadapta-docs libadapta-demos)
pkgver=1.5.0
pkgrel=4
pkgdesc="libAdapta is libAdwaita with theme support and a few extra."
url="https://github.com/xapp-project/libadapta"
arch=(x86_64 i686 pentium4 aarch64 armv7h)
license=(LGPL-2.1-or-later)
depends=(
  appstream
  fribidi
  glib2
  glibc
  graphene
  gtk4
  pango
)
makedepends=(
  gi-docgen
  ninja
  git
  glib2-devel
  libadwaita
  libgtk-4.so
  gobject-introspection
  meson
  sassc
  vala
)
checkdepends=(weston)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xapp-project/libadapta/archive/""${pkgver}.tar.gz")
sha256sums=('725daa7433497b3ae541ba72fe7a075ec1a99693c5598a6c56706f0c3a1f26c9')


build() {
  local meson_options=(
    -D gtk_doc=true
  )

  arch-meson libadapta-1.5.0 build "${meson_options[@]}"
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

package_libadapta() {
  depends+=(libgtk-4.so)
  provides=(libAdapta-1.so)

  meson install -C build --destdir "$pkgdir"



  cd "$pkgdir"

  _pick demo usr/bin/adapta-1-demo
  _pick demo usr/share/applications/org.gnome.Adapta1.Demo.desktop
  _pick demo usr/share/icons/hicolor/*/apps/org.gnome.Adapta1.Demo[-.]*
  _pick demo usr/share/metainfo/org.gnome.Adapta1.Demo.metainfo.xml

  _pick docs usr/share/doc
}

package_libadapta-demos() {
  pkgdesc+=" (demo applications)"
  depends=(
    glib2
    glibc
    gtk4
    hicolor-icon-theme
    libadwaita
  )
  mv demo/* "$pkgdir"
}

package_libadapta-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}
