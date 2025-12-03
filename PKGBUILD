# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_basename=merlin
pkgname=$_basename-git
_pkgver=5.6-504
pkgver=v5.6.504.r38.gd6fd03b # No hypen in $pkgver
pkgrel=1
pkgdesc="Low-level compiler interfaces and the standard higher-level merlin protocol"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'python' 'zstd')
makedepends=('dune' 'git' 'ocaml-alcotest')
checkdepends=('jq' 'ocaml-menhir')
url="https://ocaml.github.io/merlin"
license=('MIT')
source=("${pkgname}::git+https://github.com/ocaml/merlin.git")
b2sums=('SKIP')
options=('!strip')

pkgver() {
    cd $srcdir/$pkgname
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C $srcdir/$pkgname clean -dxf
}

build() {
    cd $srcdir/$pkgname
    dune build -p merlin
}

check() {
    cd $srcdir/$pkgname
    dune test --release --verbose

}
package() {
    cd $srcdir/$pkgname

    DESTDIR="${pkgdir}" dune install -p merlin \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/merlin/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
