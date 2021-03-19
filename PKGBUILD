# Based on "upstream" by
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=gtk3-no_deadkeys_underline
pkgver=3.24.27
pkgrel=3
epoch=1
pkgdesc="Like gtk3 in extra but with a patch to disable dead keys having an underline below them while typing"
arch=(x86_64)
url="https://www.gtk.org/"
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         dconf libxcomposite libxdamage pango shared-mime-info at-spi2-atk
         wayland libxkbcommon adwaita-icon-theme json-glib librsvg
         wayland-protocols desktop-file-utils mesa cantarell-fonts colord rest
         libcups libcanberra fribidi iso-codes tracker3 libcloudproviders
         gtk-update-icon-cache)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc meson)
provides=(gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so gtk3)
conflicts=(gtk3-print-backends gtk3)
replaces=("gtk3-print-backends<=3.22.26-1")
license=(LGPL)
install=gtk3.install
_commit=c7df3b9e9790012e6c5fbad6a4f4519bcf75561f  # tags/3.24.27^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        gtk-query-immodules-3.0.hook
        no_deadkeys_underline.patch)
sha256sums=('SKIP'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            'SKIP')

pkgver() {
  cd gtk
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd gtk
  patch -p1 < ../no_deadkeys_underline.patch
}

build() {
  CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
  arch-meson gtk build \
    -D broadway_backend=true \
    -D cloudproviders=true \
    -D colord=yes \
    -D gtk_doc=true \
    -D man=true \
    -D tracker3=true
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

# vim:set ts=2 sw=2 et:
