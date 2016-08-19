# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Colm Hickey <colmohici@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=lib32-zeromq
pkgver=4.1.5
pkgrel=1
pkgdesc='Distributed messaging'
arch=('x86_64')
url='http://www.zeromq.org'
license=('LGPL')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libpgm' 'lib32-libsodium'
         'zeromq')
makedepends=('asciidoc' 'gcc-multilib' 'xmlto')
source=("https://github.com/zeromq/zeromq4-1/releases/download/v${pkgver}/zeromq-${pkgver}.tar.gz")
sha256sums=('04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf')

prepare() {
  cd zeromq-${pkgver}

  sed -i 's/libzmq_werror="yes"/libzmq_werror="no"/' configure
}

build() {
  cd zeromq-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static \
    --with-libsodium \
    --with-pgm \
    --without-documentation
  make
}

package() {
  cd zeromq-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

# vim: ts=2 sw=2 et:
