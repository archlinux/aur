# Current maintainer: Raansu <Gero3977@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
pkgname=db4.8
pkgver=4.8.30
pkgrel=4
pkgdesc="The Berkeley DB embedded database system 4.8"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz)

package() {
  cd ${srcdir}/db-${pkgver}/

  cd build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --disable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
  make prefix=${pkgdir}/usr \
       includedir=${pkgdir}/usr/include/db4.8 install

  rm -rf ${pkgdir}/usr/docs
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}.so
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}-4.so

  cd ${pkgdir}/usr/bin
  for i in *; do
    mv $i db4.8_${i/db_/}
  done
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 ${srcdir}/db-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('f80022099c5742cd179343556179aa8c')
sha1sums=('ab36c170dda5b2ceaad3915ced96e41c6b7e493c')

