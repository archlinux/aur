# Maintainer: libele <libele@disroot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-db
pkgver=6.2.32
pkgrel=1
pkgdesc='The Berkeley DB embedded database system'
arch=('x86_64')
url='https://www.oracle.com/technology/software/products/berkeley-db/index.html'
license=('custom')
depends=("db=${pkgver}" 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("https://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz")
sha256sums=('a9c5e2b004a5777aa03510cfe5cd766a4a3b777713406b02809c17c8e0e7a8fb')

build() {
  cd db-${pkgver}/build_unix

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ../dist/configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-compat185 \
    --enable-cxx \
    --enable-dbm \
    --enable-shared \
    --disable-atomicsupport
  make LIBSO_LIBS='-lpthread'
}

package() {
  cd db-${pkgver}/build_unix

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,docs,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s db "${pkgdir}"/usr/share/licenses/lib32-db
}

# vim: ts=2 sw=2 et:
