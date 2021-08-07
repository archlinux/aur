# Maintainer: Grey Christoforo < first name at last name dot net >

pkgbase=gtk4-rc
pkgname=(gtk4-rc gtk-update-icon-cache-rc gtk4-docs-rc gtk4-demos-rc)
pkgver=4.3.2
pkgrel=2
epoch=1
pkgdesc="gtk4 built from the latest tag in the repo"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(glib2 cairo pango fribidi gdk-pixbuf2 libepoxy libgl libegl harfbuzz
         libxkbcommon graphene iso-codes tracker3 libcolord wayland
         wayland-protocols libxrandr libx11 libxrender libxi libxext libxcursor
         libxdamage libxfixes libxcomposite fontconfig libxinerama
         vulkan-icd-loader vulkan-headers libcloudproviders libcups rest
         json-glib ffmpeg gst-plugins-bad-libs librsvg dconf shared-mime-info
         desktop-file-utils adwaita-icon-theme cantarell-fonts)
makedepends=(git meson gi-docgen shaderc sassc gobject-introspection
             docbook-xsl)
license=(LGPL)
source=("https://gitlab.gnome.org/GNOME/gtk/-/archive/${pkgver}/gtk-${pkgver}.tar.gz"
        gtk-update-icon-cache.{hook,script} gtk4-querymodules.hook)
sha256sums=('bd73956a939312d40cd98276b571c9802632d60bd435783d05f4b4aa76cc47e7'
            '2d435e3bec8b79b533f00f6d04decb1d7c299c6e89b5b175f20be0459f003fe8'
            'f1d3a0dbfd82f7339301abecdbe5f024337919b48bd0e09296bb0e79863b2541'
            'cd8e607eddd9941f279084e1d15309941423d26cca1897f43524a02e58e48816')

prepare() {
  cd gtk-${pkgver}
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D tracker=enabled
    -D colord=enabled
    -D gtk_doc=true
    -D man-pages=true
  )

  arch-meson gtk-${pkgver} build "${meson_options[@]}"
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

package_gtk4-rc() {
  conflicts=(gtk4)
  depends+=(gtk-update-icon-cache-rc)
  provides=(gtk4=${pkgver} libgtk-4.so)

  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook

  cd "$pkgdir"

  _pick guic usr/bin/gtk4-update-icon-cache
  _pick guic usr/share/man/man1/gtk4-update-icon-cache.1

  _pick docs usr/share/doc

  _pick demo usr/bin/gtk4-{demo,demo-application,icon-browser,print-editor,widget-factory}
  _pick demo usr/share/applications/org.gtk.{Demo,IconBrowser,PrintEditor,WidgetFactory}4.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.Demo4.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/org.gtk.{Demo,IconBrowser,PrintEditor,WidgetFactory}4[-.]*
  _pick demo usr/share/man/man1/gtk4-{demo,demo-application,icon-browser,widget-factory}.1
  _pick demo usr/share/metainfo/org.gtk.{Demo,IconBrowser,PrintEditor,WidgetFactory}4.appdata.xml
}

package_gtk-update-icon-cache-rc() {
  pkgdesc="GTK icon cache updater"
  conflicts=(gtk-update-icon-cache)
  provides=(gtk-update-icon-cache)
  depends=(gdk-pixbuf2 librsvg hicolor-icon-theme)

  mv guic/* "$pkgdir"
  ln -s gtk4-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
  ln -s gtk4-update-icon-cache.1 "$pkgdir/usr/share/man/man1/gtk-update-icon-cache.1"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-update-icon-cache.hook
  install -D gtk-update-icon-cache.script "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

package_gtk4-docs-rc() {
  pkgdesc+=" (documentation)"
  conflicts=(gtk4-docs)
  provides=(gtk4-docs)
  depends=()
  mv docs/* "$pkgdir"
}

package_gtk4-demos-rc() {
  pkgdesc+=" (demo applications)"
  depends=(gtk4-rc)
  conflicts=(gtk4-demos)
  provides=(gtk4-demos)
  mv demo/* "$pkgdir"
}

# vim:set ts=2 sw=2 et:

