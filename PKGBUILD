# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.24.52
pkgrel=2
epoch=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(x86_64)
url="https://github.com/Dudemanguy/gtk"
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
  gtk-update-icon-cache
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
  zlib
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
optdepends=('papers: default print previewer'
            'evince: legacy print previewer'
            'glib2-patched-thumbnailer: Thumbnail generation in upload dialog')
provides=(
  gtk3=$pkgver
  gtk3-print-backends
  libgailutil-3.so
  libgdk-3.so
  libgtk-3.so
)
conflicts=(gtk3 gtk3-print-backends)
replaces=('gtk3-print-backends<=3.22.26-1')
license=(LGPL-2.1-or-later)
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#tag=$pkgver"
  gtk-query-immodules-3.0.hook
  gtk-remove-immodules-cache.hook
  0001-Allow-disabling-legacy-Tracker-search.patch
  gtk3-filechooser-icon-view.patch
)
b2sums=('b351d0e48b074ea0b6d75dd8b47bd5ff5897dce01b2c69894a5d20fff0205b8cfc4603ce556331fdf3afe4f0380c58212ebac7cd832c9b6d3fd05cbf822250d8'
        '920c797546da3a6698c86fe53872be8ccaec627cb687b163e144f65d1a6ad7cb80d2e6f53a7ba26b91642cedec5432c3f1d4ec41f8d972fb6098580b31cb43a5'
        'bec30b4a00a885b03a49d49c8cdd3be2c9c81a375478fd4358e823845f292b410e033ddf728fb52aef4a3e99bfed3ce657131f17d8d68ae0d0d32c5621a85939'
        '7da1746e7702e4bf397f59dd1019e2c8fa8951b2bcc6bf64ec05f322de6dcec6fe5552848d6b389818f625988a3fb2211501d7f72ae97d2c49fbad1e5fe9cd6a'
        'a19fce8e87f2789d0bca3a62d2858d89e4db4a14cf76930228b01d94aefb8b58867df9c63a194fd3a2542382e3968bef2eda37e1a33847cbbe77838932d9f6c3')

prepare() {
  cd gtk

  # Don't try to use the old Tracker
  git apply -3 ../0001-Allow-disabling-legacy-Tracker-search.patch

  # apply icon-view patch
  patch -Np1 -i ../gtk3-filechooser-icon-view.patch
}

build() {
  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D colord=yes
    -D gtk_doc=false
    -D introspection=true
    -D demos=false
    -D man=true
    -D tracker=false
    -D tracker3=true
  )

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson gtk build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Adwaita Sans 11
END

  install -Dm644 gtk-*.hook -t "$pkgdir/usr/share/libalpm/hooks"

  rm $pkgdir/usr/bin/gtk-update-icon-cache
  rm $pkgdir/usr/share/man/man1/gtk-update-icon-cache.1
  rm $pkgdir/usr/share/glib-2.0/schemas/org.gtk.exampleapp.gschema.xml
}

# vim:set sw=2 sts=-1 et:
