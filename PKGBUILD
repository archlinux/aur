pkgname=gtk3-optional-csd
pkgver=3.18.0
pkgrel=1

pkgdesc='GObject-based multi-platform GUI toolkit with optionally enabled CSD.'
url='http://www.gtk.org/'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('atk' 'cairo' 'gtk-update-icon-cache' 'libcups' 'libxcursor' 'libxinerama'
         'libxrandr' 'libxi' 'libepoxy' 'libxcomposite' 'libxdamage' 'pango'
         'shared-mime-info' 'colord' 'at-spi2-atk' 'wayland' 'libxkbcommon'
         'adwaita-icon-theme' 'json-glib' 'rest')
makedepends=('gobject-introspection')

provides=('gtk3')
conflicts=('gtk3')

source=("https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz"
        'gtk3-make-csd-optional.patch')

sha1sums=('9bd758280de3bcf6898ee989ec3b81671c094263'
          '5975f8fc5a582288f59b32112c3a3207dc842696')

install='gtk3.install'

prepare() {
    cd gtk+-"$pkgver"
    patch -Np1 -i "$srcdir"/gtk3-make-csd-optional.patch
}

build() {
    cd gtk+-"$pkgver"
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-x11-backend \
        --enable-wayland-backend \
        --enable-broadway-backend \
        --disable-schemas-compile \

    # https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    cd gtk+-"$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/bin/gtk-update-icon-cache
}
