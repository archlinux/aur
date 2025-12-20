# Maintainer: Andrew Kozik <andrewkoz at live dot com>

pkgbase=libadwaita-yaru-git
pkgname=(
  libadwaita-yaru-git
  libadwaita-yaru-demos-git
  libadwaita-yaru-docs-git
)
_pkgname=libadwaita-1
pkgver=1.8.0.r221.gd2c5713  # Will be dynamically overwritten by pkgver()
pkgrel=1
epoch=1
pkgdesc="Building blocks for modern adaptive GNOME applications (with Ubuntu patches for improved Yaru theme accent color support)"
url="https://launchpad.net/ubuntu/+source/libadwaita-1/"
arch=(x86_64)
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
  git
  glib2-devel
  gobject-introspection
  meson
  sassc
  vala
)
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
    -D gtk_doc=true
    -Dtests=false   # Disable tests due to unreliable Yaru resource loading in test environment
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

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

  meson install -C build --destdir "$pkgdir"

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
