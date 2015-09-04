# Maintainer: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gtk2-patched-filechooser-icon-view
pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.28
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch."
url="https://gist.github.com/ahodesuka/01213036b58e510dc074"
provides="gtk2=$pkgver"
conflicts=gtk2
install=gtk2.install
makedepends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
             'shared-mime-info' 'cairo' 'libcups' 'gdk-pixbuf2' 'gobject-introspection' 'python2')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache' 'glib2-patched-thumbnailer')
optdepends=('gnome-themes-standard: Default widget theme' 
            'gnome-icon-theme: Default icon theme')
replaces=('gtk2-docs')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-$pkgver.tar.xz
        gtkrc xid-collision-debug.patch
        https://gist.githubusercontent.com/ahodesuka/01213036b58e510dc074/raw/2bc146e381aa988f6c29d547ed98432389b205a5/gtk2-filechooser-icon-view.patch)
sha256sums=('b2c6441e98bc5232e5f9bba6965075dcf580a8726398f7374d39f90b88ed4656'
            'b77a427df55a14182c10ad7e683b4d662df2846fcd38df2aa8918159d6be3ae2'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558'
            'e55f6a4e4e5fac92d3f5b08c6a609013893ab386e2564527cce0a4e375edd514')

prepare() {
    cd gtk+-$pkgver
    patch -Np1 -i ../xid-collision-debug.patch
    patch -Np1 -i $srcdir/gtk2-filechooser-icon-view.patch
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

    sed -i "s#env python#env python2#" $pkgdir/usr/bin/gtk-builder-convert

    install -Dm644 "$srcdir/gtkrc" "$pkgdir/usr/share/gtk-2.0/gtkrc"

    #split this out to use with gtk3 too
    rm $pkgdir/usr/bin/gtk-update-icon-cache
}
