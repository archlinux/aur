# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Maxime Arthaud <maxime@arthaud.me>

_srcname=ocamlgraph
_pkgname=ocaml-$_srcname
pkgname="${_pkgname}-git"
pkgver=2.1.0.r14.g75533f6
pkgrel=1
pkgdesc="Graph library for OCaml"
arch=('x86_64')
url="https://github.com/backtracking/ocamlgraph"
license=('LGPL-2.1-only')
depends=('glibc' 'ocaml-stdlib-shims' 'ocaml>=4.08.0')
makedepends=('dune>=2.0' 'git' 'ocaml>=4.08.0')
checkdepends=('ocaml-graphics')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
b2sums=('SKIP')

check() {
    cd "$srcdir/$_srcname"
    dune runtest --release
}

build() {
    cd "$srcdir/$_srcname"
    dune build -p $_srcname
}

package() {
    cd "$srcdir/ocamlgraph"

    DESTDIR="${pkgdir}" dune install \
	   --prefix "/usr" \
	   --libdir "/usr/lib/ocaml" \
	   --docdir "/usr/share/doc" \
	   -p ${_srcname}

    mv $pkgdir/usr/share/doc/$_srcname $pkgdir/usr/share/doc/$pkgname
}

pkgver() {
    cd "$srcdir/$_srcname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
