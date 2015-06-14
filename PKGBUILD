#Maintainer : gls < ghostlovescorebg at gmail dot com >

pkgname=csync2
pkgver=1.34
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="Asynchronous cluster syncronisation tool based on librsync and inspired by Unison"
url="http://oss.linbit.com/csync2/"
license=('GPL')
depends=(librsync sqlite2 libgcrypt libgpg-error gnutls libtasn1)
source=(http://oss.linbit.com/csync2/$pkgname-$pkgver.tar.gz)
backup=(etc/csync2.cfg)
md5sums=('efc8a3548996b79cef2ad76af5e93cd8')

build() {

  cd "$srcdir/$pkgname-$pkgver"
  sed -e 's/\-1.7//g' -i ./autogen.sh 

  #AM_PATH_LIBGNUTLS does not exist any more
  sed -ie 's/.*AM_PATH_LIBGNUTLS.*/PKG_CHECK_MODULES([LIBGNUTLS], [gnutls >= 1.2.0], have_gnutls=yes, have_gnutls=no)/g' configure.ac
  sed -ie 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac

  ./autogen.sh 
  ./configure --prefix=/usr --bindir=/bin
  make 

  # By default, csync2 tries to install binary to /usr/bin/sbin.
  # This line changes Makefile and tells compiler to put binary in /usr/bin.
  sed -ie 's/sbindir\ =\ \${exec_prefix}\/sbin/sbindir\ =\ \${exec_prefix}\/bin/g' Makefile

  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '*.la' -exec rm {} \;
}
# vim:set ts=2 sw=2 et:
