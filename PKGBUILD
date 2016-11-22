# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the gtk3-print-backends package: Ionut Biru <ibiru@archlinux.org>
# Maintainer of the gtk3-print-backends package: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gtk3-print-backends-nocolord
pkgver=3.22.4
pkgrel=1
pkgdesc="Print backends for GTK3"
arch=(i686 x86_64)
url="http://www.gtk.org/"
depends=(gtk3 rest libcups)
makedepends=(gobject-introspection libcanberra git rest libcups)
license=(LGPL)
_commit=4569bb372f838a9a68c9b134ef18865abe77001c  # tags/3.22.4^0
source=("git://git.gnome.org/gtk+#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd gtk+
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    mkdir -p print-backends
    cd gtk+
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk+

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-schemas-compile \
        --enable-x11-backend \
        --disable-broadway-backend \
        --disable-wayland-backend \
        --disable-gtk-doc \
	--disable-colord

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk+
    make DESTDIR="$pkgdir" install

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

    cd "$srcdir/"
    rm -rf "$pkgdir"/*
    mv print-backends/* "$pkgdir"
}
