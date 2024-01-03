pkgname=gtk4-customizable

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgver=4.12.1
apiver="${pkgver%.*}"
pkgrel=1
epoch=1
pkgdesc="GObject-based multi-platform GUI toolkit"
url="https://www.gtk.org/"
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
_commit=b51a3980f365775d92fa188f5533e78094474401  # tags/4.12.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
  gtk-update-icon-cache.{hook,script}
  gtk4-querymodules.{hook,script}
)
b2sums=('SKIP'
        '136bdb410c46daf769175e8e8837286576391797a4762b8cf388217e893dd6c5087c5c91c347cbdf7d3e9dcd2c978c2fb275b5af1f3425c9f7979fbc65a81324'
        '6bcd839ef82296d864587e0cc7acc0145bdea8e5235af304747cf3c0e564c2757cc67c0373dc044bec83dccfc57dc899546c2fccea96cff2bba22f09978a3814'
        'dd589bd1ad2b13f0e06f6899776a083f20a1aac24d4308d666ffd0d1cff38457b8257b8366f92e767b4233b3d86b6b54fa50339faf84c4801a824986366dce30'
        '4b90eb8d582509b09aab401313d4399cc139ad21b5dd7d45d79860d0764c7494c60714e0794e09823e51d1894ac032a994f27d79d1499abf24ee6f59bdb0c243')

prepare() {
  cd gtk

  # https://bugs.archlinux.org/task/79310
  # https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/6250
  git cherry-pick -n 4d7277f72c8f4915f237e36982ffd7dfba524b15
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
  optdepends=('evince: Default print preview command')
  provides=(gtk libgtk-4.so)
  conflicts=(gtk4)

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

# vim:set sw=2 sts=-1 et:
