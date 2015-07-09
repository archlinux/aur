# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor:Ionut Biru <ibiru@archlinux.org> 

pkgname=lib32-at-spi2-atk
pkgver=2.16.0
pkgrel=1
pkgdesc='A GTK+ module that bridges ATK to D-Bus at-spi'
arch=('x86_64')
url='https://wiki.gnome.org/Accessibility'
license=('GPL2')
depends=('at-spi2-atk' 'lib32-at-spi2-core' 'lib32-atk')
makedepends=('gcc-multilib' 'intltool')
source=("http://download.gnome.org/sources/at-spi2-atk/${pkgver%.*}/at-spi2-atk-${pkgver}.tar.xz")
sha256sums=('78efc45ec36383bf785f8636e64a8d866defeb020e00a08f92978f1fc3772ff9')

prepare() {
  cd at-spi2-atk-${pkgver}

  sed '/AC_PATH_XTRA/d' -i configure.ac
  autoreconf -fi
}

build() {
  cd at-spi2-atk-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sysconfdir='/etc' \
    --disable-schemas-compile
  make
}

package() {
  cd at-spi2-atk-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,lib32/gnome-settings-daemon-3.0,share}
}

# vim: ts=2 sw=2 et:
