# Maintainer : gls < ghostlovescorebg at gmail dot com >

pkgname=csync2
pkgver=2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Asynchronous cluster syncronisation tool based on librsync and inspired by Unison"
url="http://oss.linbit.com/csync2/"
license=('GPL')
depends=(librsync sqlite2 libgcrypt libgpg-error gnutls libtasn1)
source=(http://oss.linbit.com/csync2/${pkgname}-${pkgver}.tar.gz)
sha256sums=('11cb37380fb185bce0c22b804fec9b01c385d9d83cc528cfd48d748453834fa2')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}

  sed -ie 's/.*AM_PATH_LIBGNUTLS.*/PKG_CHECK_MODULES([LIBGNUTLS], [gnutls >= 1.2.0], have_gnutls=yes, have_gnutls=no)/g' configure.ac
  sed -ie 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac

  ./configure --prefix=/usr --bindir=/bin --disable-gnutls

  sed -ie 's/aclocal-1.14/aclocal-1.15/g' Makefile
  sed -ie 's/automake-1.14/automake-1.15/g' Makefile

  make 

}

package() {

  cd ${srcdir}/${pkgname}-${pkgver}
  sed -ie 's/sbindir\ =\ \${exec_prefix}\/sbin/sbindir\ =\ \${exec_prefix}\/bin/g' Makefile
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name '*.la' -exec rm {} \;

}
# vim:set ts=2 sw=2 et:
