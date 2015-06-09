# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=ocaml-batteries-git
pkgver=20150609
pkgrel=1
pkgdesc="Batteries Included for OCaml"
arch=('i686' 'x86_64')
url="http://github.com/ocaml-batteries-team/batteries-included"
license=('LGPL')
depends=('ocaml' 'ocaml-camomile' 'ocaml-findlib')
makedepends=('git')
provides=('ocaml-batteries')
conflicts=('ocaml-batteries')
install=$pkgname.install

_gitroot="git://github.com/ocaml-batteries-team/batteries-included.git"
_gitname="batteries-included"

build () {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # build
  make all || return 1
  rm -f *.cma *.cmi *.cmo
  make doc || return 1
}

package () {
  destdir="$pkgdir/$(ocamlfind printconf destdir)"
  docdir="$pkgdir/usr/share/doc/ocaml-batteries"

  cd "$srcdir/$_gitname-build"

  mkdir -p "$destdir/batteries" "$destdir/stublibs" || return 1
  make DESTDIR="$destdir/" OCAMLFIND_DESTDIR="$destdir/" install || return 1
  make DOCROOT="$docdir/" install-doc || return 1
  install -Dm 644 ocamlinit "$docdir/ocamlinit" || return 1
}
