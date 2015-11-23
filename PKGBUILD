pkgname=gtk3-optional-csd
pkgver=3.18.5
pkgrel=1

pkgdesc='GObject-based multi-platform GUI toolkit with optionally enabled CSD.'
url='http://www.gtk.org/'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libepoxy'
         'libxcomposite' 'shared-mime-info' 'colord' 'at-spi2-atk'
         'libxkbcommon' 'adwaita-icon-theme' 'json-glib' 'rest')
makedepends=('gobject-introspection')

provides=('gtk3')
conflicts=('gtk3')

source=("https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz"
        'gtk3-make-csd-optional.patch')

sha1sums=('dee38a27d75fc877bcb1d1ce5302f439faa00f88'
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
        --disable-schemas-compile
    make
}

package() {
    cd gtk+-"$pkgver"
    make DESTDIR="$pkgdir" install
    rm -f "$pkgdir"/usr/bin/gtk-update-icon-cache
}
