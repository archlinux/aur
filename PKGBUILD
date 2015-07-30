# Maintainer: lks <lukas dot graetz at web dot de>
# based on extra/gtk2: Jan de Groot <jgc@archlinux.org>

pkgbase=gtk2-dfb
pkgname=('gtk2-dfb')
# uncomment this for multi-build
# multi_build = 'yes'
if [ $multi_build ]
  then pkgname=('gtk2-dfb' 'gtk2' 'gtk-update-icon-cache')
fi
pkgver=2.24.27
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
makedepends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
             'shared-mime-info' 'cairo-dfb' 'libcups' 'gdk-pixbuf2' 'gobject-introspection')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-$pkgver.tar.xz
        gtkrc xid-collision-debug.patch)
sha256sums=('20cb10cae43999732a9af2e9aac4d1adebf2a9c2e1ba147050976abca5cd24f4'
            'b77a427df55a14182c10ad7e683b4d662df2846fcd38df2aa8918159d6be3ae2'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558')

prepare() {
    cd gtk+-$pkgver
    patch -Np1 -i ../xid-collision-debug.patch

    cd ..
    rm -rf gtk2-dfb-build gtk2-build
    mkdir gtk2-dfb-build
    mkdir gtk2-build
}

build_gtk2-dfb() {
    cd gtk2-dfb-build

    # build with --with-gdktarget=directfb
    CXX=/bin/false ../gtk+-$pkgver/configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes \
        --disable-gtk-doc \
        --with-gdktarget=directfb

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

build_gtk2() {
    cd gtk2-build

    CXX=/bin/false ../gtk+-$pkgver/configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

build() {
    build_gtk2-dfb
    if [ $multi_build ]
       then build_gtk2
    fi
}

package_gtk2-dfb() {
    pkgdesc="directfb backend for GTK+"
    install=gtk2-dfb.install
    depends=("gtk2>=${pkgver}" 'cairo-dfb' 'directfb')
    cd gtk2-dfb-build

    mkdir $srcdir/gtk2-dfb-testinstall
    make DESTDIR=$srcdir/gtk2-dfb-testinstall install
    cd $srcdir/gtk2-dfb-testinstall
    mkdir -p $pkgdir/usr/{lib,lib/pkgconfig,include/gtk-2.0/gdk}
    for name in $(find . | grep directfb | grep -v gtk-doc)
        do mv $name $pkgdir/$name
    done
    rm -r $srcdir/gtk2-dfb-testinstall
}

package_gtk2() {
    pkgdesc="GTK+ is a multi-platform toolkit (v2)"
    install=gtk2.install
    depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage' 
             'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache')
    optdepends=('gnome-themes-standard: Default widget theme'
                'gnome-icon-theme: Default icon theme')
    replaces=('gtk2-docs')

    cd gtk2-build
    make DESTDIR="$pkgdir" install

    sed -i "s#env python#env python2#" $pkgdir/usr/bin/gtk-builder-convert

    install -Dm644 "$srcdir/gtkrc" "$pkgdir/usr/share/gtk-2.0/gtkrc"

    #split this out to use with gtk3 too
    rm $pkgdir/usr/bin/gtk-update-icon-cache
}
package_gtk-update-icon-cache() {
    pkgdesc="The GTK+ update icon cache tool"
    depends=('gdk-pixbuf2>=2.24.1-3' 'hicolor-icon-theme')
    install=gtk-update-icon-cache.install

    cd gtk2-build/gtk
    install -D -m755 gtk-update-icon-cache "$pkgdir/usr/bin/gtk-update-icon-cache"
}
