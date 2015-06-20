# Maintainer: josephgbr <rafael.f.f1@gmail.com>
_pkgbase=lzo
pkgname=lib32-$_pkgbase
pkgver=2.08
pkgrel=1
pkgdesc="Portable lossless data compression library (32 bit)"
arch=('x86_64')
url="http://www.oberhumer.com/opensource/lzo"
license=('GPL')
depends=('lib32-glibc' $_pkgbase)
makedepends=('gcc-multilib')
source=(http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz)
options=(!libtool)
md5sums=('fcec64c26a0f4f4901468f360029678f')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd lzo-${pkgver}
  ./configure --prefix=/usr --enable-shared --libdir=/usr/lib32
  make

  # build minilzo
  gcc $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
  gcc $LDFLAGS -g -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
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
