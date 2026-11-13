# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgbase=libadwaita-yaru-git
pkgname=(
  libadwaita-yaru-git
  libadwaita-yaru-demos-git
  libadwaita-yaru-docs-git
)
_pkgname=libadwaita-1
pkgver=1.10.0.r257.g2e5902d  # Will be dynamically overwritten by pkgver()
pkgrel=1
epoch=1
pkgdesc="Building blocks for modern adaptive GNOME applications (with Ubuntu patches for improved Yaru theme accent color support)"
url="https://launchpad.net/ubuntu/+source/libadwaita-1/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  fribidi
  glib2
  glibc
  graphene
  gtk4
  ministream
  pango
)
makedepends=(
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  libgtk-4.so
  meson
  sassc
  vala
)
checkdepends=(weston)
source=("git+https://git.launchpad.net/ubuntu/+source/libadwaita-1#branch=applied/ubuntu/devel")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  local _uver=$(head -n1 debian/changelog | grep -oP '\(\K[^-]+')
  local _rev=$(git rev-list --count HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)
  echo "${_uver}.r${_rev}.g${_hash}"
}

prepare() {
  cd $_pkgname

  # Document the Ubuntu-added brown accent color enum member
  sed -i '/@ADW_ACCENT_COLOR_SLATE:/a \
 * @ADW_ACCENT_COLOR_BROWN: The brown accent color (Warty Brown) for improved Yaru theme support. Added by Ubuntu patches.' src/adw-accent-color.c
}

build() {
  local meson_options=(
    -D documentation=true
    -D tests=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() (
  # Isolate the tests from the builder's desktop configuration: a user stylesheet such as
  # ~/.config/gtk-4.0/gtk.css (e.g. one importing a Yaru resource that is not available here)
  # or GTK_THEME makes GTK emit warnings, which are fatal in the test suite (G_DEBUG=fatal-warnings).
  unset GTK_THEME GTK_DEBUG GTK_PATH GTK_MODULES GDK_BACKEND DISPLAY
  export HOME="$PWD/test-home"
  export XDG_CONFIG_HOME="$HOME/.config" XDG_DATA_HOME="$HOME/.local/share" XDG_CACHE_HOME="$HOME/.cache"
  mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_CACHE_HOME"

  export XDG_RUNTIME_DIR="$PWD/runtime-dir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  export WAYLAND_DISPLAY=wl-$pkgbase-$RANDOM
  weston --backend=headless --socket=$WAYLAND_DISPLAY --idle-time=0 &
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

package_libadwaita-yaru-git() {
  provides=(
    libadwaita
    libadwaita-1.so
  )
  conflicts=(libadwaita)
  depends+=(libgtk-4.so)
  optdepends=(
    'yaru-gtk-theme: for full Yaru accent color experience'
    'yaru-icon-theme: recommended icons'
  )

  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd "$pkgdir"

  _pick demo usr/bin/adwaita-1-demo
  _pick demo usr/share/applications/org.gnome.Adwaita1.Demo.desktop
  _pick demo usr/share/icons/hicolor/*/apps/org.gnome.Adwaita1.Demo[-.]*
  _pick demo usr/share/metainfo/org.gnome.Adwaita1.Demo.metainfo.xml

  _pick docs usr/share/doc
}

package_libadwaita-yaru-demos-git() {
  pkgdesc+=" (demo applications)"
  provides=(libadwaita-demos)
  conflicts=(libadwaita-demos)
  depends=(
    glib2
    glibc
    gtk4
    hicolor-icon-theme
    libadwaita-yaru-git
  )
  optdepends=(
    'yaru-gtk-theme: for full Yaru accent color experience'
    'yaru-icon-theme: recommended icons'
  )

  mv demo/* "$pkgdir"
}

package_libadwaita-yaru-docs-git() {
  pkgdesc+=" (documentation)"
  provides=(libadwaita-docs)
  conflicts=(libadwaita-docs)
  depends=()
  arch=(any)

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
