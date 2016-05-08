# Maintainer: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gtk2-patched-filechooser-icon-view
pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.30
_patchver=d60e3f1330f3044aeffad8516adc3c444e751b2f
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch."
url="https://gist.github.com/ahodesuka/01213036b58e510dc074"
provides=("gtk2=$pkgver")
conflicts=('gtk2')
install=gtk2.install
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache' 'librsvg'
         'desktop-file-utils' 'glib2-patched-thumbnailer')
makedepends=('gobject-introspection' 'python2')
optdepends=('gnome-themes-standard: Default widget theme' 
            'gnome-icon-theme: Default icon theme')
replaces=('gtk2-docs')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-$pkgver.tar.xz
        https://gist.githubusercontent.com/ahodesuka/01213036b58e510dc074/raw/$_patchver/gtk2-filechooser-icon-view.patch
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch)
sha256sums=('0d15cec3b6d55c60eac205b1f3ba81a1ed4eadd9d0f8e7c508bc7065d0c4ca50'
            '2e15a62578f152d040d716b356411825efe222743f6e813ed7dd1d0c1a12bb50'
            'b77a427df55a14182c10ad7e683b4d662df2846fcd38df2aa8918159d6be3ae2'
            '9656a1efc798da1ac2dae94e921ed0f72719bd52d4d0138f305b993f778f7758'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558')

prepare() {
    cd gtk+-$pkgver
    patch -Np1 -i ../xid-collision-debug.patch
    patch -Np1 -i $srcdir/gtk2-filechooser-icon-view.patch
    sed -i '1s/python$/&2/' gtk/gtk-builder-convert
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

    install -Dm644 ../gtkrc "$pkgdir/usr/share/gtk-2.0/gtkrc"
    install -Dm644 ../gtk-query-immodules-2.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-2.0.hook"

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
    rm -r "$pkgdir/usr/share/gtk-doc"
}
