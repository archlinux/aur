# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.18.8
pkgrel=1
conflicts=(gtk3)
provides=("gtk3=$pkgver")
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libcups libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib rest librsvg gtk-update-icon-cache)
optdepends=('libcanberra: gtk3-widget-factory demo')
makedepends=(gobject-introspection libcanberra gtk-doc)
license=(LGPL)
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
    settings.ini typeahead.patch)
sha256sums=('1c53ef1bb55364698f7183ecd185b547f92f4a3a7abfafd531400232e2e052f8'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'd9db275d3c6e63b9587c99185ae4e370d8ae76e343196d218e19c148abd21762')

prepare() {
    cd gtk+-$pkgver

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "gtk+-$pkgver"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make -j4
}

package() {
    install=gtk3.install

    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    rm $pkgdir/usr/bin/gtk-update-icon-cache
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}
