# Maintainer: dudemanguy <random342@airmail.cc>
# Contributer: Wolfgang Frisch (wfr) <wfrisch@riseup.net>
# Contributer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-patched-filechooser-icon-view
pkgver=3.24.36
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
license=(LGPL)
install=gtk3.install
_commit=35516a5e866cd77390eb71d72d5b67f45dc4302c  # tags/3.24.36^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
  gtk-query-immodules-3.0.hook
  gtk3-filechooser-icon-view.patch
)
sha256sums=('SKIP'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '7a1730f08649b769cbaf24432ec176cefb55a5e81dc969a8242152718cb72eea')

pkgver() {
  cd gtk
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtk

  # apply icon-view patch
  git apply -3 ../gtk3-filechooser-icon-view.patch
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
