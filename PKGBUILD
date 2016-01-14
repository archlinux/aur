# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.18.6
pkgrel=2
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
makedepends=(gobject-introspection libcanberra)
license=(LGPL)
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
    0001-x11-Only-do-cursor-name-fallback-for-standard-names.patch
    0002-wayland-Only-do-cursor-name-fallback-for-standard-na.patch
    settings.ini typeahead.patch)
sha256sums=('78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef'
            '0402c3b7801810beb0f24ad20e4fb2eb7519cf3984f39e093a6e2752a0f7d9de'
            '94722b06284e76f628fc8933617ac19c14f6775a5250fe3c382defab63d7b10e'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'e0c43f9565567bad1284beb028718a75eac20930b25bf53ccfbee9513bc68d15')

prepare() {
    cd gtk+-$pkgver

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch

    # Fix zoom in/out cursors in GTK3 builds of Firefox
    # https://bugzilla.gnome.org/show_bug.cgi?id=760141
    patch -Np1 -i ../0001-x11-Only-do-cursor-name-fallback-for-standard-names.patch
    patch -Np1 -i ../0002-wayland-Only-do-cursor-name-fallback-for-standard-na.patch
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
