# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>

pkgname=lib32-gtk3
pkgver=3.16.5
pkgrel=2
pkgdesc='GObject-based multi-platform GUI toolkit (v3)'
arch=('x86_64')
license=('LGPL')
url='http://www.gtk.org/'
depends=('gtk3' 'lib32-at-spi2-atk' 'lib32-colord' 'lib32-gdk-pixbuf2'
         'lib32-json-glib' 'lib32-libcups' 'lib32-libepoxy'
         'lib32-libxcomposite' 'lib32-libxcursor' 'lib32-libxinerama'
         'lib32-libxkbcommon' 'lib32-libxrandr' 'lib32-pango' 'lib32-rest')
makedepends=('gcc-multilib' 'gobject-introspection')
install='gtk3.install'
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz"
        'mousewheels-fs45666.patch')
sha256sums=('b87c99d127eb962fc857c246b77a65322cdffd7dcbcf46a83bce2040e0f4bc31'
            'c103076f4f648e20ef8da7ea6a48fda8012ecaec6987008c08f2bfdd4f5101f4')

prepare() {
  cd gtk+-${pkgver}

  patch -Np1 -i ../mousewheels-fs45666.patch
}

build() {
  cd gtk+-${pkgver}

  export CC='gcc -m32'
  export CXX='/bin/false'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --enable-{broadway,wayland,x11}-backend \
    --disable-libcanberra \
    --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd gtk+-${pkgver}

  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/usr/bin/gtk-query-immodules-3.0{,-32}
  rm "${pkgdir}"/usr/bin/{broadwayd,gtk-{encode-symbolic-svg,launch,update-icon-cache},gtk3-{demo,demo-application,icon-browser,widget-factory}}
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
}

# vim: ts=2 sw=2 et:
