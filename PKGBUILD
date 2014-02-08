# $Id$
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_rls=1
_pkgname=gtk3
pkgname=$_pkgname-donnatella
pkgver=3.10.7
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) w/ fixes & extra features"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon)
makedepends=(gobject-introspection gtk-doc)
optdepends=('gnome-themes-standard: Default widget theme'
            'gnome-icon-theme: Default icon theme')
provides=($_pkgname)
conflicts=($_pkgname)
license=(LGPL)
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-$pkgver.tar.xz
        settings.ini
        http://jjacky.com/donnatella/$pkgname.$_rls.tar.gz)
sha256sums=('b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119'
            '406ea8dc2d3766a04de5ae33203bd5f9ae55917dc5af52e8ab32b1bc6fdc505b')

prepare() {
    cd "gtk+-$pkgver"
    for patch in ../*.patch; do
        patch -p1 -i $patch
    done
    NOCONFIGURE=1 ./autogen.sh
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
    cd "gtk+-$pkgver"
    make DESTDIR="$pkgdir" install
    install -Dm644 ../settings.ini "$pkgdir/usr/share/gtk-3.0/settings.ini"
}
