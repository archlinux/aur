pkgname=ocaml-psmt2-frontend-git
pkgver=0.1
pkgrel=1
pkgdesc="A simple parser and type-checker for polomorphic extension of the SMT-LIB 2 language"
arch=('i686' 'x86_64')
url="https://github.com/Coquera/psmt2-frontend"
license=('Apache2')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-menhir')
options=(!strip staticlibs)
provides=('ocaml-psmt2-frontend')
conflicts=('ocaml-psmt2-frontend')

# TODO: update from Coquera to mewpull when PR #4 is merged.
_gitroot="https://github.com/Coquera/psmt2-frontend.git"
_gitname="psmt2-frontend"

build() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."


  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir/usr/lib/ocaml/psmt2-frontend"
  make DESTDIR="$pkgdir/usr" LIBDIR="$pkgdir/usr/lib/ocaml" install
}
