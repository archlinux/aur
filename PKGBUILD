# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.18.2
pkgrel=1
conflicts=(gtk3)
provides=('gtk3=3.18.2')
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libcups libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib rest gtk-update-icon-cache)
optdepends=('libcanberra: gtk3-widget-factory demo')
makedepends=(gobject-introspection libcanberra)
license=(LGPL)
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
	settings.ini typeahead.patch)
sha256sums=('5dbec561c4a00070073bf9cf4cfdd61fab4a14c8ff5b15d700bd378f8185e152'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'aafa56d981ef408f85b103ded3e15920ab96cda74e7501f970184dae38f8f791')

prepare() {
    cd gtk+-$pkgver

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch
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
