# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.16.5
pkgrel=1
conflicts=(gtk3)
provides=(gtk3)
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
	settings.ini)
sha256sums=('b87c99d127eb962fc857c246b77a65322cdffd7dcbcf46a83bce2040e0f4bc31'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')

prepare() {
    cd gtk+-$pkgver
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

    # Typeahead-specific changes
    sed -i "s/<property name=\"enable-search\">False<\/property>/<property name=\"enable-search\">True<\/property>/" gtk/ui/gtkfilechooserwidget.ui
    sed -i "/gtk_tree_view_set_search_column (GTK_TREE_VIEW (priv->browse_files_tree_view), -1);/d" gtk/gtkfilechooserwidget.c
    sed -i "/gtk_tree_view_columns_autosize (GTK_TREE_VIEW (priv->browse_files_tree_view));/a gtk_tree_view_set_search_column (GTK_TREE_VIEW (priv->browse_files_tree_view), MODEL_COL_NAME);" gtk/gtkfilechooserwidget.c

    make -j4
}

package() {
    install=gtk3.install

    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    rm $pkgdir/usr/bin/gtk-update-icon-cache
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}
