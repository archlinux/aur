# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: twilinx <twilinx@mesecons.net>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
pkgname=gtk3-typeahead
pkgver=3.24.29
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit - Typeahead feature enabled for file chooser widget"
arch=(x86_64)
url="https://www.gtk.org/"
license=(LGPL)
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         dconf libxcomposite libxdamage pango shared-mime-info at-spi2-atk
         wayland libxkbcommon adwaita-icon-theme json-glib librsvg
         wayland-protocols desktop-file-utils mesa cantarell-fonts colord rest
         libcups libcanberra fribidi iso-codes libcloudproviders
         gtk-update-icon-cache)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc meson)
provides=("gtk3=$pkgver" gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so)
conflicts=(gtk3 gtk3-print-backends)
replaces=("gtk3-print-backends<=3.22.26-1")
install=gtk3.install
_commit=77f32a69c0a35ffd3a1a542a6057c1c6d13c793d  # tags/3.24.29^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        typeahead.patch)
sha256sums=('SKIP'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '3b94b53ee720e24e999e6fe40de269ec5b6ddfcbab64fb1a14e7d89256651607')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk

  # Typeahead-specific changes
  patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  local meson_options=(
    -D broadway_backend=true
    -D cloudproviders=true
    -D tracker3=false
    -D colord=yes
    -D examples=false \
    -D demos=false \
    -D man=true
  )

  arch-meson gtk build "${meson_options[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-3.0/settings.ini" <<END
[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-font-name = Cantarell 11
END

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
  rm "$pkgdir/usr/share/man/man1/gtk-update-icon-cache.1"
}
