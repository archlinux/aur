# Maintainer: twilinx <twilinx@mesecons.net>

pkgname=gtk3-typeahead
pkgver=3.22.3
pkgrel=1
conflicts=(gtk3)
provides=("gtk3=$pkgver")
pkgdesc="GTK+ 3 with typeahead feature enabled for the file chooser widget"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib librsvg wayland-protocols desktop-file-utils mesa gtk-update-icon-cache)
optdepends=('libcanberra: gtk3-widget-factory demo'
            'gtk3-print-backends: Printing')
makedepends=(gobject-introspection libcanberra gtk-doc git colord rest libcups)
license=(LGPL)
_commit=99fed96b4470cf02f8fa522551d2a05e01a1bf8a  # tags/3.22.3^0
source=("git://git.gnome.org/gtk+#commit=$_commit"
        0001-gdkscreen-x11-Fix-screen-and-monitor-size-calculatio.patch
        settings.ini
        gtk-query-immodules-3.0.hook
        typeahead.patch)
sha256sums=('SKIP'
            'f722a70cb1affac8bd054a43b726f57aba21d664144fcaf6d58f18e5bef78189'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
            'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845'
            'fc10c2ddef67e75cb83e64db1f6b9a8a127b3aaba931909a08f28b9d6ea415d0')

prepare() {
    cd gtk+

    # Other patches
    patch -Np1 -i ../0001-gdkscreen-x11-Fix-screen-and-monitor-size-calculatio.patch

    # Typeahead-specific changes
    patch gtk/gtkfilechooserwidget.c -i $srcdir/typeahead.patch

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk+

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend \
        --enable-gtk-doc

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make -j4
}

package() {
    install=gtk3.install

    cd gtk+
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
    install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

    # gtk-update-icon-cache will be provided in a separate package
    rm $pkgdir/usr/bin/gtk-update-icon-cache

    # remove files that are already provided by gtk3-print-backends
    cd "$pkgdir"
    for _f in usr/lib/*/*/printbackends/*; do
        case $_f in
            *-file.so|*-lpr.so) continue;;
        esac

        rm "$_f"
    done
}
