# Maintainer: Peter Pickford <arch@netremedies.ca>
# Contributor: Deon Spengler <deon.spengler@gmail.com> Dieter Rethmeyer <Dieter@rethmeyers.de>, Peter Pickford <arch@netremedies.ca>
# derived from arch mgetty
_origpkgname=mgetty
pkgname=mgetty-vgetty-git
pkgver=1.1.37.r2.gdd9f7f5
pkgrel=1
pkgdesc="vgetty - voice extension to the mgetty+sendfax program."
url="http://mgetty.greenie.net/"
license=('GPL')
arch=('i686' 'x86_64')
install=mgetty.install
depends=('glibc' 'logrotate' 'udev' 'netpbm')
makedepends=('make')
conflicts=('mgetty-vgetty')
provides=('mgetty-vgetty')
source=('git+https://github.com/ppickfor/mgetty.git'
	config.patch
	90-mgetty.rules
	vgetty@.service
	faxrunqd@.service
        mgetty.install
	)
md5sums=('SKIP'
         '7eb629cac6ba2dce360a857f0e88c31f'
         '4b73a5654db86a34a8dccdf5f55c699c'
         '3c1b50a8bebf9a2d6e4252fce79f4c34'
         '9aa2b3ff3ff4daa5ed018d4fac8d86b4'
         '8cb2c82dba8e8439832b021b175c83f5')

build() {
  cd "$srcdir//${_origpkgname}"
  cp policy.h-dist policy.h
  patch -Np0 -i ../../config.patch || return 1
  make clean 
  make all vgetty || return 1
}
check() {
  cd "$srcdir//${_origpkgname}"
  make testdisk
  make test
}

package() {
  cd "$srcdir//${_origpkgname}"
  # add directories needed by install
  mkdir -p $pkgdir/var/spool
  mkdir -p $pkgdir/usr/share/man
  make prefix=$pkgdir/usr spool=$pkgdir/var/spool CONFDIR=$pkgdir/etc/mgetty+sendfax FAX_OUT_USER=0 install install-vgetty|| return 1
  install -D -m644 $srcdir/90-mgetty.rules $pkgdir/etc/udev/rules.d/90-mgetty.rules
  install -D -m644 $srcdir/vgetty@.service $pkgdir/usr/lib/systemd/system/vgetty@.service
  install -D -m644 $srcdir/faxrunqd@.service $pkgdir/usr/lib/systemd/system/faxrunqd@.service
  rm -f $pkgdir/usr/bin/g3topbm
}
pkgver() {
  cd "$srcdir//${_origpkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
