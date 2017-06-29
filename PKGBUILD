# Maintainer: dudemanguy <random342@openmailbox.org>
# Contributor: Vaporeon <vaporeon@tfwno.gf>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-patched-filechooser-icon-view
pkgver=2.24.31
_patchver=96d5d611d0a2e586f50e7accb7fbb6aaf44f7940
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="GTK2 patched with ahodesuka's filechooser-icon-view patch."
url="https://gist.github.com/Dudemanguy911/d70734d5bdf82e79cbfb22894fac8a1b/"
provides=("gtk2=$pkgver")
conflicts=('gtk2')
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache' 'librsvg'
         'desktop-file-utils' 'gtk-doc' 'glib2-patched-thumbnailer')
makedepends=('gobject-introspection' 'python2' 'git' 'gtk-doc')
optdepends=('gnome-themes-standard: Default widget theme' 
            'gnome-icon-theme: Default icon theme')
license=('LGPL')
install=gtk2.install
_commit=09c0b9c8a0f3dad599c179829ffb3a2e81f6efde
source=("git://git.gnome.org/gtk+#commit=$_commit"
        https://gist.github.com/Dudemanguy911/d70734d5bdf82e79cbfb22894fac8a1b/raw/$_patchver/gtk2-filechooser-icon-view.patch
        gtkrc
        gtk-query-immodules-2.0.hook
        xid-collision-debug.patch)
sha256sums=('SKIP'
            'c79c596c7b56b4df44885da7111799b1c56ec77357daec9f81a17276bef2826f'
            'b77a427df55a14182c10ad7e683b4d662df2846fcd38df2aa8918159d6be3ae2'
            '9656a1efc798da1ac2dae94e921ed0f72719bd52d4d0138f305b993f778f7758'
            'd758bb93e59df15a4ea7732cf984d1c3c19dff67c94b957575efea132b8fe558')
pkgver() {
    cd gtk+
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd gtk+
    patch -Np1 -i ../xid-collision-debug.patch
    patch -Np1 -i $srcdir/gtk2-filechooser-icon-view.patch
    sed -i '1s/python$/&2/' gtk/gtk-builder-convert
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd gtk+

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xinput=yes \
	--enable-gtk-doc

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk+
    make DESTDIR="$pkgdir" install

    install -Dm644 ../gtkrc "$pkgdir/usr/share/gtk-2.0/gtkrc"
    install -Dm644 ../gtk-query-immodules-2.0.hook "$pkgdir/usr/share/libalpm/hooks/gtk-query-immodules-2.0.hook"

    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
    rm -r "$pkgdir/usr/share/gtk-doc"
}
