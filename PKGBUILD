# Contributor: Jan de Groot <jgc@archlinux.org>
# Original Maintainer: megadriver <megadriver at gmx dot com>
# Based on gtk3 from [extra]
# Based on gtk3-ubuntu package from Luigi Ranghetti <ggranga@gmail.com>
# Old AUR Package Maintainer: 3V0LU710N <db_eee at yahoo dot com>
# Current AUR Package Maintainer: feuri <mail at feuri dot de>


pkgname=gtk3-light
pkgver=3.18.7
pkgrel=2
pkgdesc="GTK3 without colord."
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
install=gtk3.install
depends=('atk' 'cairo' 'gtk-update-icon-cache' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libepoxy'
         'libxcomposite' 'libxdamage' 'pango' 'shared-mime-info' 'at-spi2-atk' 'wayland' 'libxkbcommon'
         'adwaita-icon-theme' 'json-glib' 'rest' 'gtk-update-icon-cache')
makedepends=('gobject-introspection' 'libcanberra' 'gtk-doc')
optdepends=('libcanberra: gtk3-widget-factory demo')
provides=("gtk3=$pkgver")
conflicts=('gtk3')
options=('!docs') # Remove '!docs' if you want gtk3 docs
backup=(etc/gtk-3.0/settings.ini)
license=('LGPL')
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        0001-file-chooser-Avoid-a-crash.patch
        0001-file-chooser-Use-the-right-model-when-getting-the-se.patch
        settings.ini)
sha256sums=('a76e1cb0ac45ce5c2734f6778f2731a5c6a23d1ff6bd4db357774f014ee68820'
            '36058e522839bcae775cbafef8d4ad21cba98265b5cf9e90d5b46b874ddbf79f'
            '22c0272fdbb048ec8fe62d71bcb1ab6765050de3eb04e833ba7303750782d0a7'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')

prepare() {
    cd gtk+-$pkgver
    NOCONFIGURE=1 ./autogen.sh

    # https://bugzilla.gnome.org/show_bug.cgi?id=761209
    patch -Np1 -i ../0001-file-chooser-Avoid-a-crash.patch

    # https://bugzilla.gnome.org/show_bug.cgi?id=761757
    patch -Np1 -i ../0001-file-chooser-Use-the-right-model-when-getting-the-se.patch
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
