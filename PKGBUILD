# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.24.4+15+g80b5024239
pkgrel=1
conflicts=(gtk3)
provides=("gtk3=$pkgver" gtk3-print-backends)
replaces=("gtk3-print-backends<=3.22.26-1")
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(x86_64)
url="https://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa
         cantarell-fonts colord rest libcups libcanberra)
makedepends=(gobject-introspection gtk-doc git glib2-docs sassc)
license=(LGPL)
_commit=80b5024239ee358ede8203666dfe9ea790a29b70 # gtk-3-24
source=("git+https://gitlab.gnome.org/GNOME/gtk.git#commit=$_commit"
        settings.ini
        gtk-query-immodules-3.0.hook
        typeahead.patch)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            '3b94b53ee720e24e999e6fe40de269ec5b6ddfcbab64fb1a14e7d89256651607')

prepare() {
    cd gtk

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk

    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend \
        --enable-gtk-doc

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    install=gtk3.install

    DESTDIR="$pkgdir" make -C gtk install
    install -Dt "$pkgdir/usr/share/gtk-3.0" -m644 settings.ini
    install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 gtk-query-immodules-3.0.hook

    # gtk-update-icon-cache will be provided in a separate package
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
