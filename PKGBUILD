# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Colm Hickey <colmohici@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=lib32-zeromq
pkgver=4.2.2
pkgrel=2
pkgdesc='Distributed messaging'
arch=('x86_64')
url='http://www.zeromq.org'
license=('LGPL')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-libpgm' 'lib32-libsodium'
         'zeromq')
makedepends=('asciidoc' 'gcc-multilib' 'xmlto')
source=("https://github.com/zeromq/libzmq/releases/download/v${pkgver}/zeromq-${pkgver}.tar.gz")
sha256sums=('5b23f4ca9ef545d5bd3af55d305765e3ee06b986263b31967435d285a3e6df6b')

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
