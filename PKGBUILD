# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_ocamlname=dot-merlin-reader
_basename=ocaml-$_ocamlname
pkgname=$_basename-git
_pkgver=5.6-504
pkgver=v5.6.504.r38.gd6fd03b # No hypen in $pkgver
pkgrel=1
pkgdesc="Reads config files for merlin"
arch=('x86_64')
depends=('glibc' 'ocaml' 'ocaml-csexp' 'ocaml-merlin-lib')
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
    dune build -p $_ocamlname
}

check() {
    cd $srcdir/$pkgname
    dune test --release --verbose

}
package() {
    cd $srcdir/$pkgname

    DESTDIR="${pkgdir}" dune install -p $_ocamlname \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc/$pkgname"

    install -d $pkgdir/usr/share/licenses/$pkgname/
    mv $pkgdir/usr/share/doc/$pkgname/$_ocamlname/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}
