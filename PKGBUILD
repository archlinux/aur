pkgname=gtk3-optional-csd
pkgver=3.16.6
pkgrel=2

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

sha256sums=('4d12726d0856a968b41802ae5c5971d7e9bac532717e309d3f81b9989da5ffbe'
            '8ab096e996071cf5859956a54791c24cff628502482073f99adf5b226767ecea')

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
