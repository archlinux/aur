#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=db4.6
pkgver=4.6.21
pkgrel=3
pkgdesc="The Berkeley DB embedded database system 4.6"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)
sha512sums=('8118218e2eaf9d22e445e551ef184f4610406b81f9257794d14f637d9d12a51a007166b48bf820140c5be287ef61d22a62a16f7702f0d29f385108c40b11ce43')

build() {
  cd ${srcdir}/db-${pkgver}/

  cd build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --disable-static --enable-cxx
  make LIBSO_LIBS=-lpthread
  make prefix=${pkgdir}/usr \
       includedir=${pkgdir}/usr/include/db4.6 install

  rm -rf ${pkgdir}/usr/docs
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}.so
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}-4.so

  cd ${pkgdir}/usr/bin

  for i in *; do
    mv $i db4.6_${i/db_/}
  done

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/db-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
