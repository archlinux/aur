# Maintainer: Mingkai Dong <mingkaidong@gmail.com>

pkgname=jerasure-git
pkgver=20180206
pkgrel=1
pkgdesc="C implementation of Reed-Solomon coding"
arch=('i686' 'x86_64')
url="https://github.com/tsuraan/Jerasure"
license=('custom')
depends=('gf-complete-git')
makedepends=('git' 'make' 'gcc')
source=()
md5sums=()

_gitroot="https://github.com/tsuraan/Jerasure.git"
_gitbranch=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitbranch ] ; then
    cd $_gitbranch && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitbranch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting automake..."

  cd "$srcdir/$_gitbranch"
  autoreconf --force --install
  ./configure --prefix=/usr LD_LIBRARY_PATH=/usr/lib

  msg "Starting make..."

  #
  # BUILD HERE
  #
  make
}

package() {
  cd "$srcdir/$_gitbranch"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/$_gitbranch/include/cauchy.h" "$pkgdir/usr/include/"
  install -Dm644 "$srcdir/$_gitbranch/include/galois.h" "$pkgdir/usr/include/"
  install -Dm644 "$srcdir/$_gitbranch/include/liberation.h" "$pkgdir/usr/include/"
  install -Dm644 "$srcdir/$_gitbranch/include/reed_sol.h" "$pkgdir/usr/include/"
  rm -rf "$srcdir/$_gitbranch"
}
