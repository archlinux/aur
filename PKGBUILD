# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar-git
pkgver=20151009
pkgrel=1
pkgdesc='An ML-like language with a type system for program verification'
url='http://research.microsoft.com/en-us/projects/fstar/'
license=('Apache')
depends=('mono>=4.0.3.20' 'z3')
makedepends=('fsharp' 'ocaml' 'opam')
provides=('fstar')
arch=('i686' 'x86_64')
source="fstar"
md5sums=('a942264ee14c8645f575e26aad30f0a2')

_gitroot="https://github.com/FStarLang/FStar"
_gitname="FStar"
build() {
  cd $startdir/src
  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd $startdir/src/$_gitname

  make -C src

  opam init -n
  eval $(opam config env)
  opam install ocamlfind batteries

  make -C src ocaml
  make -C src/ocaml-output
}

package() {
  cd $startdir/src/$_gitname

  install -d -m755 $pkgdir/opt/fstar
  install -D -m755 $startdir/fstar $pkgdir/usr/bin/fstar
  cp -r bin/ doc/ examples/ lib/ $pkgdir/opt/fstar
}
