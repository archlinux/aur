# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: GordonGR <ntheo1979@gmail.com>

pkgname=lib32-gtk3
pkgver=3.16.4
pkgrel=1
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
source=("http://ftp.gnome.org/pub/gnome/sources/gtk+/${pkgver:0:4}/gtk+-$pkgver.tar.xz")
sha256sums=('1ee5dbd7a4cb81a91eaa1b7ae64ba5a3eab6a3c0a764155583ab96524590fc8e')

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
