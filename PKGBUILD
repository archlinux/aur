# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pcc-cvs
pkgver=20231021
pkgrel=1
pkgdesc="A Portable C Compiler."
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('custom')
#makedepends=('bison' 'flex' 'cvs')
makedepends=('bison' 'flex' 'git')
options=('!lto')
depends=('pcc-libs')
provides=(pcc)
conflicts=(pcc)
source=($pkgname::git+https://repo.or.cz/pcc.git license)
md5sums=('SKIP' '51f6cc02b26af53f26cfe87494ca5c87')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --date=format:"%Y%m%d" --format="%ad"
}

#_cvsroot=":pserver:anonymous@pcc.ludd.ltu.se:/cvsroot"
#_cvsmod="pcc"
build() {
#  cd "$srcdir"
  cd "$srcdir/$pkgname"

#  msg "Connecting to pcc.ludd.ltu.se CVS server (module $_cvsmod)...."
#  if [ -d $_cvsmod/CVS ]; then
#    cd $_cvsmod
#    cvs -z3 update -d
#  else
#    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
#    cd $_cvsmod
#  fi

#  msg "CVS checkout done or server timeout"
#  msg "Starting make..."

#  rm -rf "$srcdir/$_cvsmod-build"
#  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
#  cd "$srcdir/$_cvsmod-build"

  export CFLAGS+=" -fcommon -Wno-int-conversion "

  ./configure --prefix=/usr --libexecdir=/usr/lib/pcc || return 1

  make CC=gcc || return 1
}

package() {
#  cd "$srcdir/$_cvsmod-build"
  cd "$srcdir/$pkgname"

  make DESTDIR=$pkgdir install || return 1
  cd "$pkgdir/usr/share/man/man1"

  mv ${pkgdir}/usr/share/man/man1/cpp.1 ${pkgdir}/usr/share/man/man1/cpp.1pcc

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
