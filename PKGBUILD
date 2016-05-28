# Maintainer: rafaelff <rafaelff@gnome.org>

_pkgbase=lzo
pkgname=lib32-$_pkgbase
pkgver=2.09
pkgrel=2
pkgdesc="Portable lossless data compression library (32 bit)"
arch=('x86_64')
url="http://www.oberhumer.com/opensource/lzo"
license=('GPL')
depends=('lib32-glibc' $_pkgbase)
makedepends=('gcc-multilib')
source=(http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz)
options=(!libtool)
sha1sums=('e2a60aca818836181e7e6f8c4f2c323aca6ac057')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd lzo-${pkgver}
  ./configure --prefix=/usr --enable-shared --libdir=/usr/lib32
  make

  # build minilzo
  $CC $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
  $CC $LDFLAGS -g -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
}

check() {
  cd lzo-${pkgver}
  make test # Larger test
  make check
}

package() {
  cd lzo-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}

  # install minilzo
  install -m 755 libminilzo.so.0 "${pkgdir}"/usr/lib32
  ln -s libminilzo.so.0 "${pkgdir}"/usr/lib32/libminilzo.so
}
