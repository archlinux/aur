# $Id: PKGBUILD 204833 2014-01-28 08:59:57Z heftig $
# Contributor from Arch: Ionut Biru <ibiru@archlinux.org>
# Contributor from Arch: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88 (arro'a) gmail puntocom>

pkgname=gtk3-aqd
pkgver=3.16.6
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) with aqd patch to export menus"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon)
makedepends=(gobject-introspection)
provides=('gtk3')
replaces=('gtk3')
conflicts=('gtk3')
optdepends=('gnome-themes-standard: Default widget theme'
            'gnome-icon-theme: Default icon theme')
license=("LGPL")
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-${pkgver}.tar.xz"
        "settings.ini" "gtk-gtkmenubar.patch")

prepare() {
    cd "gtk+-$pkgver"

    patch -Np0 -i $srcdir/gtk-gtkmenubar.patch

}

build() {
    cd "gtk+-$pkgver"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-gtk2-dependency \
        --disable-schemas-compile \
        --enable-x11-backend \
        --enable-broadway-backend \
        --enable-wayland-backend

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    depends+=(gtk-update-icon-cache)
    optdepends=('libcanberra: gtk3-widget-factory demo')
    install=gtk3.install

    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"

    # split this out to use with gtk2 too
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

md5sums=('fc59e5c8b5a4585b60623dd708df400b'
         '52bca1105d029c5142909b9e349bb89c'
         '5f3d11d95a94415f63ba5b9eacf3ddd4')
