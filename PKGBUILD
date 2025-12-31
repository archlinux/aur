# Based on "upstream" by
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-no_deadkeys_underline
pkgver=3.24.51
pkgrel=1
epoch=1
pkgdesc="Like gtk3 in extra but with a patch to disable dead keys having an underline below them while typing and also without tracker3"
url="https://www.gtk.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  adwaita-fonts
  adwaita-icon-theme
  at-spi2-core
  cairo
  dconf
  desktop-file-utils
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  glibc
  harfbuzz
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libegl
  libepoxy
  libgl
  librsvg
  libx11
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxrandr
  libxrender
  pango
  shared-mime-info
  tinysparql
  wayland
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  hicolor-icon-theme
  meson
  sassc
  wayland-protocols
)
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#tag=$pkgver"
  gtk-query-immodules-3.0.hook
  0001-Allow-disabling-legacy-Tracker-search.patch
  no_deadkeys_underline.patch
)
b2sums=('06f5dcfe6cf693d4e0da0964715e7ea07ab8940eea21b7fba28615c6d9ecdd8533e51e061b57e6b4f5b9401041adeb52fd81fc856fa79dc5bf8e5a4058d9fa92'
        '8e6a3906126749c6d853f582e3802254cdbba099c6af7190ad576eff6ea5425404a72b1b36950a87e3afdac82295cfe246003172c3e0341a73bd931a36f3b407'
        'cb50a01255877f5c978844e6a15d929dd28377e87f9c78e52ef63ac54cbe3f0d165994d7e716dd787a4f804255afa1adcb1d5fc7ae0ae1439f281e96c76eff2b'
        SKIP)

prepare() {
  cd gtk

  # Don't try to use the old Tracker
  git apply -3 ../0001-Allow-disabling-legacy-Tracker-search.patch

  patch -p1 < ../no_deadkeys_underline.patch
}

build() {
  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D colord=yes
    -D gtk_doc=true
    -D introspection=true
    -D man=true
    -D tracker=false
    -D tracker3=true
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
  depends+=(gtk-update-icon-cache)
  optdepends=(
    'evince: Default print preview command'
  )
  provides=(
    gtk3-print-backends
    libgailutil-3.so
    libgdk-3.so
    libgtk-3.so
    gtk3
  )
  conflicts=(gtk3-print-backends gtk3)
  replaces=("gtk3-print-backends<=3.22.26-1")
  install=gtk3.install

  meson install -C build --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Adwaita Sans 11
END

  install -Dm644 gtk-query-immodules-3.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

  cd "$pkgdir"

  _pick demo usr/bin/gtk3-{demo,demo-application,icon-browser,widget-factory}
  _pick demo usr/share/applications/gtk3-{demo,icon-browser,widget-factory}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.{Demo,exampleapp}.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/gtk3-{demo,widget-factory}[-.]*
  _pick demo usr/share/man/man1/gtk3-{demo,demo-application,icon-browser,widget-factory}.1

  _pick docs usr/share/gtk-doc

  # Built by GTK 4, shared with GTK 3
  rm usr/bin/gtk-update-icon-cache
  rm usr/share/man/man1/gtk-update-icon-cache.1
}


# vim:set sw=2 sts=-1 et:
