# Based on "upstream" by
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-no_deadkeys_underline
pkgver=3.24.35
pkgrel=2
epoch=1
pkgdesc="Like gtk3 in extra but with a patch to disable dead keys having an underline below them while typing and also without tracker3"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(
  adwaita-icon-theme
  at-spi2-atk
  atk
  cairo
  cantarell-fonts
  dconf
  desktop-file-utils
  fribidi
  gdk-pixbuf2
  gtk-update-icon-cache
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libepoxy
  librsvg
  libxcomposite
  libxcursor
  libxdamage
  libxi
  libxinerama
  libxkbcommon
  libxrandr
  mesa
  pango
  shared-mime-info
  wayland
)
makedepends=(
  git
  glib2-docs
  gobject-introspection
  gtk-doc
  meson
  sassc
  wayland-protocols
)
optdepends=('evince: Default print preview command')
provides=(gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so gtk3)
conflicts=(gtk3-print-backends gtk3)
replaces=("gtk3-print-backends<=3.22.26-1")
license=(LGPL)
options=(debug)
install=gtk3.install
_commit=14cf55f98ddd71ad3f91487eda1c7f14d67de119  # tags/3.24.35^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        no_deadkeys_underline.patch
        )
sha256sums=('SKIP'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            'SKIP'
            )

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk
  patch -p1 < ../no_deadkeys_underline.patch

  # Crash in gnome-screenshot
  # https://gitlab.gnome.org/GNOME/gtk/-/issues/4456
  git cherry-pick -n e413f5c43259a22269aa1e75767dd545e10119b5

  # https://bugs.archlinux.org/task/76651
  # https://gitlab.gnome.org/GNOME/gtk/-/issues/5365
  git cherry-pick -n 3f1536632f682c355d0c3abe1afc80cf975c2cce
}

build() {
  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D tracker3=false
    -D colord=yes
    -D gtk_doc=true
    -D introspection=true
    -D man=true
  )

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson gtk build "${meson_options[@]}"
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

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  cd "$pkgdir"

  rm usr/bin/gtk-update-icon-cache
  rm usr/share/man/man1/gtk-update-icon-cache.1

  _pick docs usr/share/gtk-doc

  _pick demo usr/bin/gtk3-{demo,demo-application,icon-browser,widget-factory}
  _pick demo usr/share/applications/gtk3-{demo,icon-browser,widget-factory}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.{Demo,exampleapp}.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/gtk3-{demo,widget-factory}[-.]*
  _pick demo usr/share/man/man1/gtk3-{demo,demo-application,icon-browser,widget-factory}.1
}

# vim:set ts=2 sw=2 et:
