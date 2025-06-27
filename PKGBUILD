# Maintainer:
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Syboxez Blank <@Syboxez:matrix.org>

: ${_pkgtype=-git}

_gitname="gtk"
_pkgname="gtk4"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=4.19.2.r6.g12605ba
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit"
url="https://gitlab.gnome.org/GNOME/gtk"
license=('LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  cairo
  dconf
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  graphene
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gstreamer
  harfbuzz
  libcloudproviders
  libcolord
  libcups
  libepoxy
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
  pango
  tinysparql
  vulkan-icd-loader
  wayland
)
makedepends=(
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-docutils # rst2man
  python-gobject
  sassc
  shaderc
  vulkan-headers
  wayland-protocols
)
checkdepends=(weston)

options=('!lto')

_pkgsrc="$_gitname"
source=(
  "$_pkgsrc"::"git+https://gitlab.gnome.org/GNOME/gtk.git"
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
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag | grep -E '^[0-9].*' | sort -rV | head -1)
  _version="${_tag:?}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_hash:?}"
}

prepare() {
  # Allow -fcf-protection to work
  # https://gitlab.gnome.org/GNOME/gtk/-/issues/6153
  sed -E -e 's&^(\s*can_use_objcopy_for_resources) = \S+$&\1 = false&' \
    -i "$_pkgsrc/meson.build"
}

build() {
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D colord=enabled
    -D documentation=true
    -D man-pages=true
    -D tracker=enabled
  )

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson "$_pkgsrc" build "${meson_options[@]}"
  meson compile -C build

  meson install -C build --destdir "$srcdir/fakeinstall"

  cd fakeinstall

  # demos
  _pick demo usr/bin/gtk4-{demo,demo-application,node-editor,print-editor,widget-factory}
  _pick demo usr/share/applications/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.Demo4.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}[-.]*
  _pick demo usr/share/man/man1/gtk4-{demo,demo-application,node-editor,widget-factory}.1
  _pick demo usr/share/metainfo/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.appdata.xml

  # docs
  _pick docs usr/share/doc

  # Built by GTK 4, shared with GTK 3
  _pick guic usr/bin/gtk4-update-icon-cache
  _pick guic usr/share/man/man1/gtk4-update-icon-cache.1
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
  local p="$1" f d
  shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_package_gtk4() {
  depends+=(gtk-update-icon-cache)
  optdepends=('evince: Default print preview command')
  provides=(
    "gtk4=1:${pkgver%%.r*}"
    'libgtk-4.so'
  )
  conflicts=('gtk4')

  mv fakeinstall/* "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" << END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook
  install -D gtk4-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gtk4-querymodules"
}

_package_gtk4-demos() {
  pkgdesc+=" (demo applications)"
  depends=(
    cairo
    dconf
    gdk-pixbuf2
    graphene
    gtk4
    harfbuzz
    hicolor-icon-theme
    libepoxy
    librsvg
    pango
  )
  provides=("gtk4-demos=1:${pkgver%%.r*}")
  conflicts=('gtk4-demos')

  mv demo/* "$pkgdir"
}

_package_gtk4-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=("gtk4-docs=1:${pkgver%%.r*}")
  conflicts=('gtk4-docs')

  mv docs/* "$pkgdir"
}

_package_gtk-update-icon-cache() {
  pkgdesc="GTK icon cache updater"
  depends=(gdk-pixbuf2 librsvg hicolor-icon-theme)
  provides=("gtk-update-icon-cache=1:${pkgver%%.r*}")
  conflicts=('gtk-update-icon-cache')

  mv guic/* "$pkgdir"
  ln -s gtk4-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
  ln -s gtk4-update-icon-cache.1 "$pkgdir/usr/share/man/man1/gtk-update-icon-cache.1"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-update-icon-cache.hook
  install -D gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

pkgname=(
  "gtk4${_pkgtype:-}"
  "gtk4-demos${_pkgtype:-}"
  #"gtk4-docs${_pkgtype:-}"
  "gtk-update-icon-cache${_pkgtype:-}"
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_${_p%$_pkgtype}")
    _package_${_p%$_pkgtype}
  }"
done
