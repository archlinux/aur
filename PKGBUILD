# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=z3-stable-git
pkgver=20150513
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research (built from Github)"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
makedepends=('python2' 'git')
conflicts=('z3-bin')

_gitroot="https://github.com/Z3Prover/z3"
_gitname="z3-stable"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  cd "$srcdir/$_gitname"

  python2 scripts/mk_make.py # --prefix="$pkgdir"

  cd "$srcdir/$_gitname/build"
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/include/z3"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/lib/python2.7/site-packages"

  cd "$srcdir/$_gitname/src/api"
  cp `find . -name "z3*.h"` "$pkgdir/usr/include/z3"
  cd "$srcdir/$_gitname/src/api/c++"
  cp `find . -name "z3*.h"` "$pkgdir/usr/include/z3"

  cd "$srcdir/$_gitname/build"
  cp `find . -name "z3"` "$pkgdir/usr/bin/"
  cp `find . -name "libz3.*"` "$pkgdir/usr/lib"
  cp `find . -name "libz3.*"` "$pkgdir/usr/lib/python2.7/site-packages"
  cp `find . -name "z3*.pyc"` "$pkgdir/usr/lib/python2.7/site-packages"
}
