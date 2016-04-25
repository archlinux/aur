pkgname=gtk3-optional-csd
pkgver=3.20.3
pkgrel=1

pkgdesc='gobject-based gui toolkit with optionally enabled csd'
url='http://www.gtk.org/'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('atk' 'cairo' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi'
         'libepoxy' 'gdk-pixbuf2' 'libxcomposite' 'libxdamage' 'pango'
         'shared-mime-info' 'colord' 'at-spi2-atk' 'wayland' 'libxkbcommon'
         'adwaita-icon-theme' 'json-glib' 'rest' 'librsvg')
makedepends=('gobject-introspection' 'gtk-doc' 'libcanberra' 'wayland-protocols')
optdepends=('at-spi2-atk: accessibility')

provides=('gtk3')
conflicts=('gtk3')

source=("https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz"
        'gtk3-make-csd-optional.patch')

sha1sums=('460259a1aa8791c9e640e9d0a0785253ebaf93dc'
          'b667c109d6f58ea8547a52a7b381ed65e383d778')

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
        --disable-schemas-compile
    make
}

package() {
    cd gtk+-"$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/bin/gtk-update-icon-cache
}
