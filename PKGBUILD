# $Id$
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_rls=1
_pkgname=gtk3
pkgname=$_pkgname-donnatella
pkgver=3.16.5
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3) w/ fixes & extra features"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk3.install
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama
         libxrandr libxi libepoxy libxcomposite libxdamage pango
         shared-mime-info colord at-spi2-atk wayland libxkbcommon
         adwaita-icon-theme json-glib rest)
makedepends=(gobject-introspection libcanberra)
optdepends=('libcanberra: gtk3-widget-factory demo')
provides=($_pkgname)
conflicts=($_pkgname)
license=(LGPL)
source=(http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver%.*}/gtk+-$pkgver.tar.xz
        settings.ini
        http://jjacky.com/donnatella/$pkgname-${pkgver}-$_rls.tar.gz)
sha256sums=('b87c99d127eb962fc857c246b77a65322cdffd7dcbcf46a83bce2040e0f4bc31'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119'
            '5062de569e48cb720fcd3dc1b84848241b31982ac2c59db6342be206a8989a89')

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
    rm -f "$pkgdir/usr/bin/gtk-update-icon-cache"
}
