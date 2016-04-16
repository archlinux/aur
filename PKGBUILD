
# Contributor: Paolo Herms
pkgname=why3-git
pkgver=20120419
pkgrel=1
pkgdesc="The next generation of the former software verification platform Why"
arch=(x86_64 i686)
url="http://why3.gforge.inria.fr/"
license=('GPL')
depends=('gtksourceview2')
makedepends=('ocaml' 'ocaml-sqlite3' 'lablgtk2' 'git')
conflicts=('why3')

_gitroot="git://scm.gforge.inria.fr/why3/why3.git"
_gitname="why3"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname && 
    cd $_gitname
  fi

  [[ -e "$srcdir"/NOCONFIGURE ]] && msg "Skipping configure - remove src/NOCONFIGURE to force it" || { 
      autoconf &&
      ./configure --prefix=/usr &&
      echo "Remove this file to force ./configure" > "$srcdir"/NOCONFIGURE ||
      return 1
  }

  make || return 1
  make DESTDIR="$pkgdir" OCAMLLIB="$pkgdir"/usr/lib/ocaml install install-lib
}
