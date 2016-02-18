# Maintainer: Peter Pickford <arch@netremedies.ca>
# Contributor: Deon Spengler <deon.spengler@gmail.com> Dieter Rethmeyer <Dieter@rethmeyers.de>, Peter Pickford <arch@netremedies.ca>
# derived from arch mgetty
_origpkgname=mgetty
pkgname=mgetty-vgetty
pkgver=1.1.37
pkgrel=1
pkgdesc="vgetty - voice extension to the mgetty+sendfax program."
url="http://mgetty.greenie.net/"
license=('GPL')
arch=('i686' 'x86_64')
install=mgetty.install
depends=('glibc' 'logrotate' 'udev' 'netpbm')
makedepends=('make')
source=(http://fossies.org/unix/misc/$_origpkgname$pkgver-Jun05.tar.gz
	config.patch
	policy.patch
        mgetty_cid.patch
	90-mgetty.rules
	vgetty@.service
	faxrunqd@.service
        mgetty.install
	)
md5sums=('4df2eb47bd6d5318d3d642572ab56e51'
         '7eb629cac6ba2dce360a857f0e88c31f'
         '5556e5e88c784e75acb14ab998d7eb1a'
         'c160d250f98140ddc3818fef34e940b6'
         '4b73a5654db86a34a8dccdf5f55c699c'
         '3c1b50a8bebf9a2d6e4252fce79f4c34'
         '9aa2b3ff3ff4daa5ed018d4fac8d86b4'
         '8cb2c82dba8e8439832b021b175c83f5')

build() {
  cd $srcdir/$_origpkgname-$pkgver
  cp policy.h-dist policy.h
  patch -Np0 -i ../../config.patch || return 1
  patch -Np0 -i ../../policy.patch || return 1
  patch -Np0 -i ../../mgetty_cid.patch || return 1
  make clean 
  make all vgetty || return 1
  #make testdisk
  #make test
}

package() {
  cd $srcdir/$_origpkgname-$pkgver
  # add directories needed by install
  mkdir -p $pkgdir/var/spool
  mkdir -p $pkgdir/usr/share/man
  make prefix=$pkgdir/usr spool=$pkgdir/var/spool CONFDIR=$pkgdir/etc/mgetty+sendfax FAX_OUT_USER=0 install install-vgetty|| return 1
  install -D -m644 $srcdir/90-mgetty.rules $pkgdir/etc/udev/rules.d/90-mgetty.rules
  install -D -m644 $srcdir/vgetty@.service $pkgdir/usr/lib/systemd/system/vgetty@.service
  install -D -m644 $srcdir/faxrunqd@.service $pkgdir/usr/lib/systemd/system/faxrunqd@.service
  rm -f $pkgdir/usr/bin/g3topbm
}
