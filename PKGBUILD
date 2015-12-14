# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the gtk3 package: Ionut Biru <ibiru@archlinux.org>
# Maintainer of the gtk3 package: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=gtk3-nobroadway-nowayland-nocolord
pkgver=3.18.6
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit"
arch=(i686 x86_64)
url="http://www.gtk.org/"
depends=(atk cairo libcups libxcursor libxinerama libxrandr libxi libepoxy gdk-pixbuf2
         libxcomposite libxdamage pango shared-mime-info at-spi2-atk libxkbcommon
         adwaita-icon-theme json-glib rest librsvg gtk-update-icon-cache)
makedepends=(gobject-introspection libcanberra)
optdepends=('libcanberra: gtk3-widget-factory demo')
install=gtk3.install
license=(LGPL)
conflicts=(gtk3)
provides=("gtk3=$pkgver")
source=(https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz
        settings.ini)
sha256sums=('78cabf0fd5a662f8723f62d5ac633072c76c557c1d700454c9c3deaa37e441ef'
            '01fc1d81dc82c4a052ac6e25bf9a04e7647267cc3017bc91f9ce3e63e5eb9202')


build() {
    cd "gtk+-$pkgver"

    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-schemas-compile=no \
        --enable-x11-backend \
        --enable-broadway-backend=no \
        --enable-wayland-backend=no \
	--enable-mir-backend=no \
	--enable-colord=no \
	--enable-gtk-doc=no \
	--enable-gtk-doc-html=no \
	--enable-gtk-doc-pdf=no \
	--enable-man=no

    #https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"

    # split this out to use with gtk2 too
    rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

