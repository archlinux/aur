# Maintainer:m Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=lib32-at-spi2-core
pkgver=2.16.0
pkgrel=1
pkgdesc='Protocol definitions and daemon for D-Bus at-spi'
arch=('x86_64')
url='http://www.gnome.org'
license=('GPL2')
depends=('at-spi2-core' 'lib32-glib2' 'lib32-libxtst')
makedepends=('gcc-multilib' 'gobject-introspection' 'intltool')
source=("http://download.gnome.org/sources/at-spi2-core/${pkgver%.*}/at-spi2-core-${pkgver}.tar.xz")
sha256sums=('1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b1a74d0')

prepare() {
  cd at-spi2-core-${pkgver}

  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf -fi
}

build() {
  cd at-spi2-core-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --libexecdir='/usr/lib32/at-spi2-core' \
    --sysconfdir='/etc' \
    --disable-xevie
  make
}

package() {
  cd at-spi2-core-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}
}

# vim: ts=2 sw=2 et:
