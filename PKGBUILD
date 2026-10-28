# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgbase=gtk4-phoenix
pkgname=(
  gtk4-phoenix
  gtk4-phoenix-demos
  gtk4-phoenix-docs
  gtk-update-icon-cache-phoenix
)
_commit=8ac3c6c16a3382f9039262b981d3421fe3b793cd
pkgver=4.25.0
pkgrel=2
epoch=1
pkgdesc="A fork of gtk with support for per-monitor fractional scaling on X11"
url="https://github.com/dec05eba/gtk"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  adwaita-fonts
  adwaita-icon-theme
  at-spi2-core
  bash
  cairo
  dconf
  desktop-file-utils
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  glibc
  graphene
  gst-plugins-bad-libs
  gst-plugins-base-libs
  gstreamer
  gtk-update-icon-cache
  harfbuzz
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libegl
  libepoxy
  libgcc
  libgl
  libjpeg-turbo
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
  tinysparql
  vulkan-icd-loader
  wayland
  xdg-desktop-portal-gtk
)
makedepends=(
  docbook-xsl
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  hicolor-icon-theme
  libsysprof-capture
  meson
  python-docutils
  python-gobject
  sassc
  shaderc
  vulkan-headers
  wayland-protocols
)
source=(
  "gtk-$_commit.tar.gz::https://github.com/dec05eba/gtk/archive/$_commit.tar.gz"
  gtk-update-icon-cache.{hook,script}
  gtk4-querymodules.{hook,script}
)
b2sums=('5ebc1d2fbcd347171260734ee01c817e80da2c83599680e2836f73e5dcf540745493f4731fbe64b6f5c62464daeb762dc72ed22e0579ffddf2b5b773df013e45'
        '136bdb410c46daf769175e8e8837286576391797a4762b8cf388217e893dd6c5087c5c91c347cbdf7d3e9dcd2c978c2fb275b5af1f3425c9f7979fbc65a81324'
        '6bcd839ef82296d864587e0cc7acc0145bdea8e5235af304747cf3c0e564c2757cc67c0373dc044bec83dccfc57dc899546c2fccea96cff2bba22f09978a3814'
        'dd589bd1ad2b13f0e06f6899776a083f20a1aac24d4308d666ffd0d1cff38457b8257b8366f92e767b4233b3d86b6b54fa50339faf84c4801a824986366dce30'
        '4b90eb8d582509b09aab401313d4399cc139ad21b5dd7d45d79860d0764c7494c60714e0794e09823e51d1894ac032a994f27d79d1499abf24ee6f59bdb0c243')

prepare() {
  cd gtk-$_commit
}

build() {
  local meson_options=(
    -D broadway-backend=true
    -D cloudproviders=enabled
    -D colord=enabled
    -D documentation=true
    -D man-pages=true
    -D sysprof=enabled
    -D tracker=enabled
  )

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson gtk-$_commit build "${meson_options[@]}"
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

package_gtk4-phoenix() {
  optdepends=('papers: default print previewer')
  provides=("gtk4=$epoch:$pkgver" libgtk-4.so)
  conflicts=(gtk4)

  meson install -C build --no-rebuild --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-4.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Adwaita Sans 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk4-querymodules.hook
  install -D gtk4-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gtk4-querymodules"

  cd "$pkgdir"

  _pick demo usr/bin/gtk4-{demo,demo-application,node-editor,print-editor,widget-factory}
  _pick demo usr/share/applications/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.desktop
  _pick demo usr/share/glib-2.0/schemas/org.gtk.Demo4.gschema.xml
  _pick demo usr/share/icons/hicolor/*/apps/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}[-.]*
  _pick demo usr/share/man/man1/gtk4-{demo,demo-application,node-editor,widget-factory}.1
  _pick demo usr/share/metainfo/org.gtk.{Demo4,PrintEditor4,WidgetFactory4,gtk4.NodeEditor}.appdata.xml

  _pick docs usr/share/doc

  # Built by GTK 4, shared with GTK 3
  _pick guic usr/bin/gtk4-update-icon-cache
  _pick guic usr/share/man/man1/gtk4-update-icon-cache.1
}

package_gtk4-phoenix-demos() {
  pkgdesc+=" (demo applications)"
  provides=("gtk4-demos=$epoch:$pkgver")
  conflicts=(gtk4-demos)
  depends=(
    cairo
    dconf
    fontconfig
    fribidi
    gdk-pixbuf2
    glib2
    glibc
    graphene
    gst-plugins-bad-libs
    gst-plugins-base-libs
    gstreamer
    gtk4-phoenix
    harfbuzz
    hicolor-icon-theme
    libcloudproviders
    libcolord
    libcups
    libepoxy
    libgcc
    libjpeg-turbo
    libpng
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
  mv demo/* "$pkgdir"
}

package_gtk4-phoenix-docs() {
  pkgdesc+=" (documentation)"
  provides=("gtk4-docs=$epoch:$pkgver")
  conflicts=(gtk4-docs)
  depends=()
  mv docs/* "$pkgdir"
}

package_gtk-update-icon-cache-phoenix() {
  pkgdesc="GTK icon cache updater"
  provides=("gtk-update-icon-cache=$epoch:$pkgver")
  conflicts=(gtk-update-icon-cache)
  depends=(
    bash
    gdk-pixbuf2
    glib2
    glibc
    hicolor-icon-theme
    librsvg
  )

  mv guic/* "$pkgdir"

  ln -sr "$pkgdir"/usr/bin/gtk{4,}-update-icon-cache
  ln -sr "$pkgdir"/usr/share/man/man1/gtk{4,}-update-icon-cache.1

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-update-icon-cache.hook
  install -D gtk-update-icon-cache.script \
    "$pkgdir/usr/share/libalpm/scripts/gtk-update-icon-cache"
}

# vim:set sw=2 sts=-1 et:
