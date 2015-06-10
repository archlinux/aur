# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.16.3
pkgrel=2
conflicts=(gtk3)
provides=(gtk3)
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libcups libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib rest)
makedepends=(gobject-introspection libcanberra)
optdepends=('libcanberra: gtk3-widget-factory demo')
license=(LGPL)
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz)
sha256sums=('2943fd4a6b02c2a9b2edd231c1d8f7a1d2f8d36996f14310d34f503dca9ebea4')

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
    sed -i "s/<property name=\"enable-search\">False<\/property>/<property name=\"enable-search\">True<\/property>/" gtk/ui/gtkfilechooserwidget.ui
    sed -i "/gtk_tree_view_set_search_column (GTK_TREE_VIEW (priv->browse_files_tree_view), -1);/d" gtk/gtkfilechooserwidget.c
    sed -i "/gtk_tree_view_columns_autosize (GTK_TREE_VIEW (priv->browse_files_tree_view));/a gtk_tree_view_set_search_column (GTK_TREE_VIEW (priv->browse_files_tree_view), MODEL_COL_NAME);" gtk/gtkfilechooserwidget.c

    make
}

package() {
    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir/usr/bin/gtk-update-icon-cache"
}
