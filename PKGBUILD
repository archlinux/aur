# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the gtk3 package: Ionut Biru <ibiru@archlinux.org>
# Maintainer of the gtk3 package: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gtk3-nobroadway-nowayland-nocolord
pkgver=3.22.4
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
depends=(atk cairo libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2 dconf
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk libxkbcommon
         adwaita-icon-theme json-glib librsvg gtk-update-icon-cache mesa)
makedepends=(gobject-introspection libcanberra gtk-doc git rest libcups)
optdepends=('libcanberra: gtk3-widget-factory demo'
	    'gtk3-print-backends: printing')
install=gtk3.install
license=(LGPL)
conflicts=(gtk3)
provides=("gtk3=$pkgver")
_commit=4569bb372f838a9a68c9b134ef18865abe77001c # tags/3.22.4^0
source=("git://git.gnome.org/gtk+#commit=$_commit"
        settings.ini
	gtk-query-immodules-3.0.hook)
sha256sums=('SKIP'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202'
	    'de46e5514ff39a7a65e01e485e874775ab1c0ad20b8e94ada43f4a6af1370845')

pkgver() {
    cd gtk+
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd gtk+
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk+

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-schemas-compile=no \
        --enable-x11-backend \
        --enable-broadway-backend=no \
        --enable-wayland-backend=no \
	--enable-mir-backend=no \
	--enable-colord=no \
	--enable-gtk-doc=no \
	--enable-gtk-doc-html=no \
	--enable-gtk-doc-pdf=no \
	--enable-man=no

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk+
    make DESTDIR="$pkgdir" install

    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
    install -Dm644 ../gtk-query-immodules-3.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-3.0.hook"

    # split this out to use with gtk2 too
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"

    cd "$pkgdir"
    for _f in usr/lib/*/*/printbackends/*; do
        case $_f in
            *-file.so|*-lpr.so) continue;;
        esac

        mkdir -p "$srcdir/print-backends/${_f%/*}"
        mv "$_f" "$srcdir/print-backends/$_f"
    done
}

