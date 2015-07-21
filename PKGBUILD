# Maintainer: Deon Spengler <deon.spengler@gmail.com>
# Contributor: Dieter Rethmeyer <Dieter@rethmeyers.de>
pkgname=mgetty
pkgver=1.1.37
pkgrel=5
pkgdesc="Mgetty is a versatile program to handle all aspects of a modem under Unix."
url="http://mgetty.greenie.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc' 'logrotate' 'udev' 'netpbm')
makedepends=('make')
install=mgetty.install
source=(http://fossies.org/unix/misc/$pkgname$pkgver-Jun05.tar.gz
	    Makefile.patch
	    config.patch
	    policy.patch
	    90-mgetty.rules
        mgetty@.service)
md5sums=('4df2eb47bd6d5318d3d642572ab56e51'
         'eaa2b17d77ca099ebb7e92cf2006f6c1'
         'd40de3f241a2851f091e0046cb7f28c0'
         '5556e5e88c784e75acb14ab998d7eb1a'
         '4b73a5654db86a34a8dccdf5f55c699c'
         'cbc70329924235e8f2e6302c859d59a6')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp policy.h-dist policy.h
  patch -Np0 -i ../../config.patch
  patch -Np0 -i ../../policy.patch
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/var/spool
  make prefix=$pkgdir/usr spool=$pkgdir/var/spool CONFDIR=$pkgdir/etc/mgetty+sendfax FAX_OUT_USER=0 install
  rm -f $pkgdir/usr/bin/g3topbm
  install -D -m644 $srcdir/90-mgetty.rules $pkgdir/etc/udev/rules.d/90-mgetty.rules
  install -D -m644 $srcdir/mgetty@.service $pkgdir/usr/lib/systemd/system/mgetty@.service
}
