# Maintainer:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Syboxez Blank <@Syboxez:matrix.org>

_gitname="gtk"
_pkgbase="gtk4"
_pkgname=(
  gtk4
  gtk4-demos
  gtk4-docs
  gtk-update-icon-cache
)

pkgbase="$_pkgbase-git"
for i in ${_pkgname[@]} ; do
  pkgname+=("$i-git")
done

pkgver=4.11.4.r25.g1f3db35271
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit"
url="https://gitlab.gnome.org/GNOME/gtk"
arch=(x86_64)
license=(LGPL)
depends=(
  adwaita-icon-theme
  cairo
  cantarell-fonts
  dconf
  desktop-file-utils
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  graphene
  gst-plugins-bad-libs
  harfbuzz
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libegl
  libepoxy
  libgl
  libjpeg
  libpng
  librsvg
  libtiff
  libx11
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
  tracker3
  wayland
)
makedepends=(
  docbook-xsl
  gi-docgen
  git
  gobject-introspection
  meson
  python-docutils
  python-gobject
  sassc
  shaderc
  wayland-protocols
)
checkdepends=(weston)

source=(
  "$_gitname"::"git+https://gitlab.gnome.org/GNOME/gtk.git"
  gtk-update-icon-cache.{hook,script}
  gtk4-querymodules.{hook,script}
)
sha256sums=(
  'SKIP'
  '2d435e3bec8b79b533f00f6d04decb1d7c299c6e89b5b175f20be0459f003fe8'
  'f1d3a0dbfd82f7339301abecdbe5f024337919b48bd0e09296bb0e79863b2541'
  'a5074ffc057a3041a4f851b4b4674cfc21f3cb9cc90c5414c3e91816a5d205e9'
  '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e'
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D colord=enabled
    -D gtk_doc=true
    -D man-pages=true
    -D tracker=enabled
  )

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson "$_gitname" build "${meson_options[@]}"
  meson compile -C build
}

check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs || true
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

package_gtk4-git() {
  depends+=(gtk-update-icon-cache)
  optdepends=('evince: Default print preview command')
  provides+=(
    gtk4
    libgtk-4.so
  )
  conflicts+=(gtk4)

  meson install -C build --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook
  install -D gtk4-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gtk4-querymodules"

  cd "$pkgdir"

  _pick demo usr/bin/gtk4-{demo,demo-application,icon-browser,node-editor,print-editor,widget-factory}
  _pick demo usr/share/applications/org.gtk.{Demo4,IconBrowser4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.Demo4.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/org.gtk.{Demo4,IconBrowser4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}[-.]*
  _pick demo usr/share/man/man1/gtk4-{demo,demo-application,icon-browser,node-editor,widget-factory}.1
  _pick demo usr/share/metainfo/org.gtk.{Demo4,IconBrowser4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.appdata.xml

  _pick docs usr/share/doc

  # Built by GTK 4, shared with GTK 3
  _pick guic usr/bin/gtk4-update-icon-cache
  _pick guic usr/share/man/man1/gtk4-update-icon-cache.1


}

package_gtk4-demos-git() {
  pkgdesc+=" (demo applications)"
  depends=(gtk4)
  provides+=(gtk4-demos)
  conflicts+=(gtk4-demos)

  mv demo/* "$pkgdir"
}

package_gtk4-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides+=(gtk4-docs)
  conflicts+=(gtk4-docs)

  mv docs/* "$pkgdir"
}

package_gtk-update-icon-cache-git() {
  pkgdesc="GTK icon cache updater"
  depends=(gdk-pixbuf2 librsvg hicolor-icon-theme)
  provides+=(gtk-update-icon-cache)
  conflicts+=(gtk-update-icon-cache)

  mv guic/* "$pkgdir"
  ln -s gtk4-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
  ln -s gtk4-update-icon-cache.1 "$pkgdir/usr/share/man/man1/gtk-update-icon-cache.1"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-update-icon-cache.hook
  install -D gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

# vim:set sw=2 sts=-1 et:
