# Contributor: Jan de Groot <jgc@archlinux.org>
# Original Maintainer: megadriver <megadriver at gmx dot com>
# Based on gtk3 from [extra]
# Based on gtk3-ubuntu package from Luigi Ranghetti <ggranga@gmail.com>
# Old AUR Package Maintainer: 3V0LU710N <db_eee at yahoo dot com>
# Current AUR Package Maintainer: feuri <mail at feuri dot de>


pkgname=gtk3-light
pkgver=3.18.6
pkgrel=2
pkgdesc="GTK3 without colord."
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=gtk3.install
depends=('atk' 'cairo' 'gtk-update-icon-cache' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libepoxy'
         'libxcomposite' 'libxdamage' 'pango' 'shared-mime-info' 'at-spi2-atk' 'wayland' 'libxkbcommon'
         'adwaita-icon-theme' 'json-glib' 'rest' 'gtk-update-icon-cache')
makedepends=('gobject-introspection' 'libcanberra')
optdepends=('libcanberra: gtk3-widget-factory demo')
provides=("gtk3=$pkgver")
conflicts=('gtk3')
options=('!docs') # Remove '!docs' if you want gtk3 docs
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        0001-x11-Only-do-cursor-name-fallback-for-standard-names.patch
        0002-wayland-Only-do-cursor-name-fallback-for-standard-na.patch
        settings.ini)
sha256sums=('78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef'
            '0402c3b7801810beb0f24ad20e4fb2eb7519cf3984f39e093a6e2752a0f7d9de'
            '94722b06284e76f628fc8933617ac19c14f6775a5250fe3c382defab63d7b10e'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')

prepare() {
    cd gtk+-$pkgver

    # Fix zoom in/out cursors in GTK3 builds of Firefox
    # https://bugzilla.gnome.org/show_bug.cgi?id=760141
    patch -Np1 -i ../0001-x11-Only-do-cursor-name-fallback-for-standard-names.patch
    patch -Np1 -i ../0002-wayland-Only-do-cursor-name-fallback-for-standard-na.patch
}

build() {
    cd "$srcdir/gtk+-$pkgver"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-colord \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "$srcdir/gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"

    # split this out to use with gtk2 too
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}
