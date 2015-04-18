# $Id$
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

_rls=1
_pkgname=gtk3
pkgname=$_pkgname-donnatella
pkgver=3.16.2
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
sha256sums=('a03963a61c9f5253a8d4003187190be165d92f95acf97ca783735071a8781cfa'
            '14369dfd1d325c393e17c105d5d5cc5501663277bd4047ea04a50abb3cfbd119'
            '82aebbbe009ba21adbdefa81cd27cefe7b0df718fffda1b77d692dc9ff65ce1e')

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
