# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.24.41
pkgrel=1
epoch=1
pkgdesc="GTK3 patched with dudemanguy's fork of wfr's filechooser-icon-view patch."
arch=(x86_64)
url="https://github.com/Dudemanguy/gtk"
depends=(
  adwaita-icon-theme
  atk
  cairo
  cantarell-fonts
  dconf
  desktop-file-utils
  fribidi
  gdk-pixbuf2
  glib2
  harfbuzz
  gtk-update-icon-cache
  iso-codes
  libcloudproviders
  libcolord
  libcups
  libegl
  libepoxy
  libgl
  librsvg
  libxcomposite
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
  git
  glib2-docs
  gobject-introspection
  gtk-doc
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
license=(LGPL-2.0-only)
install=gtk3.install
_commit=77ebdd85091833a7869ece48c3114fa6d9966321  # tags/3.24.41^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
  gtk-query-immodules-3.0.hook
  gtk3-filechooser-icon-view.patch
)
b2sums=('SKIP'
        '8e6a3906126749c6d853f582e3802254cdbba099c6af7190ad576eff6ea5425404a72b1b36950a87e3afdac82295cfe246003172c3e0341a73bd931a36f3b407'
        'a19fce8e87f2789d0bca3a62d2858d89e4db4a14cf76930228b01d94aefb8b58867df9c63a194fd3a2542382e3968bef2eda37e1a33847cbbe77838932d9f6c3')

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk

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
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  rm $pkgdir/usr/bin/gtk-update-icon-cache
  rm $pkgdir/usr/share/man/man1/gtk-update-icon-cache.1
  rm $pkgdir/usr/share/glib-2.0/schemas/org.gtk.exampleapp.gschema.xml
}

# vim:set sw=2 sts=-1 et:
