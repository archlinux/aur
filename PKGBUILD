# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gtk2-doc
pkgver=2.24.30
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (legacy) documentation"
arch=(any)
url="http://www.gtk.org/"
makedepends=(atk pango libxcursor libxinerama libxrandr libxi libxcomposite libxdamage 
         shared-mime-info cairo libcups gtk-update-icon-cache librsvg gobject-introspection python2)
license=(LGPL)
source=(https://download.gnome.org/sources/gtk+/2.24/gtk+-$pkgver.tar.xz
        xid-collision-debug.patch)
sha256sums=('0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558')

prepare() {
    cd gtk+-$pkgver
    patch -Np1 -i ../xid-collision-debug.patch
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
    cd gtk+-$pkgver
    make DESTDIR="$pkgdir" install

    # remove everything but documentation
    rm -r "$pkgdir/etc"
    rm -r "$pkgdir/usr/bin"
    rm -r "$pkgdir/usr/include"
    rm -r "$pkgdir/usr/lib"
    rm -r "$pkgdir/usr/share/aclocal"
    rm -r "$pkgdir/usr/share/gir-1.0"
    rm -r "$pkgdir/usr/share/gtk-2.0"
    rm -r "$pkgdir/usr/share/locale"
    rm -r "$pkgdir/usr/share/themes"
}

# vim:set noet sw=4:
