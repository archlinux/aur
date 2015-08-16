# $Id: PKGBUILD 198070 2013-10-30 12:37:07Z allan $
# Contributor GTK2 Arch: Jan de Groot <jgc@archlinux.org>
# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=gtk2-aqd
pkgver=2.24.28
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
makedepends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
             'shared-mime-info' 'cairo' 'libcups' 'gdk-pixbuf2' 'gobject-introspection')
provides=("gtk2=$pkgver")
replaces=('gtk2' 'gtk2-docs')
conflicts=('gtk2')
license=('LGPL')
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${pkgver}.tar.xz"
        "gtkrc" "xid-collision-debug.patch" "gtk-gtkmenubar.patch")

prepare() {
    cd gtk+-$pkgver
    patch -Np1 -i $srcdir/xid-collision-debug.patch
    patch -Np0 -i $srcdir/gtk-gtkmenubar.patch
}

build() {
    cd gtk+-$pkgver

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    pkgdesc="GTK+ is a multi-platform toolkit (v2) with aqd patch to allow menu exportation"
    install=gtk2.install
    depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 
             'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache')
    optdepends=('gnome-themes-standard: Default widget theme'
                'gnome-icon-theme: Default icon theme')
    replaces=('gtk2-docs')

    cd gtk+-$pkgver
    make DESTDIR="$pkgdir" install

    sed -i "s#env python#env python2#" $pkgdir/usr/bin/gtk-builder-convert

    install -Dm644 "$srcdir/gtkrc" "$pkgdir/usr/share/gtk-2.0/gtkrc"

    #split this out to use with gtk3 too
    rm $pkgdir/usr/bin/gtk-update-icon-cache
}
md5sums=('bfacf87b2ea67e4e5c7866a9003e6526'
         '5105b21ea13dbfbef8975138b4355e7a'
         '22355df723f6ca358e30e6b8f0baace5'
         'f684703385e424343faeceb560e1fe02')
