# Maintainer: Kyle Keen <keenerd at gmail dot com>
# Contributor: Gael Lane Lepine <galalep at gmail dot com>

pkgname=hd-idle-cvs
pkgver=20140406
pkgrel=1
pkgdesc="a utility program for spinning-down external disks"
arch=('i686' 'x86_64')
url="http://hd-idle.sourceforge.net"
license=('GPL')
depends=('glibc')
makedepends=('cvs')
backup=(etc/conf.d/hd-idle)
provides=('hd-idle')
conflicts=('hd-idle')
source=("hd-idle.service")
md5sums=('6e9162a075a7a99c3d10e9cde9c499df') 

_cvsroot=":pserver:anonymous@hd-idle.cvs.sourceforge.net:/cvsroot/hd-idle"
_cvsmod="hd-idle"

prepare() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
}

pkgver() {
  cd "$srcdir/$_cvsmod-build"
  # bleh
  cvs -q log | grep '^date:' | sort | tail -n 1 | cut -d ' ' -f 2 | tr -d '/'
}

build() {
  cd "$srcdir/$_cvsmod-build"
  sed -i 's|/sbin|/bin|' Makefile
  make
}


package() {
  cd "$srcdir/$_cvsmod-build"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 scripts/debian/default/hd-idle "$pkgdir/etc/conf.d/hd-idle"
  install -Dm644 ../hd-idle.service "$pkgdir/usr/lib/systemd/system/hd-idle.service"

  # must be done last, somehow breaks $pkgdir permissions
  make TARGET_DIR="$pkgdir/usr" install

}
