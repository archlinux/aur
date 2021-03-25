# Maintainer: Deon Spengler <deon.spengler@gmail.com>
# Contributor: Dieter Rethmeyer <Dieter@rethmeyers.de>
pkgname=mgetty
pkgver=1.2.1
pkgrel=1
pkgdesc="Mgetty is a versatile program to handle all aspects of a modem under Unix."
url="http://mgetty.greenie.net/"
license=('GPL')
arch=('i686' 'x86_64' 'aarch64')
depends=('glibc' 'logrotate' 'udev' 'netpbm')
makedepends=('make')
install=mgetty.install
source=(ftp://mgetty.greenie.net/pub/mgetty/source/1.2/${pkgname}-${pkgver}.tar.gz
	    Makefile.patch
	    config.patch
	    policy.patch
            aarch64.patch
            errno.patch
	    90-mgetty.rules
            mgetty@.service)

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cp policy.h-dist policy.h
  patch -Np0 -i ../../config.patch
  patch -Np0 -i ../../policy.patch
  patch -p1 < ../../aarch64.patch
  patch -p1 < ../../errno.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make -j1 # Makefile is broken for parallel make: sedscript not generated in time
  chmod +x ./mkidirs 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/var/spool
  mkdir -p $pkgdir/usr/bin
  make prefix=$pkgdir/usr spool=$pkgdir/var/spool CONFDIR=$pkgdir/etc/mgetty+sendfax FAX_OUT_USER=0 install
  rm -f $pkgdir/usr/bin/g3topbm
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  rm -r $pkgdir/usr/sbin
  install -D -m644 $srcdir/90-mgetty.rules $pkgdir/etc/udev/rules.d/90-mgetty.rules
  install -D -m644 $srcdir/mgetty@.service $pkgdir/usr/lib/systemd/system/mgetty@.service
}
md5sums=('41a18c46845ff058d2848bc1aab6ab3b'
         'eaa2b17d77ca099ebb7e92cf2006f6c1'
         'c0f9ed08a1e9877f972cbd8a00cfd932'
         'ed732db6dde0859af7acb48e9c7aa136'
         '8756ace492fb86ba70ed3a5c4b980b0b'
         '86c3502f8bb05c240edb5cad0e11de9c'
         '4b73a5654db86a34a8dccdf5f55c699c'
         'cbc70329924235e8f2e6302c859d59a6')
