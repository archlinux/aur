# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=z3-stable-git
pkgver=20160205
pkgrel=1
pkgdesc="Z3 is a high-performance theorem prover being developed at Microsoft Research (built from Github)"
arch=('i686' 'x86_64')
url="https://github.com/Z3Prover/z3"
license=('MIT')
makedepends=('python' 'git')
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

  Z3_INSTALL_INCLUDE_DIR="include/z3" \
  python scripts/mk_make.py \
    --prefix="$pkgdir/usr" \
    --pypkgdir="$pkgdir/usr/lib/python3.5/site-packages" \
    --python \
    --java \
    --ml

  cd "$srcdir/$_gitname/build"
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make install
}
