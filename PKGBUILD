# Maintainer: lazant <a.l.i.c.e at outlook.com>
pkgname='sctk'
pkgdesc='Speech Recognition Scoring Toolkit (SCTK)'
pkgver=2.4.10
_tag='20151007-1312Z'
pkgrel=2
arch=('i686' 'x86_64')
url='https://www.nist.gov/itl/iad/mig/tools'
license=('APACHE')
source=("ftp://jaguar.ncsl.nist.gov/pub/sctk-${pkgver}-${_tag}.tar.bz2")
md5sums=('dd01ad49a33486a4754655d06177f646')

build () {
  cd $srcdir/$pkgname-$pkgver

  make config

  if  [ "$HOSTTYPE" == "x86_64" ];
  then
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/asclite/core/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/asclite/test/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/rfilter1/makefile
    sed -i "s/^CFLAGS = -g -Os/CFLAGS = -g -Os -m64/g" src/sclite/makefile
  fi
  sed '/^DEFS/s/ -Dsize_t=unsigned//' -i src/sclite/makefile

  make all
}

package () {
  cd $srcdir/$pkgname-$pkgver
  
  mkdir -p $pkgdir/usr/bin
  make prefix="$pkgdir/usr" install

  mkdir -p $pkgdir/usr/share/doc/sctk
  make doc
  cp -r doc/* $pkgdir/usr/share/doc/sctk
}
