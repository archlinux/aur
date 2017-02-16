pkgname=gtk3-optional-csd
pkgver=3.22.8
pkgrel=1

pkgdesc='gobject-based gui toolkit with optionally enabled csd'
url='http://www.gtk.org/'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('atk' 'cairo' 'libcups' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi'
         'libepoxy' 'gdk-pixbuf2' 'libxcomposite' 'libxdamage' 'pango'
         'shared-mime-info' 'colord' 'at-spi2-atk' 'wayland' 'libxkbcommon'
         'adwaita-icon-theme' 'json-glib' 'rest' 'librsvg')
makedepends=('gobject-introspection' 'gtk-doc' 'glib2-docs' 'libcanberra' 'wayland-protocols')
optdepends=('at-spi2-atk: accessibility')

provides=("gtk3=$pkgver" 'gtk3-print-backends' 'gtk-update-icon-cache')
conflicts=('gtk3' 'gtk3-print-backends' 'gtk-update-icon-cache')

source=("https://download.gnome.org/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz"
        'gtk3-make-csd-optional.patch'
        'gtk-query-immodules-3.0.hook'
        'gtk-update-icon-cache.hook'
        'gtk-update-icon-cache.script')

sha1sums=('7895255a8e65a2590553ad28b8911dc815d74a1d'
          'b667c109d6f58ea8547a52a7b381ed65e383d778'
          'bd93d200ae9b9bcbb1082a8fe00291f6ad89bfd5'
          '7e32132f9dd2a620a42b6dd175a834817b08b180'
          '0a1ddc049b2f1fec2e562fc6c917bdb867b707a4')

install='gtk3.install'

prepare() {
    cd gtk+-"$pkgver"
    patch -Np1 -i "$srcdir"/gtk3-make-csd-optional.patch
}

build() {
    cd gtk+-"$pkgver"
    CXX=/bin/false ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-x11-backend \
        --enable-wayland-backend \
        --enable-broadway-backend \
        --disable-schemas-compile \
        --enable-gtk-doc

    # XXX https://bugzilla.gnome.org/show_bug.cgi?id=655517
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd gtk+-"$pkgver"
    make DESTDIR="$pkgdir" install
}
