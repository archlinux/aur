# Maintainer: Vladimir Pinchuck <vladimir.pinchuk01@gmail.com>

pkgname=gtk3-cosy
pkgver=3.22.12
pkgrel=1
conflicts=(gtk3)
provides=("gtk3=$pkgver")
pkgdesc="GTK3 library with my modifications (see README)"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa)
optdepends=('libcanberra: gtk3-widget-factory demo'
            'gtk3-print-backends: Printing')
makedepends=(gobject-introspection libcanberra gtk-doc git colord rest libcups glib2-docs)
license=(LGPL)
source=(
        "csd__appmenu-as-context-menu.patch"
        "csd__hide-appmenu.patch"
        "csd__hide-close-button.patch"
        "csd__permanently-disable.patch"
        "file-chooser__disable-other-locations.patch"
        "file-chooser__hide-xdg-dirs.patch"
        "file-chooser__single-click.patch"
        "general__always-show-scrollbars.patch"
        "print-dialog__appearance.patch"
        "print-dialog__default-previewer.patch"
        "typeahead.patch"
        "never_local_only.patch"

        "https://github.com/GNOME/gtk/archive/$pkgver.tar.gz"
        settings.ini
        gtk-query-immodules-3.0.hook
       )
sha256sums=('d8214e11bfcee96552ce5911b1d172ce8076313685d5897f9bd0655df546341b'
            '2251f75f3fd8af92f71e7d31d616303e18596e37a59e293748521972ef185578'
            'a4015d73585d97dc80f7b01cfc6960fd94e570d7abe3105aff7aed139b6513be'
            '676cff1d71c13600f4c0fba082cb6aba93e8c570063779a745851275d8a287c7'
            'fb24c78bf536f5c13bd359b760bfd3267bbdf7b62c1397519a995080138b9049'
            '506a214562144912afc14d52b20a676c3ca0d34232c8db60e3b24f7ab22cb6cb'
            'd3b0905b9f76afbe236f9c7091a2957d25e112abf9100707c48c948d6ddaf5e5'
            '3bfe58be30338daa30a9eacba82420ca4df6f8f5b5b2d0df5b9a77b018ab0cec'
            'f14cd9983ada3fab3f22ce6ef7fcdd6afb9253f0bf5b9de20255fe0e8c56d685'
            '886f9ca521285974617eff66e5060b429c4be56b205444e457b6bfdd24f60ca4'
            '2c02fb2804fce282bde1d04ce2534b77476422034605652cf0d0874f15feb01c'
            '58239e4945feca905788c192716073939e3dc8ceeb5d25e9fa024f0b1ed328ca'
            'bec9108c4892041988635f7e276724828b17a0522b211c190530a1f76f88cbae'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845')

prepare() {
    gtk_source="$srcdir/gtk-$pkgver/gtk"

    # csd
    patch "$gtk_source/gtkheaderbar.c" "csd__hide-appmenu.patch"
    patch "$gtk_source/gtkheaderbar.c" "csd__hide-close-button.patch"
    patch "$gtk_source/gtkwindow.c" "csd__permanently-disable.patch"
    patch "$gtk_source/gtkwindow.c" "csd__appmenu-as-context-menu.patch"

    # file chooser
    patch "$gtk_source/gtkplacessidebar.c" "file-chooser__hide-xdg-dirs.patch"
    patch "$gtk_source/gtkfilechooserwidget.c" "file-chooser__single-click.patch"
    patch "$gtk_source/ui/gtkfilechooserwidget.ui" "file-chooser__disable-other-locations.patch"
    patch "$gtk_source/gtkfilechooserwidget.c" -i "typeahead.patch"
#    patch "$gtk_source/gtkfilechooserwidget.c" -i "never_local_only.patch"

    # print dialog
    patch "$gtk_source/gtksettings.c" "print-dialog__default-previewer.patch"
    patch "$gtk_source/ui/gtkprintunixdialog.ui" "print-dialog__appearance.patch"

    # general
    patch "$gtk_source/gtkscrolledwindow.c" "general__always-show-scrollbars.patch"


    cd "gtk-$pkgver"
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "gtk-$pkgver"

    CXX=/bin/false ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --disable-schemas-compile --enable-x11-backend --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "gtk-$pkgver"

    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
    install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
    rm -R "$pkgdir/usr/lib/gtk-3.0/3.0.0/printbackends"
}
