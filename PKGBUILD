# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pcc-libs-cvs
pkgver=20170701
pkgrel=1
pkgdesc="Libraries for the Portable C Compiler."
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom')
provides=(pcc-libs)
conflicts=(pcc-libs)
makedepends=('cvs')
source=(license)
md5sums=('51f6cc02b26af53f26cfe87494ca5c87')

pkgver() {
  date '+%Y%m%d'
}

_cvsroot=":pserver:anonymous@pcc.ludd.ltu.se:/cvsroot"
_cvsmod="pcc-libs"
build() {
  cd "$srcdir"

  msg "Connecting to pcc.ludd.ltu.se CVS server (module $_cvsmod)...."
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
  cd "$srcdir/$_cvsmod-build"

  ./configure --prefix=/usr || return 1

  make CC=gcc || return 1
}

package() {
  cd "$srcdir/$_cvsmod-build"

  make DESTDIR=$pkgdir install || return 1

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
