# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.24.51
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
optdepends=('evince: Default print preview command'
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
install=gtk3.install
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#tag=$pkgver"
  gtk-query-immodules-3.0.hook
  0001-Allow-disabling-legacy-Tracker-search.patch
  gtk3-filechooser-icon-view.patch
)
b2sums=('06f5dcfe6cf693d4e0da0964715e7ea07ab8940eea21b7fba28615c6d9ecdd8533e51e061b57e6b4f5b9401041adeb52fd81fc856fa79dc5bf8e5a4058d9fa92'
        '8e6a3906126749c6d853f582e3802254cdbba099c6af7190ad576eff6ea5425404a72b1b36950a87e3afdac82295cfe246003172c3e0341a73bd931a36f3b407'
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

  install -Dm644 gtk-query-immodules-3.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

  rm $pkgdir/usr/bin/gtk-update-icon-cache
  rm $pkgdir/usr/share/man/man1/gtk-update-icon-cache.1
  rm $pkgdir/usr/share/glib-2.0/schemas/org.gtk.exampleapp.gschema.xml
}

# vim:set sw=2 sts=-1 et:
