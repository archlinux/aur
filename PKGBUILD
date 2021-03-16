# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=lib32-libgudev-nosystemd
pkgver=236
pkgrel=1
pkgdesc='GObject bindings for libudev'
arch=(x86_64)
url=https://wiki.gnome.org/Projects/libgudev
license=(LGPL2.1)
depends=(lib32-glib2 libgudev)
makedepends=(
  git
  gtk-doc
  python
)
provides=(libgudev-1.0.so lib32-libgudev)
conflicts=(lib32-libgudev)
source=(git+https://gitlab.gnome.org/GNOME/libgudev.git#tag=${pkgver})
sha256sums=(SKIP)

prepare() {
  cd libgudev

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libgudev

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --disable-gtk-doc \
    --disable-umockdev
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libgudev install
  rm -rf ${pkgdir}/usr/{include,share}
}

# vim: ts=2 sw=2 et:

