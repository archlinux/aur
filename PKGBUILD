# Contributor: Jan de Groot <jgc@archlinux.org>
# Original Maintainer: megadriver <megadriver at gmx dot com>
# Based on gtk3 from [extra]
# Based on gtk3-ubuntu package from Luigi Ranghetti <ggranga@gmail.com>
# Old AUR Package Maintainer: 3V0LU710N <db_eee at yahoo dot com>
# Current AUR Package Maintainer: feuri <mail at feuri dot de>


pkgname=gtk3-light
pkgver=3.16.5
pkgrel=1
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
        settings.ini)
sha256sums=('b87c99d127eb962fc857c246b77a65322cdffd7dcbcf46a83bce2040e0f4bc31'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')

prepare() {
    cd gtk+-$pkgver
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
