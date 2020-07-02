# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.24.21
pkgrel=1
conflicts=(gtk3)
provides=("gtk3=$pkgver" gtk3-print-backends libgtk-3.so libgdk-3.so libgailutil-3.so)
replaces=("gtk3-print-backends<=3.22.26-1")
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(x86_64)
url="https://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra fribidi iso-codes)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc meson)
license=(LGPL)
_commit=ab4b85f88cf822d6dbb9cda9c4d71fd10a5d3d99  # tags/3.24.21^0
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        settings.ini
        gtk-query-immodules-3.0.hook
        typeahead.patch)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'a0319b6795410f06d38de1e8695a9bf9636ff2169f40701671580e60a108e229'
            '3b94b53ee720e24e999e6fe40de269ec5b6ddfcbab64fb1a14e7d89256651607')

prepare() {
    cd gtk

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch
}

build() {
    CFLAGS+=" -DG_ENABLE_DEBUG -DG_DISABLE_CAST_CHECKS"
    arch-meson gtk build \
        -D broadway_backend=true \
        -D colord=yes \
        -D gtk_doc=true \
        -D man=true
    meson compile -C build
}

package() {
    install=gtk3.install

    DESTDIR="$pkgdir" meson install -C build
    install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
    install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

    # gtk-update-icon-cache will be provided in a separate package
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
